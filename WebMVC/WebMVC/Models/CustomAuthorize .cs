using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebMVC.Models
{
    //http://stackoverflow.com/questions/700166/allow-multiple-roles-to-access-controller-action
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, Inherited = true, AllowMultiple = true)]
    public class CustomAuthorize : AuthorizeAttribute
    {
        private string[] UserProfilesRequired { get; set; }

        public CustomAuthorize(params object[] userProfilesRequired)
        {
            if (userProfilesRequired.Any(p => p.GetType().BaseType != typeof(Enum)))
                throw new ArgumentException("userProfilesRequired");

            this.UserProfilesRequired = userProfilesRequired.Select(p => Enum.GetName(p.GetType(), p)).ToArray();
        }

        public override void OnAuthorization(AuthorizationContext context)
        {
            bool authorized = false;

            foreach (var role in this.UserProfilesRequired)
                if (HttpContext.Current.User.IsInRole(role))
                {
                    authorized = true;
                    break;
                }

            if (!authorized)
            {
                var url = new UrlHelper(context.RequestContext);
                var logonUrl = url.Action("Http", "Error", new { Id = 401, Area = "" });
                context.Result = new RedirectResult(logonUrl);

                return;
            }
        }
    }
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, Inherited = true, AllowMultiple = true)]
    class AuthorizeRoleAttribute : AuthorizeAttribute
    {
        public AuthorizeRoleAttribute(params MRoles[] roles)
        {
            this.Roles = string.Join(",", roles.Select(r => Enum.GetName(r.GetType(), r)));
        }
        protected override void HandleUnauthorizedRequest(System.Web.Mvc.AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                filterContext.Result = new RedirectToRouteResult(
                new RouteValueDictionary {
                  { "action", "Unauthorized" },
                  { "controller", "Home" }

                  }
              );
                
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(
                new RouteValueDictionary {
                  { "action", "Login" },
                  { "controller", "Admin" },
                  { "returnUrl", HttpContext.Current.Request.Url }
                  }
              );
            }
        }
    }
}
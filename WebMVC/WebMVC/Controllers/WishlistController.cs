using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC.Models;
using WebMVC.ViewModels;

namespace WebMVC.Controllers
{
    public class WishlistController : Controller
    {
        // GET: Wishlist
        private fteamwineEntities db = new fteamwineEntities();
        public ActionResult Index()
        {
            return View();
        }
        private string GetUserIP()
        {
            string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipList))
            {
                return ipList.Split(',')[0];
            }
            return Request.ServerVariables["REMOTE_ADDR"];
        }
        public ActionResult AddToCart(int id)
        {
            var rsr = new Result
            {
                error = -1,
                msg = "Vui lòng đăng nhập"
            };
            if (!checkLogin() || Request.Cookies[FormsAuthentication.FormsCookieName]== null)
            {
                
                return Json(rsr);
            }
            if (Request.Cookies[FormsAuthentication.FormsCookieName] == null)
            {
                return Json(rsr);
            }
            string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
            if(username == null || username.Length <= 0)
            {
                return Json(rsr);
            }
            User us = db.Users.SingleOrDefault(u => u.TenDangNhap == username);
            if(us == null)
            {
                return Json(rsr);
            }
            var addedProduct = db.Products.Where(c => c.ID == id).First();
            var cart = WishlistCollection.GetCart(this.HttpContext);
            if(cart.GetTotal(us.ID) >= 10)
            {
                return Json(new Result(-2,"limit"));
            }
            cart.AddToCart(addedProduct,us.ID, GetUserIP());

            var rs = new Result
            {
                error = 0,
                msg = ""
            };
            return Json(rs);
            
        }


        public PartialViewResult WishlistInHeader()
        {
            WishlistView w = new WishlistView();
            var c = WishlistCollection.GetCart(this.HttpContext);

            if(Request.Cookies[FormsAuthentication.FormsCookieName] == null)
            {
                return PartialView(w);
            }

            string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
            if (username == null || username.Length <= 0)
            {
                return PartialView(w);
            }
            User us = db.Users.SingleOrDefault(u => u.TenDangNhap == username);
            if (us == null || c.GetCartItems(us.ID) == null)
            {
                return PartialView(w);
            }

            foreach (var item in c.GetCartItems(us.ID))
            {
                Product p = db.Products.SingleOrDefault(sp => sp.ID == item.idsanpham);
                if (p == null) continue;
                w.WItems.Add(p);
            }
            w.WTotal = w.WItems.Count();
            return PartialView(w);
        }

        public bool checkLogin()
        {

            String returnUrl = Request.Url.ToString();
            if (!FormsAuthentication.CookiesSupported)
            {
                return false;
            }
            if (Request.Cookies[FormsAuthentication.FormsCookieName] == null)
            {
                return false;
            }

            try
            {
                string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                string roles = string.Empty;
                // find the role
                string[] lrol = Roles.GetRolesForUser(username);
                if (roles.Length < 0)
                {
                    return false;
                }
                MembershipUserCollection l = Membership.FindUsersByName(username);
                foreach (MembershipUser us in l)
                {
                    if (us.IsApproved)
                        return true;

                }
            }
            catch
            {
                return false;
            }
            return true;

        }
    }
}
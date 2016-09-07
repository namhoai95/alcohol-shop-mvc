using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC.Models;

namespace WebMVC.Areas.Admin.Controllers
{
    public class UsersController : Controller
    {
        public MembershipUserCollection getListAdmin()
        {
            // lấy hết danh sách tài khoản
            MembershipUserCollection u = Membership.GetAllUsers();
            // lọc danh sách lại, role phải là admin
            MembershipUserCollection n = new MembershipUserCollection();
            foreach (MembershipUser us in u)
            {
                if (Roles.IsUserInRole(us.UserName, "admin") || Roles.IsUserInRole(us.UserName, "Admin"))
                    n.Add(us);
            }
            return n;
        }
        // GET: Admin/Users
        public ActionResult Index()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            return View(getListAdmin());
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
                if (!lrol.Contains("admin") && !lrol.Contains("Admin"))
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
            return true;

        }

        public ActionResult ListRole()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            string[] lst = Roles.GetAllRoles();

            List<MRoles> l = new List<MRoles>();
            foreach (string s in lst)
            {
                string[] lstUser = Roles.GetUsersInRole(s);
                l.Add(new MRoles(s, lstUser.Length));
            }
            return View(l);
        }

        
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {

            ViewBag.ReturnUrl = returnUrl;
            if (FormsAuthentication.CookiesSupported == true)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    try
                    {
                        string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                        string roles = string.Empty;
                        // find the role
                        string[] lrol = Roles.GetRolesForUser(username);
                        if (lrol.Contains("admin") || lrol.Contains("Admin"))
                        {
                            if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                    && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                            {
                                return Redirect(returnUrl);
                            }
                            else
                            {
                                return Redirect("~/Admin/Users/Index");
                            }
                        }
                        else
                        {
                            // không  phải admin
                        }

                    }
                    catch
                    {
                        return View();
                    }
                }
            }
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(Login fc, string returnUrl)
        {

            if (!ModelState.IsValid)
            {
                return View(fc);
            }

            string username = fc.UserName;//Convert.ToString(fc["username"]);
            string password = fc.Password;//Convert.ToString(fc["password"]);
            bool rem = fc.RememberMe;
            if (Membership.ValidateUser(username, password) == true)
            {
                MembershipUser u = Membership.GetUser(username);
                Session["user"] = System.Web.HttpContext.Current.Request.LogonUserIdentity.Name;
                Session["for2Team"] = User.Identity.Name;
                if (Roles.IsUserInRole(u.UserName, "Admin") || Roles.IsUserInRole(u.UserName, "admin"))
                {
                    FormsAuthentication.RedirectFromLoginPage(username, false);
                    if (rem == true)
                    {
                        FormsAuthentication.GetAuthCookie(username, false).Expires.AddMinutes(30);
                    }
                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                    && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return Redirect("~/Admin/Users/Index");
                    }

                }
                else
                {
                    // do not sth
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Login", "Users");
        }

        public ActionResult LockUser(String id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            MembershipUser u = Membership.GetUser(id);
            if (u == null)
            {

            }
            else
            {
                u.IsApproved = false;
                Membership.UpdateUser(u);

            }
            return View("Index",getListAdmin());
            
        }
        public ActionResult UnLockUser(String id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            MembershipUser u = Membership.GetUser(id);
            if (u == null)
            {

            }
            else
            {
                u.IsApproved = true;
                Membership.UpdateUser(u);

            }
            return View("Index", getListAdmin());
        }



        //AccountMView
        [HttpGet]
        [AllowAnonymous]
        public ActionResult InfoUser(string id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            MembershipUser u = Membership.GetUser(id);
            if (u == null)
            {
                return View("Index");
            }
            AccountMView m = new AccountMView();
            m.UserName = u.UserName;
            m.Email = u.Email;
            return View("Edit", m);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult InfoUser(AccountMView m)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (!ModelState.IsValid)
            {
                //return Json(new Result(-1, "Không tìm thấy tài khoản"));
                return View("Edit", m);
            }
            // lấy thông tin từ model view
            String username = m.UserName;
            String email = m.Email;
            String pass = m.Password;
            String oldpass = "123";
            // xác nhận thông tin tài khoản
            MembershipUser u = Membership.GetUser(m.UserName);
            if (u == null)
            {
                // không tìm thấy tài khoản
                ViewData["Error"] = "2";
                return View("Edit", m);
                //return Json(new Result(-1, "Không tìm thấy tài khoản"));
            }
            u.Email = email;
            bool kiemtra = u.ChangePassword(oldpass, pass);
            if (kiemtra == false)
            {
                // đổi mật khẩu không thành công
                ViewData["Error"] = "1";
                return View("Edit", m);
                //return Json(new Result(-1, "Mật khẩu không đúng 1"));

            }
            Membership.UpdateUser(u);
            TempData["Success"] = "Cập nhật thành công";
            return View("Edit", m);
            //return Json(new Result(0, "Cập nhật thành công"));
        }

        //tạo tài khoản
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Create()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            AccountMViewRegister m = new AccountMViewRegister();
            return View(m);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(AccountMViewRegister m)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (!ModelState.IsValid)
            {
                
                return View(m);
            }
            try
            {
                // lấy thông tin từ model view
                String username = m.UserName;
                String email = m.Email;
                String pass = m.Password;
                // xác nhận thông tin tài khoản
                MembershipUser u = Membership.GetUser(m.UserName);
                if (u == null)
                {
                    // không tìm thấy tài khoản
                    MembershipCreateStatus p = MembershipCreateStatus.Success;
                    Membership.CreateUser(username, pass, email, "a", "a", true, out p);
                    u = Membership.GetUser(username);
                    u.Comment = "default avatar";
                    if (!Roles.RoleExists("admin"))
                    {
                        Roles.CreateRole("admin");
                    }
                    Roles.AddUserToRole(username, "admin");
                    TempData["Success"] = "0";
                    return View(m);

                }
                else
                {
                    ViewData["Error"] = "1";
                    return View(m);

                }
            }
            catch
            {
                ViewData["Error"] = "3";
                return View(m);
            }


        }


        // tao role
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateRole(FormCollection m)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            string[] lst = Roles.GetAllRoles();

            List<MRoles> l = new List<MRoles>();
            foreach (string s in lst)
            {
                string[] lstUser = Roles.GetUsersInRole(s);
                l.Add(new MRoles(s, lstUser.Length));
            }
            // lấy thông tin từ model view
            if (m["namerole"] == null)
            {
                ViewData["Error"] = "1";
                return View("ListRole", l);
            }
            String name = Convert.ToString(m["namerole"]);
            if (name == null)
            {

                ViewData["Error"] = "1";
                return View("ListRole", l);
            }
            if (name.Length <= 0)
            {
                ViewData["Error"] = "2";
                return View("ListRole", l);

            }
            Roles.CreateRole(name);


            TempData["Success"] = "0";
            return View("ListRole", l);
        }
        //DelRole

        public List<MRoles> getListRole()
        {
            string[] lst = Roles.GetAllRoles();

            List<MRoles> l = new List<MRoles>();
            foreach (string s in lst)
            {
                string[] lstUser = Roles.GetUsersInRole(s);
                l.Add(new MRoles(s, lstUser.Length));
            }
            return l;
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult DelRole(String id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null || id.Length <= 0)
            {
                ViewData["Error"] = "1";
                return View("ListRole", getListRole());
            }
            if (Roles.RoleExists(id))
            {
                string[] ds = Roles.GetUsersInRole(id);
                if (ds.Length >= 1)
                {
                    ViewData["Error"] = "2";
                    return View("ListRole", getListRole());
                }
                else
                {
                    bool del = Roles.DeleteRole(id);
                    if (!del)
                    {
                        ViewData["Error"] = "3";
                        return View("ListRole", getListRole());
                    }
                }
            }
            else
            {
                ViewData["Error"] = "4";
                return View("ListRole", getListRole());
            }
            TempData["Success"] = "0";
            return View("ListRole", getListRole());
        }
        [HttpGet]
        [AllowAnonymous]
        public ActionResult DetailRole(String id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            id = id.Trim();
            StrObject ob = new StrObject(id);
            // lấy hết danh sách tài khoản
            MembershipUserCollection u = Membership.GetAllUsers();
            // lọc danh sách lại, role phải là id
            MembershipUserCollection n = new MembershipUserCollection();
            foreach (MembershipUser us in u)
            {
                if (Roles.IsUserInRole(us.UserName, id))
                    n.Add(us);
            }

            return View(n);
        }
        public ActionResult R()
        {
            return View("R", new StrObject(Request.Url.ToString()));
        }
    }
}

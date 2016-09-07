using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC.Models;

namespace WebMVC.Areas.Admin.Controllers
{
    public class CustomersController : Controller
    {
        public MembershipUserCollection getListCustomer()
        {
            // lấy hết danh sách tài khoản
            MembershipUserCollection u = Membership.GetAllUsers();
            // lọc danh sách lại, role K  phải là admin
            MembershipUserCollection n = new MembershipUserCollection();
            foreach (MembershipUser us in u)
            {
                if (!Roles.IsUserInRole(us.UserName, "admin") && !Roles.IsUserInRole(us.UserName, "Admin"))
                    n.Add(us);
            }
            return n;
        }
        // GET: Admin/Customers
        public ActionResult Index()
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            return View(getListCustomer());
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
            return View("Index", getListCustomer());

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
            return View("Index", getListCustomer());
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
                
            }
            u.Email = email;
            bool kiemtra = u.ChangePassword(oldpass, pass);
            if (kiemtra == false)
            {
                // đổi mật khẩu không thành công
                ViewData["Error"] = "1";
                return View("Edit", m);
               

            }
            Membership.UpdateUser(u);
            TempData["Success"] = "Cập nhật thành công";
            return View("Edit", m);
            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC.Models;
using WebMVC.ViewModels;


namespace WebMVC.Controllers
{
    public class FTeamController : Controller
    {

        private fteamwineEntities db = new fteamwineEntities();

        // GET: FTeam
        public ActionResult Index()
        {
            return View();
        }
        //[Authorize]
        public ActionResult Contact()
        {
            return View();
        }

        public PartialViewResult WebInfoPartialView()
        {
            Website web = db.Websites.First();
            return PartialView(web);
        }

        public PartialViewResult _FooterMainPartial()
        {
            Website web = db.Websites.First();
            return PartialView(web);
        }

        public PartialViewResult _ManufacturerPartial()
        {
            return PartialView(db.Manufacturers.Where(m => m.TrangThai == 1).OrderByDescending(m => m.ID).ToList());
        }

        public PartialViewResult SendContactPartialView()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SendContactPartialView([Bind(Include = "name,email,tieude,noidung")] Contact contact)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    contact.id = DateTime.Now.Ticks/TimeSpan.TicksPerSecond;
                    contact.ip = GetUserIP();
                    contact.thoigian = DateTime.Now.ToLocalTime();
                    contact.trangthai = true;
                    db.Contacts.Add(contact);
                    db.SaveChanges();

                    ViewData["ThongBao"] = "1";
                    SendEmailContact("Wine4U", contact.tieude, contact.email + " - " + contact.noidung);

                    return RedirectToAction("SendContactPartialView", ViewData["ThongBao"] = "1");
                }
            }
            catch
            {
                ViewData["ThongBao"] = "-1";
            }
            ViewData["ThongBao"] = "-1";
            return PartialView(contact);
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

        public static void SendEmailContact(String head, String tieude, String noidung)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add("bqdat.it@gmail.com");
            mail.From = new MailAddress("shoprender.hcmus@gmail.com", head, System.Text.Encoding.UTF8);
            mail.Subject = tieude;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = noidung;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("shoprender.hcmus@gmail.com", "Thanhtam521993");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                return;
            }
        }

        public ActionResult Category()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public static String CreateIDs(String ma, String Chuoi)
        {
            //String ma1 = ma;
            string[] lines = Regex.Split(ma, Chuoi);
            int m = Convert.ToInt32(lines[1]) + 1;
            int leng = lines[1].Length;
            String o = String.Concat(Enumerable.Repeat("0", leng - m.ToString().Length));
            String news = Chuoi + o + m;
            return news;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(ViewModels.RegisterViewModel r)
        {
            if (!ModelState.IsValid)
            {
                return View(r);
            }
            MembershipUser u = Membership.GetUser(r.TaiKhoan);
            if(Membership.GetUserNameByEmail(r.Email) != null)
            {
                ViewData["Error"] = "1";
                return View(r);
            }
            if (u == null)
            {
                // không tìm thấy tài khoản
                MembershipCreateStatus p = MembershipCreateStatus.Success;
                Membership.CreateUser(r.TaiKhoan, r.MatKhau, r.Email, "a", "a", true, out p);
                if (!p.Equals(MembershipCreateStatus.Success))
                {
                    ViewData["Error"] = p.ToString();
                    return View(r);
                }
                u = Membership.GetUser(r.TaiKhoan);
                u.Comment = "default avatar";
                if (!Roles.RoleExists("user"))
                {
                    Roles.CreateRole("user");
                }
                Roles.AddUserToRole(r.TaiKhoan, "user");
                Membership.UpdateUser(u);

            }
            else
            {
                //tb
                ViewData["Error"] = "1";
                return View(r);
            }


            Customer c = new Customer();
            string ma = db.Customers.OrderByDescending(p => p.MaKH).First().MaKH;
            if (ma == null)
            {
                c.MaKH = "KH00000001";
            }
            else
            {
                c.MaKH = CreateIDs(ma, "KH");
            }
            c.GhiChu = "";
            c.ID = (db.Customers.Where(cs => cs.ID > 0))==null?1:(db.Customers.Where(cs => cs.ID > 0).First().ID + 1);
            c.NgayCapNhat = DateTime.Now;
            c.NgayTao = DateTime.Now;
            c.SDT = r.SDT;
            c.TenKH = r.TenKH;
            c.TrangThai = 1;
            c.DiaChi = r.DiaChi;
            c.Email = r.Email;
            

            User user = new Models.User();
            user.TenHienThi = r.TenKH;
            user.TinhTrang = 1;
            user.TenDangNhap = r.TaiKhoan;
            user.Quyen = 2;
            user.NgayTao = DateTime.Now;
            user.NgayCapNhat = DateTime.Now;
            user.MatKhau = "";
            user.ID = (db.Users.Where(cs => cs.ID > 0))== null?1: (db.Users.Where(cs => cs.ID > 0).First().ID + 1);
            user.GhiChu = "";
            //user.MatKhau = u.GetPassword();
            user.avatar = "";
            user.MaXacNhan = "a";
            user.ThoiGiaDangNhapGanNhat = DateTime.Now;

            db.Users.Add(user);
            db.SaveChanges();
            c.User_ID = user.ID;
            db.Customers.Add(c);
            db.SaveChanges();
            TempData["Success"] = "0";
            return View(new ViewModels.RegisterViewModel());
        }
        public ActionResult OrderInfo()
        {
            return View();
        }

        public ActionResult OrderHistory()
        {
            return View();
        }

        public ActionResult Product()
        {
            return View();
        }

        public ActionResult Cart()
        {
            return View();
        }
        public PartialViewResult Login()
        {
            return PartialView();
        }

        public ActionResult Compare()
        {
            return View();
        }

        public PartialViewResult LoginPartialView()
        {
            if (checkLogin()) { return PartialView("Empty"); }
            return PartialView();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LoginPartialView(ViewModels.LoginViewModel l)
        {
            if (!ModelState.IsValid)
            {
                return PartialView();
            }
            bool remember = l.Remmeber;
            if (Membership.ValidateUser(l.Username, l.Password) == true)
            {
                MembershipUser u = Membership.GetUser(l.Username);
                Session["user"] = System.Web.HttpContext.Current.Request.LogonUserIdentity.Name;
                Session["for2Team"] = User.Identity.Name;

                if (remember == true)
                {
                    FormsAuthentication.GetAuthCookie(l.Username, false).Expires.AddMinutes(30);
                }
                else
                {

                }
                FormsAuthentication.SetAuthCookie(l.Username, false);
                return PartialView("Empty");

            }
            MembershipUser us = null;
            return PartialView();
        }
        public PartialViewResult HeaderPatialView()
        {
            MembershipUser u = null;

            if (!checkLogin()) { return PartialView(u); }
            string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
            MembershipUserCollection l = Membership.FindUsersByName(username);
            foreach(MembershipUser us in l)
            {
                if(us.IsApproved)
                    return PartialView(us);
                
            }
            return PartialView(u);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return Json(new Result(0, ""));
        }
        public PartialViewResult BarCartPartialView()
        {
            return PartialView();
        }
        public PartialViewResult CartInHeader()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(),
                CartTotal = Convert.ToInt32(cart.GetTotal())
            };
            // Return the view
            
            return PartialView(viewModel);
        }
        public ActionResult UpdateToCart()
        {

            var cart = ShoppingCart.GetCart(this.HttpContext);
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(),
                CartTotal = Convert.ToInt32(cart.GetTotal())
            };
            return PartialView("CartInHeader", viewModel);
            
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LoginForm(FormCollection f)
        {
            String username = f.Get("username").ToString();
            String pass = f.Get("password").ToString();
            bool remember = Convert.ToBoolean(f.Get("loginremember"));
            if (Membership.ValidateUser(username, pass) == true)
            {
                MembershipUser u = Membership.GetUser(username);
                Session["user"] = System.Web.HttpContext.Current.Request.LogonUserIdentity.Name;
                Session["for2Team"] = User.Identity.Name;
                
                if (remember == true)
                {
                    FormsAuthentication.GetAuthCookie(username, false).Expires.AddMinutes(30);
                }
                else
                {
                    
                }
                FormsAuthentication.SetAuthCookie(username, false);
                return PartialView("HeaderPatialView",u);
                
            }
            MembershipUser us = null;
            return PartialView("HeaderPatialView",us );
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
                if (roles.Length <0 )
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
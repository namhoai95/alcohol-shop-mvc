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
    public class CartzController : Controller
    {
        // GET: Cartz
        private fteamwineEntities db = new fteamwineEntities();
        public ActionResult Index()
        {
            List<Product> lst = CompareCollection.Instance.listItem;
            CompareView c = new CompareView();
            c.ComID = CompareCollection.Instance.ComID;
            c.listItem = CompareCollection.Instance.listItem;
            c.TimeKill = CompareCollection.Instance.TimeKill;
            c.urlReturn = Request.Url.ToString();
            return View(c);
        }

        [HttpPost]
        public ActionResult Compare(int id)
        {

            if(CompareCollection.Instance.listItem.Count >= 3)
            {
                return Json(new Result(-2,"limit"));
            }
            //CompareCollection.Instance.AddItem(id);
            CompareCollection.Instance.AddItem(id);
            var rs = new Result
            {
                error = 0,
                msg = ""
            };
            return Json(rs);
            //return View();
        }

        public PartialViewResult ComparePartialView()
        {
            List<Product> lst =  CompareCollection.Instance.listItem;
            CompareView c = new CompareView();
            c.ComID = CompareCollection.Instance.ComID;
            c.listItem = CompareCollection.Instance.listItem;
            c.TimeKill = CompareCollection.Instance.TimeKill;
            
            return PartialView(c);
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {

            //CompareCollection.Instance.AddItem(id);
            CompareCollection.Instance.RemoveItem(id);
            var rs = new Result
            {
                error = 0,
                msg = ""
            };
            return Json(rs);
            //return View();
        }

        public PartialViewResult ContentCompare()
        {
            List<Product> lst = CompareCollection.Instance.listItem;
            CompareView c = new CompareView();
            c.ComID = CompareCollection.Instance.ComID;
            c.listItem = CompareCollection.Instance.listItem;
            c.TimeKill = CompareCollection.Instance.TimeKill;
            c.urlReturn = Request.Url.ToString();
            return PartialView(c);
        }

        public PartialViewResult CompareInHeader()
        {
            List<Product> lst = CompareCollection.Instance.listItem;
            CompareView c = new CompareView();
            c.ComID = CompareCollection.Instance.ComID;
            c.listItem = CompareCollection.Instance.listItem;
            c.TimeKill = CompareCollection.Instance.TimeKill;
            c.urlReturn = Request.Url.ToString();
            return PartialView(c);
        }


        public ActionResult History()
        {
            List<HistoryView> lst = new List<HistoryView>();
            if (!checkLogin())
            {
                ViewData["Error"] = "5";
                return View(lst);
            }
            string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
            if (username.Length <= 0)
            {
                ViewData["Error"] = "5";
                return View(lst);
            }
            MembershipUser u = Membership.GetUser(username);
            if (u == null)
            {
                ViewData["Error"] = "4";
                return View(lst);
            }
            string[] lrol = Roles.GetRolesForUser(username);
            if(lrol.Contains("admin") || lrol.Contains("Admin"))
            {
                ViewData["Error"] = "4";
                return View(lst);
            }
            Customer cus = db.Customers.Where(cs => cs.Email.Equals(u.Email)).First();
            if (cus == null)
            {
                ViewData["Error"] = "3";
                return View(lst);
            }
            
           
            List<Order> lo = db.Orders.Where(c => c.KH_ID == cus.ID).ToList();
            foreach( var i in lo)
            {
                List<OrderDetail> ld = db.OrderDetails.Where(f => f.HD_ID == i.ID).ToList();
                HistoryView hi = new HistoryView();
                hi.order = i;
                hi.detail = ld;
                lst.Add(hi);
            }
            
            return View(lst);

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
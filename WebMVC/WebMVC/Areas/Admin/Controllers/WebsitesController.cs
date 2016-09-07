using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC.Models;

namespace WebMVC.Areas.Admin.Controllers
{
    public class WebsitesController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();

        // GET: Admin/Websites
        public ActionResult Index()
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            return View(db.Websites.Where(e => e.TrangThai == true).ToList());
        }

        // GET: Admin/Websites/Details/5
        public ActionResult Details(decimal id)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Website website = db.Websites.Find(id);
            if (website == null)
            {
                return HttpNotFound();
            }
            return View(website);
        }

        // GET: Admin/Websites/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            return View();
        }

        // POST: Admin/Websites/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "sdt1,sdt2,email,skype,diachi,twitter,facebook,tenshop,googlemap,linkWebsites")] Website website)
        {
            if (ModelState.IsValid)
            {
                website.id = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
                string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                website.nguoichinhsua = username== null?"vodanh":username;
                website.favaicon = "";
                website.thoigiancapnhat = DateTime.Now;
                website.thoigiantao = DateTime.Now;
                website.ghichi = "";
                website.TrangThai = true;
                
                
                foreach(Website w in db.Websites.Where(e => e.TrangThai == true).ToList())
                {
                    w.TrangThai = false;
                    db.Entry(w).State = EntityState.Modified;
                    db.SaveChanges();
                }
                
                db.Websites.Add(website);
                db.SaveChanges();
                //return RedirectToAction("Index");
            }

            return View(website);
        }

        // GET: Admin/Websites/Edit/5
        public ActionResult Edit(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Website website = db.Websites.Find(id);
            if (website == null)
            {
                return HttpNotFound();
            }

            return View(website);
        }

        // POST: Admin/Websites/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "sdt1,sdt2,email,skype,diachi,twitter,facebook,tenshop,googlemap,linkWebsites,id")] Website website)
        {
            if (ModelState.IsValid)
            {
                Website w = db.Websites.Find(website.id);
                if(w != null)
                {
                    string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                    w.nguoichinhsua = username == null ? "vodanh" : username;
                    w.thoigiancapnhat = DateTime.Now;
                    w.ghichi = "Đã cập nhật";
                    w.linkWebsites = website.linkWebsites;
                    w.sdt1 = website.sdt1;
                    w.sdt2 = website.sdt2;
                    w.skype = website.skype;
                    w.facebook = website.facebook;
                    w.diachi = website.diachi;
                    w.email = website.email;
                    w.tenshop = website.tenshop;
                    w.twitter = website.twitter;
                    w.googlemap = website.googlemap;
                    w.linkWebsites = website.linkWebsites;

                }
                
                
                db.Entry(w).State = EntityState.Modified;
                db.SaveChanges();
                //return RedirectToAction("Index");
            }
            return View(website);
        }

        

        

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
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
        
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVC.Models;
using PagedList;
using System.Web.Security;
using WebMVC.Areas.Admin.Models;
using System.IO;

namespace WebMVC.Areas.Admin.Controllers
{
    public class JobsController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 10;
        // GET: Admin/Jobs
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            pagecurrent = page;
            var jobs = db.Jobs.ToList();
            return View(jobs.OrderBy(c => c.id).ToPagedList(page, pageSize));
        }

        // GET: Admin/Jobs/Details/5
        public ActionResult Details(decimal id)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // GET: Admin/Jobs/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            return View();
        }


        // POST: Admin/Jobs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "title,contents")] JobsView j)

        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            HttpPostedFileBase files = null;
            string m = "";
            try
            {
                if (Request.Files.Count > 0)
                {
                    files = Request.Files[0];
                    if (files != null && files.ContentLength > 0)
                    {
                        string des = string.Concat(AppDomain.CurrentDomain.BaseDirectory + "img\\job\\", Path.GetFileName(files.FileName));
                        m = string.Concat("/img/job/", Path.GetFileName(files.FileName));
                        files.SaveAs(des);
                    }
                    else
                    {
                        ViewData["Error"] = "Không tìm thấy file";
                        return View();
                    }

                }
                else
                {
                    ViewData["Error"] = "Không tìm thấy file";
                    return View();
                }
            }
            catch
            {
                ViewData["Error"] = "Không tìm thấy file";
                return View();
            }

            if (ModelState.IsValid)
            {

                Job job = new Job();
                job.title = j.title;
                job.img = m;
                job.contents = j.contents;
                job.id = DateTime.Now.Ticks/1000;
                string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                job.usercreate = username == null ? "vodanh" : username;
                job.tag = job.usercreate;
                job.rate = 0;
                job.nview = 0;
                job.nrate = 0;
                job.TrangThai = true;
                job.day = DateTime.Now;
                job.dayupdate = DateTime.Now;
                db.Jobs.Add(job);
                db.SaveChanges();

            }
            else
            {
                ViewData["Error"] = "Thao tác thất bại";
                return View();
            }
            TempData["Success"] = "0";
            return RedirectToAction("Index");
        }

        
        // POST: Admin/Jobs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,title,contents")] Job j)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (ModelState.IsValid)
            {
                HttpPostedFileBase files = null;
                string m = "";
                try
                {
                    if (Request.Files.Count > 0)
                    {
                        files = Request.Files[0];
                        if (files != null && files.ContentLength > 0)
                        {
                            string des = string.Concat(AppDomain.CurrentDomain.BaseDirectory + "img\\job\\", Path.GetFileName(files.FileName));
                            m = string.Concat("/img/job/", Path.GetFileName(files.FileName));
                            files.SaveAs(des);
                        }
                        else
                        {

                        }

                    }
                    else
                    {

                    }
                }
                catch
                {

                }
                Job job = db.Jobs.Find(j.id);
                job.title = j.title;
                job.img = m.Length > 0 ? m : job.img;
                job.contents = j.contents;

                string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                job.usercreate = username == null ? "vodanh" : username;
                job.tag = job.usercreate;
                job.rate = 0;
                job.nview = 0;
                job.nrate = 0;
                job.TrangThai = true;
                job.dayupdate = DateTime.Now;
                db.Entry(job).State = EntityState.Modified;
                db.SaveChanges();



                TempData["Success"] = "0";
                return RedirectToAction("Index");
            }
            else
            {
                ViewData["Error"] = "Thao tác thất bại";
                return View("Details",j);
            }
            return View("Details", j);
        }

        

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult UnLock(decimal id)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            job.TrangThai = true;
            db.Entry(job).State = EntityState.Modified;
            db.SaveChanges();
            var jobs = db.Jobs.ToList();
            return View("Index",jobs.OrderBy(c => c.id).ToPagedList(pagecurrent, 10));
        }
        public ActionResult Lock(decimal id)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            job.TrangThai = false;
            db.Entry(job).State = EntityState.Modified;
            db.SaveChanges();
            var jobs = db.Jobs.ToList();
            return View("Index", jobs.OrderBy(c => c.id).ToPagedList(pagecurrent, 10));
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

using PagedList;
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
    public class ProducersController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 5;

        public JsonResult autoCompleteSeach(string Prefix)
        {
            //Note : you can bind same list from database  
            List<Producer> ObjList = db.Producers.ToList();
            //Searching records from list using LINQ query  
            var CityName = (from N in ObjList
                            where N.TenNSX.IndexOf(Prefix) >= 0
                            select new { N.TenNSX });
            return Json(CityName, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Search(string txtName, int page = 1, int pageSize = 5)
        {
            var producers = db.Producers
                                    .Where(p => p.TenNSX.IndexOf(txtName) >= 0)
                                    .Include(p => p.TrangThai1);
            return View("Index", producers.OrderBy(p => p.MaNSX).ToPagedList(page, pageSize));
        }

        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            pagecurrent = page;
            var producers = db.Producers.Include(p => p.TrangThai1);
            return View(producers.OrderBy(p => p.MaNSX).ToPagedList(page, pageSize));
        }

        // GET: Admin/Producers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producers.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            return View(producer);
        }

        // GET: Admin/Producers/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            Producer producer = new Producer();
            string ma = db.Producers.OrderByDescending(p => p.MaNSX).First().MaNSX;
            if (ma == null)
            {
                producer.MaNSX = "PNX0000001";
            }
            else
            {
                producer.MaNSX = CreateID.CreateIDs(db.Producers.OrderByDescending(p => p.MaNSX).First().MaNSX, "PNX");
            }
            return View(producer);
        }

        // POST: Admin/Producers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNSX,TenNSX,DiaChi,SDT,TuKhoa,GhiChu")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                producer.TrangThai = 1;
                producer.NgayTao = DateTime.Now.ToLocalTime();
                db.Producers.Add(producer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", producer.TrangThai);
            return View(producer);
        }

        // GET: Admin/Producers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producers.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", producer.TrangThai);
            return View(producer);
        }

        // POST: Admin/Producers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaNSX,TenNSX,DiaChi,SDT,TuKhoa,TrangThai,GhiChu")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                producer.NgayCapNhat = DateTime.Now.ToLocalTime();
                db.Entry(producer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", producer.TrangThai);
            return View(producer);
        }

        // GET: Admin/Producers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Producer producer = db.Producers.Find(id);
                if (producer == null)
                {
                    return HttpNotFound();
                }
                else
                {
                    db.Producers.Remove(producer);
                    db.SaveChanges();
                }
            }
            catch
            {
                ViewData["Error"] = "1";
            }

            var producers = db.Producers.Include(p => p.TrangThai1);
            return View("Index", producers.OrderBy(p => p.MaNSX).ToPagedList(pagecurrent, pagesizes));
        }

        // POST: Admin/Producers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Producer producer = db.Producers.Find(id);
            db.Producers.Remove(producer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Lock(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producers.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Producers.Find(id).TrangThai = 3;
                db.Entry(producer).State = EntityState.Modified;
                db.SaveChanges();
            }
            var producers = db.Producers.Include(p => p.TrangThai1);
            return View("Index", producers.OrderBy(p => p.MaNSX).ToPagedList(pagecurrent, pagesizes));
        }

        public ActionResult unLock(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producers.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Producers.Find(id).TrangThai = 1;
                db.Entry(producer).State = EntityState.Modified;
                db.SaveChanges();
            }
            var producers = db.Producers.Include(p => p.TrangThai1);
            return View("Index", producers.OrderBy(p => p.MaNSX).ToPagedList(pagecurrent, pagesizes));
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

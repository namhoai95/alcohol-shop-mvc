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
    public class ManufacturersController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 5;

        // GET: Admin/Manufacturers
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            pagecurrent = page;
            var manufacturers = db.Manufacturers.Include(m => m.TrangThai1);
            return View(manufacturers.OrderByDescending(p => p.Ma).ToPagedList(page, pageSize));
        }

        public ActionResult Search(string txtName, int page = 1, int pageSize = 5)
        {
            var manufacturers = db.Manufacturers.Where(m => m.TenHangSanXuat.IndexOf(txtName) >= 0).Include(m => m.TrangThai1);
            return View("Index", manufacturers.OrderByDescending(p => p.Ma).ToPagedList(page, pageSize));
        }
        public JsonResult autoCompleteSeach(string Prefix)
        {
            //Note : you can bind same list from database  
            List<Manufacturer> ObjList = db.Manufacturers.ToList();
            //Searching records from list using LINQ query  
            var CityName = (from N in ObjList
                            where N.TenHangSanXuat.IndexOf(Prefix) >= 0
                            select new { N.TenHangSanXuat });
            return Json(CityName, JsonRequestBehavior.AllowGet);
        }
        // GET: Admin/Manufacturers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Manufacturer manufacturer = db.Manufacturers.Find(id);
            if (manufacturer == null)
            {
                return HttpNotFound();
            }
            return View(manufacturer);
        }

        // GET: Admin/Manufacturers/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            Manufacturer manufacturer = new Manufacturer();
            string ma = db.Manufacturers.OrderByDescending(p => p.Ma).First().Ma;
            if (ma == null)
            {
                manufacturer.Ma = "PMA0000001";
            }
            else
            {
                manufacturer.Ma = CreateID.CreateIDs(db.Manufacturers.OrderByDescending(p => p.Ma).First().Ma, "PMA");
            }
            return View(manufacturer);
        }

        // POST: Admin/Manufacturers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Ma,TenHangSanXuat,TuKhoa,GhiChu")] Manufacturer manufacturer)
        {
            if (ModelState.IsValid)
            {
                manufacturer.TrangThai = 1;
                manufacturer.NgayTao = DateTime.Now.ToLocalTime();
                db.Manufacturers.Add(manufacturer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", manufacturer.TrangThai);
            return View(manufacturer);
        }

        // GET: Admin/Manufacturers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Manufacturer manufacturer = db.Manufacturers.Find(id);
            if (manufacturer == null)
            {
                return HttpNotFound();
            }
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", manufacturer.TrangThai);
            return View(manufacturer);
        }

        // POST: Admin/Manufacturers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Ma,TenHangSanXuat,TuKhoa,TrangThai,GhiChu")] Manufacturer manufacturer)
        {
            if (ModelState.IsValid)
            {
                manufacturer.NgayCapNhat = DateTime.Now.ToLocalTime();
                db.Entry(manufacturer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", manufacturer.TrangThai);
            return View(manufacturer);
        }

        // GET: Admin/Manufacturers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Manufacturer manufacturer = db.Manufacturers.Find(id);
                if (manufacturer == null)
                {
                    return HttpNotFound();
                }
                else
                {
                    db.Manufacturers.Remove(manufacturer);
                    db.SaveChanges();
                }
            }
            catch
            {
                ViewData["Error"] = "1";
            }
            var manufacturers = db.Manufacturers.Include(c => c.TrangThai1);
            return View("Index", manufacturers.OrderBy(p => p.Ma).ToPagedList(pagecurrent, pagesizes));
        }

        // POST: Admin/Manufacturers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Manufacturer manufacturer = db.Manufacturers.Find(id);
            db.Manufacturers.Remove(manufacturer);
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
            Manufacturer manufacturer = db.Manufacturers.Find(id);
            if (manufacturer == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Manufacturers.Find(id).TrangThai = 3;
                db.Entry(manufacturer).State = EntityState.Modified;
                db.SaveChanges();
            }
            var manufacturers = db.Manufacturers.Include(p => p.TrangThai1);
            return View("Index", manufacturers.OrderBy(p => p.Ma).ToPagedList(pagecurrent, pagesizes));
        }

        public ActionResult unLock(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Manufacturer manufacturer = db.Manufacturers.Find(id);
            if (manufacturer == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Manufacturers.Find(id).TrangThai = 1;
                db.Entry(manufacturer).State = EntityState.Modified;
                db.SaveChanges();
            }
            var manufacturers = db.Manufacturers.Include(p => p.TrangThai1);
            return View("Index", manufacturers.OrderBy(p => p.Ma).ToPagedList(pagecurrent, pagesizes));
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

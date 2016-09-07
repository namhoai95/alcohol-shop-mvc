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
    public class CategoriesController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 5;

        // GET: Admin/Categories
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            pagecurrent = page;
            var categories = db.Categories.Include(c => c.TrangThai);
            return View(categories.OrderBy(p => p.MaLoai).ToPagedList(page, pageSize));
        }

        public ActionResult Search(string txtName, int page = 1, int pageSize = 5)
        {
            var categories = db.Categories
                                    .Where(c => c.TenLoai.IndexOf(txtName) >= 0)
                                    .Include(c => c.TrangThai);
            return View("Index", categories.OrderBy(p => p.MaLoai).ToPagedList(page, pageSize));
        }

        public JsonResult autoCompleteSeach(string Prefix)
        {
            //Note : you can bind same list from database  
            List<Category> ObjList = db.Categories.ToList();
            //Searching records from list using LINQ query  
            var CityName = (from N in ObjList
                            where N.TenLoai.IndexOf(Prefix) >= 0
                            select new { N.TenLoai });
            return Json(CityName, JsonRequestBehavior.AllowGet);
        }

        // GET: Admin/Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Categories/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            Category category = new Category();
            string ma = db.Categories.OrderByDescending(p => p.MaLoai).First().MaLoai;
            if (ma == null)
            {
                category.MaLoai = "WINECA0001";
            }
            else
            {
                category.MaLoai = CreateID.CreateIDs(db.Categories.OrderByDescending(p => p.MaLoai).First().MaLoai, "WINECA");
            }
            return View(category);
        }

        // POST: Admin/Categories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLoai,TenLoai,TuKhoa,GhiChu")] Category category)
        {
            if (ModelState.IsValid)
            {
                category.TinhTrang = 1;
                category.NgayTao = DateTime.Now.ToLocalTime();
                db.Categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", category.TinhTrang);
            return View(category);
        }

        // GET: Admin/Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", category.TinhTrang);
            return View(category);
        }

        // POST: Admin/Categories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaLoai,TenLoai,TuKhoa,TinhTrang,GhiChu")] Category category)
        {
            if (ModelState.IsValid)
            {
                category.NgayCapNhat = DateTime.Now.ToLocalTime();
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", category.TinhTrang);
            return View(category);
        }

        // GET: Admin/Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Category category = db.Categories.Find(id);
                if (category == null)
                {
                    return HttpNotFound();
                }
                else
                {
                    db.Categories.Remove(category);
                    db.SaveChanges();
                }
            }
            catch
            {
                ViewData["Error"] = "1";
            }
            var categories = db.Categories.Include(c => c.TrangThai);
            return View("Index", categories.OrderBy(p => p.MaLoai).ToPagedList(pagecurrent, pagesizes));
        }

        // POST: Admin/Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
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
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Categories.Find(id).TinhTrang = 3;
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
            }
            var categories = db.Categories.Include(p => p.TrangThai);
            return View("Index", categories.OrderBy(p => p.MaLoai).ToPagedList(pagecurrent, pagesizes));
        }

        public ActionResult unLock(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.Categories.Find(id).TinhTrang = 1;
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
            }
            var categories = db.Categories.Include(p => p.TrangThai);
            return View("Index", categories.OrderBy(p => p.MaLoai).ToPagedList(pagecurrent, pagesizes));
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

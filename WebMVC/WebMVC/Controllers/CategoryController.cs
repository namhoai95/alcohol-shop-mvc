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
using System.Collections;

namespace WebMVC.Controllers
{
    public class CategoryController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 10;
        // GET: Category
        public ActionResult Index()
        {
            var categories = db.Categories.Include(c => c.TrangThai);
            return View(categories.ToList());
        }
        public ActionResult C(int id, int page = 1, int pageSize = 10)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                var category = db.Categories.Find(id);

                if (category == null || category.TrangThai.ID != 1)
                {
                    return HttpNotFound();
                }
                CategoryView z = new CategoryView(category, category.Products.ToList().OrderBy(p => p.ID).ToPagedList(page, pageSize));
                return View(z);
            }
            catch
            {
                RedirectToAction("Index", "Fteam");
            }
            return View();
        }

        public ActionResult SearchProduct(string txtName, int page = 1, int pageSize = 10)
        {
            int value = Convert.ToInt32(Request.Form["LoaiSP"]);
            var category = db.Categories.Find(value);

            if (category == null || category.TrangThai.ID != 1)
            {
                return HttpNotFound();
            }
            CategoryView z = new CategoryView(category, category.Products.Where(p => p.TenSanPham.IndexOf(txtName) >= 0).ToList().OrderBy(p => p.ID).ToPagedList(page, pageSize));
            return View("C", z);
        }

        // GET: Category/Details/5
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

        // GET: Category/Create
        public ActionResult Create()
        {
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,MaLoai,TenLoai,TuKhoa,TinhTrang,NgayTao,NgayCapNhat,GhiChu")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", category.TinhTrang);
            return View(category);
        }

        // GET: Category/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", category.TinhTrang);
            return View(category);
        }

        // POST: Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaLoai,TenLoai,TuKhoa,TinhTrang,NgayTao,NgayCapNhat,GhiChu")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", category.TinhTrang);
            return View(category);
        }

        // GET: Category/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public PartialViewResult ListCategoryPartial()
        {
            return PartialView(db.Categories.Where(x => x.TrangThai.ID == 1).OrderBy(x => x.TenLoai).ToList());
        }//
        public PartialViewResult MenuCatePartial()
        {
            return PartialView(db.Categories.Where(x => x.TrangThai.ID == 1).OrderBy(x => x.TenLoai).ToList());
        }

        
    }
}

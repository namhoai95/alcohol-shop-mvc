using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVC.Models;
using WebMVC.ViewModels;

namespace WebMVC.Controllers
{
    public class ManufacturerszController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();

        public ActionResult M(int id, int page = 1, int pageSize = 10)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                var category = db.Manufacturers.Find(id);

                if (category == null || category.TrangThai1.ID != 1)
                {
                    return HttpNotFound();
                }
                ManufacturerView z = new ManufacturerView(category, category.Products.ToList().OrderBy(p => p.ID).ToPagedList(page, pageSize));
                return View(z);
            }
            catch
            {
                RedirectToAction("Index", "Fteam");
            }
            return View();
        }
        // GET: Manufacturersz
        public ActionResult Index()
        {
            var manufacturers = db.Manufacturers.Include(m => m.TrangThai1);
            return View(manufacturers.ToList());
        }

        // GET: Manufacturersz/Details/5
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

        // GET: Manufacturersz/Create
        public ActionResult Create()
        {
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Manufacturersz/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Ma,TenHangSanXuat,TuKhoa,NgayTao,NgayCapNhat,TrangThai,GhiChu")] Manufacturer manufacturer)
        {
            if (ModelState.IsValid)
            {
                db.Manufacturers.Add(manufacturer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", manufacturer.TrangThai);
            return View(manufacturer);
        }

        // GET: Manufacturersz/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", manufacturer.TrangThai);
            return View(manufacturer);
        }

        // POST: Manufacturersz/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Ma,TenHangSanXuat,TuKhoa,NgayTao,NgayCapNhat,TrangThai,GhiChu")] Manufacturer manufacturer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(manufacturer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", manufacturer.TrangThai);
            return View(manufacturer);
        }

        // GET: Manufacturersz/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Manufacturersz/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Manufacturer manufacturer = db.Manufacturers.Find(id);
            db.Manufacturers.Remove(manufacturer);
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
        //MenuMPartial
        public PartialViewResult MenuMPartial()
        {
            return PartialView(db.Manufacturers.Where(x => x.TrangThai1.ID == 1).OrderBy(x => x.TenHangSanXuat).ToList());
        }
    }
}

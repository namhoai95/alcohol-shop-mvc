using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVC.Models;

namespace WebMVC.Controllers
{
    public class ImagesController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();

        // GET: Images
        public ActionResult Index()
        {
            var images = db.Images.Include(i => i.Product).Include(i => i.TrangThai1);
            return View(images.ToList());
        }

        // GET: Images/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Image image = db.Images.Find(id);
            if (image == null)
            {
                return HttpNotFound();
            }
            return View(image);
        }

        // GET: Images/Create
        public ActionResult Create()
        {
            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham");
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Images/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,SanPham_ID,Url_img,TuKhoa,NgayTao,ViTriHinh,NgayCapNhat,ChieuRong,TrangThai,ChieuCao,GhiChu")] Image image)
        {
            if (ModelState.IsValid)
            {
                db.Images.Add(image);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham", image.SanPham_ID);
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", image.TrangThai);
            return View(image);
        }

        // GET: Images/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Image image = db.Images.Find(id);
            if (image == null)
            {
                return HttpNotFound();
            }
            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham", image.SanPham_ID);
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", image.TrangThai);
            return View(image);
        }

        // POST: Images/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,SanPham_ID,Url_img,TuKhoa,NgayTao,ViTriHinh,NgayCapNhat,ChieuRong,TrangThai,ChieuCao,GhiChu")] Image image)
        {
            if (ModelState.IsValid)
            {
                db.Entry(image).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham", image.SanPham_ID);
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", image.TrangThai);
            return View(image);
        }

        // GET: Images/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Image image = db.Images.Find(id);
            if (image == null)
            {
                return HttpNotFound();
            }
            return View(image);
        }

        // POST: Images/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Image image = db.Images.Find(id);
            db.Images.Remove(image);
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
        public PartialViewResult SliderBannerIndexPartial()
        {
            return PartialView(db.Products.OrderBy(x => x.TenSanPham).ToList());
        }
    }
}

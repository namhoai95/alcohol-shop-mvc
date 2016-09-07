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

namespace WebMVC.Areas.Admin.Controllers
{
    public class OrderDetailsController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 5;
        // GET: Admin/OrderDetails
        public ActionResult Index(int? id, int page = 1, int pageSize = 5)
        {
            var orderDetails = db.OrderDetails.Where(s=>s.HD_ID == id).Include(o => o.Order).Include(o => o.Product).Include(o => o.TrangThai1);
            return View(orderDetails.ToList().ToPagedList(page,pagesizes));
        }

        // GET: Admin/OrderDetails/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderDetail orderDetail = db.OrderDetails.Where(s=>s.HD_ID == id).Single();
            if (orderDetail == null)
            {
                return HttpNotFound();
            }
            return View(orderDetail);
        }

        // GET: Admin/OrderDetails/Create
        public ActionResult Create()
        {
            ViewBag.HD_ID = new SelectList(db.Orders, "ID", "MaHD");
            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham");
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Admin/OrderDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,HD_ID,SanPham_ID,DonGia,SoLuong,TrangThai,NgayTao,NgayCapNhat,GhiChu")] OrderDetail orderDetail)
        {
            if (ModelState.IsValid)
            {
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.HD_ID = new SelectList(db.Orders, "ID", "MaHD", orderDetail.HD_ID);
            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham", orderDetail.SanPham_ID);
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", orderDetail.TrangThai);
            return View(orderDetail);
        }

        // GET: Admin/OrderDetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderDetail orderDetail = db.OrderDetails.Find(id);
            if (orderDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.HD_ID = new SelectList(db.Orders, "ID", "MaHD", orderDetail.HD_ID);
            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham", orderDetail.SanPham_ID);
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", orderDetail.TrangThai);
            return View(orderDetail);
        }

        // POST: Admin/OrderDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,HD_ID,SanPham_ID,DonGia,SoLuong,TrangThai,NgayTao,NgayCapNhat,GhiChu")] OrderDetail orderDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(orderDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.HD_ID = new SelectList(db.Orders, "ID", "MaHD", orderDetail.HD_ID);
            ViewBag.SanPham_ID = new SelectList(db.Products, "ID", "MaSanPham", orderDetail.SanPham_ID);
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", orderDetail.TrangThai);
            return View(orderDetail);
        }

        // GET: Admin/OrderDetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderDetail orderDetail = db.OrderDetails.Find(id);
            if (orderDetail == null)
            {
                return HttpNotFound();
            }
            return View(orderDetail);
        }

        // POST: Admin/OrderDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OrderDetail orderDetail = db.OrderDetails.Find(id);
            db.OrderDetails.Remove(orderDetail);
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
    }
}

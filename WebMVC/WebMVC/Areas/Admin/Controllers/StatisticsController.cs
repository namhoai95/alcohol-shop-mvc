using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVC.Models;

namespace WebMVC.Areas.Admin.Controllers
{
    public class StatisticsController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();

        // GET: Admin/Statistics
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.TrangThai);
            return View(orders.ToList());
        }

        public JsonResult Revenue(int Month, int Year)
        {
            var result = db.Orders
                           .Where(b => b.NgayDatHang.Value.Month == Month
                                        && b.NgayDatHang.Value.Year == Year)
                           .GroupBy(b => b.NgayDatHang)
                           .Select(G => new
                           {
                               SumMoney = G.Sum(s => s.TongTien),
                               Month = G.Key.Value.Month,
                               MaHD = G.Select(s => s.MaHD),
                               SoLuong = G.Select(s => s.SoLuong),
                               TongTien = G.Select(s => s.TongTien),
                               MonthBuy = G.Select(s => s.NgayDatHang.Value.Month),
                           }).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult RevenueYear(int Year)
        {
            var result = db.Orders
                           .Where(b => b.NgayDatHang.Value.Year == Year)
                           .GroupBy(b => b.NgayDatHang)
                           .Select(G => new
                           {
                               SumMoney = G.Sum(s => s.TongTien),
                               Month = G.Key.Value.Month,
                               MaHD = G.Select(s => s.MaHD),
                               SoLuong = G.Select(s => s.SoLuong),
                               TongTien = G.Select(s => s.TongTien),
                               MonthBuy = G.Select(s => s.NgayDatHang.Value.Month),
                           }).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult CustomerOrder(FormCollection fc)
        {
            string name = fc["txtName"];
            if (name != null && name != "")
            {
                var orders = db.Orders.Include(m => m.TrangThai);
                return View(orders.Where(s => s.Customer.TenKH.ToUpper().Contains(name.ToUpper())).OrderByDescending(p => p.ID));
            }
            else
            {
                var orders = db.Orders.Include(p => p.TrangThai);
                return View(orders.OrderBy(p => p.ID));
            }
        }

        public ActionResult ProductOrder()
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.TrangThai);
            return View(orders.ToList());
        }

        public JsonResult CustomerOrders(string Prefix, int Year)
        {
            var result = db.Orders
                           .Join(db.OrderDetails, o => o.ID, e => e.HD_ID, (orders, orderdetails)
                                => new { Orders = orders, OrderDetail = orderdetails })
                           .Where(b => b.Orders.Customer.TenKH.ToUpper().Contains(Prefix.ToUpper())
                                        && b.Orders.NgayDatHang.Value.Year == Year)
                           .GroupBy(b => b.Orders.NgayDatHang)
                           .Select(G => new
                           {
                               SumMoney = G.Sum(s => s.Orders.TongTien),
                               SumOrder = G.Count(),
                               Month = G.Key.Value.Month,
                               MaHD = G.Select(s => s.Orders.MaHD),
                               TenSanPham = G.Select(s => s.OrderDetail.Product.TenSanPham),
                               SoLuong = G.Select(s => s.Orders.SoLuong),
                               SumProduct = G.Sum(s => s.Orders.SoLuong),
                               TongTien = G.Select(s => s.Orders.TongTien),
                               MonthBuy = G.Select(s => s.Orders.NgayDatHang.Value.Month),
                               TenKH = G.Select(s => s.Orders.Customer.TenKH)
                           }).ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Customers(string Prefix)
        {
            List<Order> ObjList = db.Orders.ToList();
            var result = ObjList.Where(e => e.Customer.TenKH.ToUpper().StartsWith(Prefix.ToUpper()))
                .GroupBy(e => e.Customer.TenKH).Select(g => g.First()).Select(e => e.Customer.TenKH).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ProductOrders(string Prefix, int Year, int Month)
        {
            var result = db.Orders
                           .Join(db.OrderDetails, o => o.ID, e => e.HD_ID, (orders, orderdetails)
                                => new { Orders = orders, OrderDetail = orderdetails })
                           .Where(b => b.OrderDetail.Product.TenSanPham.ToUpper().Contains(Prefix.ToUpper())
                                        && b.Orders.NgayDatHang.Value.Month == Month
                                        && b.Orders.NgayDatHang.Value.Year == Year)
                           .GroupBy(b => b.Orders.NgayDatHang)
                           .Select(G => new
                           {
                               SumMoney = G.Sum(s => s.Orders.TongTien),
                               SumOrder = G.Count(),
                               Month = G.Key.Value.Month,
                               Year = G.Key.Value.Year,
                               MaHD = G.Select(s => s.Orders.MaHD),
                               TenSanPham = G.Select(s => s.OrderDetail.Product.TenSanPham),
                               SoLuong = G.Select(s => s.Orders.SoLuong),
                               SumProduct = G.Sum(s => s.Orders.SoLuong),
                               TongTien = G.Select(s => s.Orders.TongTien),
                               MonthBuy = G.Select(s => s.Orders.NgayDatHang.Value.Month)
                           }).ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ProductOrdersYear(string Prefix, int Year)
        {
            var result = db.Orders
                            .Join(db.OrderDetails, o => o.ID, e => e.HD_ID, (orders, orderdetails)
                                 => new { Orders = orders, OrderDetail = orderdetails })
                            .Where(b => b.OrderDetail.Product.TenSanPham.ToUpper().Contains(Prefix.ToUpper())
                                         && b.Orders.NgayDatHang.Value.Year == Year)
                            .GroupBy(b => b.Orders.NgayDatHang)
                            .Select(G => new
                            {
                                SumMoney = G.Sum(s => s.Orders.TongTien),
                                SumOrder = G.Count(),
                                Month = G.Key.Value.Month,
                                Year = G.Key.Value.Year,
                                MaHD = G.Select(s => s.Orders.MaHD),
                                TenSanPham = G.Select(s => s.OrderDetail.Product.TenSanPham),
                                SoLuong = G.Select(s => s.Orders.SoLuong),
                                SumProduct = G.Sum(s => s.Orders.SoLuong),
                                TongTien = G.Select(s => s.Orders.TongTien),
                                MonthBuy = G.Select(s => s.Orders.NgayDatHang.Value.Month)
                            }).ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }
        // GET: Admin/Statistics/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Admin/Statistics/Create
        public ActionResult Create()
        {
            ViewBag.KH_ID = new SelectList(db.Customers, "ID", "MaKH");
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Admin/Statistics/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,MaHD,KH_ID,TenNguoiNhan,SoNha,Duong,Quan_Huyen,Tinh_TP,NgayDatHang,NgayGiaoHang,SoLuong,TongTien,GhiChu,MaGiamGia,NgayTao,TinhTrang,NgayCapNhat,XacNhan")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.KH_ID = new SelectList(db.Customers, "ID", "MaKH", order.KH_ID);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", order.TinhTrang);
            return View(order);
        }

        // GET: Admin/Statistics/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.KH_ID = new SelectList(db.Customers, "ID", "MaKH", order.KH_ID);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", order.TinhTrang);
            return View(order);
        }

        // POST: Admin/Statistics/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaHD,KH_ID,TenNguoiNhan,SoNha,Duong,Quan_Huyen,Tinh_TP,NgayDatHang,NgayGiaoHang,SoLuong,TongTien,GhiChu,MaGiamGia,NgayTao,TinhTrang,NgayCapNhat,XacNhan")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.KH_ID = new SelectList(db.Customers, "ID", "MaKH", order.KH_ID);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", order.TinhTrang);
            return View(order);
        }

        // GET: Admin/Statistics/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Admin/Statistics/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
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

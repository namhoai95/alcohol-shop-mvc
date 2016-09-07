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
using PagedList;

namespace WebMVC.Areas.Admin.Controllers
{
    public class OrdersController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 5;
        public JsonResult autoCompleteSeach(string Prefix)
        {
            //Note : you can bind same list from database  
            List<Customer> ObjList = db.Customers.ToList();
            //Searching records from list using LINQ query  
            var CityName = (from N in ObjList
                            where N.TenKH.IndexOf(Prefix) >= 0
                            select new { N.TenKH });
            return Json(CityName, JsonRequestBehavior.AllowGet);
        }
        // GET: Admin/Orders
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            pagecurrent = page;
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.TrangThai);
            return View(orders.OrderByDescending(s => s.MaHD).Where(s => s.TinhTrang == 4 || s.TinhTrang == 2).ToList().ToPagedList(page, pagesizes));
        }

        public ActionResult Search(string txtName, int page = 1, int pageSize = 5)
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.TrangThai);
            return View("Index", orders.OrderByDescending(s => s.MaHD).Where(s => (s.TinhTrang == 4 || s.TinhTrang == 2) && s.Customer.TenKH.IndexOf(txtName) >= 0).ToList().ToPagedList(page, pagesizes));
        }

        public ActionResult PendingApproval(FormCollection fc, int page = 1, int pageSize = 5)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.TrangThai);
            return View("Index",orders.OrderByDescending(s => s.MaHD).Where(s => s.TinhTrang == 2).ToList().ToPagedList(page, pagesizes));
        }

        public ActionResult LoadDHXacNhan(FormCollection fc, int page = 1, int pageSize = 5)
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.TrangThai);
            return View("Index", orders.OrderByDescending(s => s.MaHD).Where(s => s.TinhTrang == 4).ToList().ToPagedList(page, pagesizes));
        }

        public ActionResult LoadDHDaHuy(FormCollection fc, int page = 1, int pageSize = 5)
        {
            var orders = db.Orders.Include(o => o.Customer).Include(o => o.TrangThai);
            return View("Index", orders.OrderByDescending(s => s.MaHD).Where(s => s.TinhTrang == 5).ToList().ToPagedList(page, pagesizes));
        }

        // GET: Admin/Orders/Details/5
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

        // GET: Admin/Orders/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            ViewBag.KH_ID = new SelectList(db.Customers, "ID", "MaKH");
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Admin/Orders/Create
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

        // GET: Admin/Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            order.XacNhan = true;
            order.TinhTrang = 4;
            db.SaveChanges();
            //ViewBag.KH_ID = new SelectList(db.Customers, "ID", "MaKH", order.KH_ID);
            //ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", order.TinhTrang);
            return RedirectToAction("Index");
        }

        // POST: Admin/Orders/Edit/5
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

        // GET: Admin/Orders/Delete/5
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
            order.TinhTrang = 5;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Admin/Orders/Delete/5
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

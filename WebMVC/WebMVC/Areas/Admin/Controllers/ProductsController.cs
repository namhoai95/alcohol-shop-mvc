using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC.Models;

namespace WebMVC.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 10;

        public ActionResult Search(string txtName,int page = 1, int pageSize = 10)
        {
            var products = db.Products.Where(p => p.TenSanPham.IndexOf(txtName) >= 0)
                            .Include(p => p.Category)
                            .Include(p => p.Manufacturer)
                            .Include(p => p.Producer)
                            .Include(p => p.TrangThai);
            return View("Index", products.OrderBy(p => p.MaSanPham).ToPagedList(page, pageSize));
        }

        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            pagecurrent = page;
            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer).Include(p => p.Producer).Include(p => p.TrangThai);
            return View(products.OrderBy(p => p.MaSanPham).ToPagedList(page, pageSize));
        }

        public JsonResult autoCompleteSeach(string Prefix)
        {
            //Note : you can bind same list from database  
            List<Product> ObjList = db.Products.ToList();
            //Searching records from list using LINQ query  
            var CityName = (from N in ObjList
                            where N.TenSanPham.IndexOf(Prefix) >= 0
                            select new { N.TenSanPham });
            return Json(CityName, JsonRequestBehavior.AllowGet);
        }
        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }
        
        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            Product product = new Product();
            string ma = db.Products.OrderByDescending(p => p.MaSanPham).First().MaSanPham;
            if (ma == null)
            {
                product.MaSanPham = "PWI0000001";
            }
            else
            {
                product.MaSanPham = CreateID.CreateIDs(db.Products.OrderByDescending(p => p.MaSanPham).First().MaSanPham, "PWI");
            }
            ViewBag.LoaiSP = new SelectList(db.Categories.Where(c => c.TinhTrang == 1), "ID", "TenLoai");
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers.Where(m => m.TrangThai == 1), "ID", "TenHangSanXuat");
            ViewBag.NhaSanXuat = new SelectList(db.Producers.Where(p => p.TrangThai == 1), "ID", "TenNSX");
            ViewBag.TypeView = new SelectList(Models.TypeView.initList(), "ID", "Name");
            return View(product);
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSanPham,TenSanPham,LoaiSP,Gia,XuatXu,NongDo,DungTich,TinhTrang,Tag,MoTa,SoLuongTon,GhiChu,NhaSanXuat,ThuongHieu,ChiTietBoSung,GiaKhuyenMai,NamSanXuat,TuKhoa,url_img,Seri,TypeView")] Product product, HttpPostedFileBase files)
        {
            if (files != null)
            {
                if (files != null && files.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(files.FileName);
                    var path = Path.Combine(Server.MapPath("~/img/products"), fileName);
                    files.SaveAs(path);
                    product.url_img = "../../img/products/" + files.FileName;
                }

                if (ModelState.IsValid)
                {
                    product.TinhTrang = 1;
                    product.SoLuotMua = 0;
                    product.SoLuotXem = 0;
                    product.Nrate = 0;
                    product.NReViews = 0;
                    product.NgayTao = DateTime.Now.ToLocalTime();

                    db.Products.Add(product);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            ViewData["Error"] = "1";
            ViewBag.LoaiSP = new SelectList(db.Categories.Where(c => c.TinhTrang == 1), "ID", "TenLoai", product.LoaiSP);
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers.Where(m => m.TrangThai == 1), "ID", "TenHangSanXuat", product.ThuongHieu);
            ViewBag.NhaSanXuat = new SelectList(db.Producers.Where(p => p.TrangThai == 1), "ID", "TenNSX", product.NhaSanXuat);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", product.TinhTrang);
            ViewBag.TypeView = new SelectList(Models.TypeView.initList(), "ID", "Name", product.TypeView);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.LoaiSP = new SelectList(db.Categories.Where(c => c.TinhTrang == 1), "ID", "TenLoai", product.LoaiSP);
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers.Where(m => m.TrangThai == 1), "ID", "TenHangSanXuat", product.ThuongHieu);
            ViewBag.NhaSanXuat = new SelectList(db.Producers.Where(p => p.TrangThai == 1), "ID", "TenNSX", product.NhaSanXuat);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", product.TinhTrang);
            ViewBag.TypeView = new SelectList(Models.TypeView.initList(), "ID", "Name", product.TypeView);

            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaSanPham,TenSanPham,LoaiSP,Gia,XuatXu,NongDo,DungTich,TinhTrang,Tag,MoTa,SoLuongTon,GhiChu,NhaSanXuat,ThuongHieu,ChiTietBoSung,GiaKhuyenMai,NamSanXuat,TuKhoa,Seri,TypeView,NReViews,Nrate,SoLuotXem,SoLuotMua,url_img,NgayTao")] Product product, HttpPostedFileBase files)
        {
            if (files != null)
            {
                if (files != null && files.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(files.FileName);
                    var path = Path.Combine(Server.MapPath("~/img/products"), fileName);
                    files.SaveAs(path);
                    product.url_img = "../../img/products/" + files.FileName;
                }
            }
            if (ModelState.IsValid)
            {
                product.NgayCapNhat = DateTime.Now.ToLocalTime();
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LoaiSP = new SelectList(db.Categories.Where(c => c.TinhTrang == 1), "ID", "TenLoai", product.LoaiSP);
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers.Where(m => m.TrangThai == 1), "ID", "TenHangSanXuat", product.ThuongHieu);
            ViewBag.NhaSanXuat = new SelectList(db.Producers.Where(p => p.TrangThai == 1), "ID", "TenNSX", product.NhaSanXuat);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", product.TinhTrang);
            ViewBag.TypeView = new SelectList(Models.TypeView.initList(), "ID", "Name", product.TypeView);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Product product = db.Products.Find(id);
                if (product == null)
                {
                    return HttpNotFound();
                }
                else
                {
                    db.Products.Remove(product);
                    db.SaveChanges();
                }
            }
            catch
            {
                ViewData["Error"] = "1";
            }

            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer).Include(p => p.Producer).Include(p => p.TrangThai);
            return View("Index", products.OrderBy(p => p.MaSanPham).ToPagedList(pagecurrent, pagesizes));
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Lock(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Product product = db.Products.Find(id);
                if (product == null)
                {
                    return HttpNotFound();
                }
                else
                {
                    db.Products.Find(id).TinhTrang = 3;
                    db.Entry(product).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Trace.TraceInformation("Property: {0} Error: {1}", validationError.
                        PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer).Include(p => p.Producer).Include(p => p.TrangThai);
            return View("Index", products.OrderBy(p => p.MaSanPham).ToPagedList(pagecurrent, pagesizes));
        }

        public ActionResult unLock(int? id)
        {
            if (!checkLogin()) return View("R", new StrObject(Request.Url.ToString()));
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Product product = db.Products.Find(id);
                if (product == null)
                {
                    return HttpNotFound();
                }
                else
                {
                    db.Products.Find(id).TinhTrang = 1;
                    db.Entry(product).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Trace.TraceInformation("Property: {0} Error: {1}", validationError.
                        PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer).Include(p => p.Producer).Include(p => p.TrangThai);
            return View("Index", products.OrderBy(p => p.MaSanPham).ToPagedList(pagecurrent, pagesizes));
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

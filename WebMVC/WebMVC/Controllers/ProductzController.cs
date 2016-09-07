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

namespace WebMVC.Controllers
{
    public class ProductzController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();

        public ActionResult z()
        {
            return View();
        }
        public JsonResult autocompleteSearch(string Prefix)
        {
            //Note : you can bind same list from database  
            List<Product> ObjList = db.Products.ToList();
            //Searching records from list using LINQ query  
            var CityName = (from N in ObjList
                            where N.TenSanPham.ToLower().StartsWith(Prefix.ToLower())
                            select new { N.TenSanPham });
            return Json(CityName, JsonRequestBehavior.AllowGet);
        }
        public ActionResult P(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null || product.TrangThai.ID != 1)
            {
                return HttpNotFound();
            }
            if(product.Tag == null)
            {
                product.Tag = "";
            }

            product.SoLuotXem = product.SoLuotXem + 1;
            db.Entry(product).State = EntityState.Modified;
            db.SaveChanges();

            return View(product);
        }
        public PartialViewResult RelatedProductPartialView(int id)
        {
            return PartialView(db.Products.Where(x => x.LoaiSP == id).OrderBy(x => x.TenSanPham).ToList());
        }
        // GET: Productz
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer).Include(p => p.Producer).Include(p => p.TrangThai);
            return View(products.ToList());
        }

        // GET: Productz/Details/5
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

        // GET: Productz/Create
        public ActionResult Create()
        {
            ViewBag.LoaiSP = new SelectList(db.Categories, "ID", "MaLoai");
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers, "ID", "Ma");
            ViewBag.NhaSanXuat = new SelectList(db.Producers, "ID", "MaNSX");
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Productz/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,MaSanPham,TenSanPham,LoaiSP,Gia,XuatXu,NongDo,DungTich,SoLuotXem,TinhTrang,Tag,MoTa,SoLuongTon,GhiChu,NhaSanXuat,ThuongHieu,ChiTietBoSung,GiaKhuyenMai,NamSanXuat,NgayTao,TuKhoa,SoLuotMua,url_img,Seri,NgayCapNhat,TypeView,Nrate,NReViews")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LoaiSP = new SelectList(db.Categories, "ID", "MaLoai", product.LoaiSP);
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers, "ID", "Ma", product.ThuongHieu);
            ViewBag.NhaSanXuat = new SelectList(db.Producers, "ID", "MaNSX", product.NhaSanXuat);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", product.TinhTrang);
            return View(product);
        }

        // GET: Productz/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.LoaiSP = new SelectList(db.Categories, "ID", "MaLoai", product.LoaiSP);
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers, "ID", "Ma", product.ThuongHieu);
            ViewBag.NhaSanXuat = new SelectList(db.Producers, "ID", "MaNSX", product.NhaSanXuat);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", product.TinhTrang);
            return View(product);
        }

        // POST: Productz/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaSanPham,TenSanPham,LoaiSP,Gia,XuatXu,NongDo,DungTich,SoLuotXem,TinhTrang,Tag,MoTa,SoLuongTon,GhiChu,NhaSanXuat,ThuongHieu,ChiTietBoSung,GiaKhuyenMai,NamSanXuat,NgayTao,TuKhoa,SoLuotMua,url_img,Seri,NgayCapNhat,TypeView,Nrate,NReViews")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LoaiSP = new SelectList(db.Categories, "ID", "MaLoai", product.LoaiSP);
            ViewBag.ThuongHieu = new SelectList(db.Manufacturers, "ID", "Ma", product.ThuongHieu);
            ViewBag.NhaSanXuat = new SelectList(db.Producers, "ID", "MaNSX", product.NhaSanXuat);
            ViewBag.TinhTrang = new SelectList(db.TrangThais, "ID", "TenTrangThai", product.TinhTrang);
            return View(product);
        }

        // GET: Productz/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Productz/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
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
        //Partial so sánh sản phẩm
        public PartialViewResult CompareProductPartial()
        {
            return PartialView(db.Products.OrderBy(x => x.TenSanPham).ToList());
        }

        // view sản phẩm cho thanh trượt slibar trên slibar-left
        public PartialViewResult SliderBarProductPartial()
        {
            return PartialView(db.Products.Where(x => x.TypeView == 2).OrderBy(x => x.TenSanPham).ToList());
        }

        // view sản phẩm bán chạy
        public PartialViewResult BestSellerProductPartial()
        {
            return PartialView(db.Products.Where(x => x.TypeView == 1).OrderBy(x => x.TenSanPham).ToList());
        }

        // view sản phẩm đặc biệt
        public PartialViewResult SliderSpecialProductPartial()
        {
            return PartialView(db.Products.Where(x => x.TypeView == 4).OrderBy(x => x.TenSanPham).ToList());
        }


        // view sản phẩm sắp bán
        public PartialViewResult ListProductFeaturePartial()
        {
            return PartialView(db.Products.Where(x => x.TypeView == 3).OrderBy(x => x.TenSanPham).ToList());
        }

        // view sản phẩm mới
        public PartialViewResult ListNewCollectionPartial()
        {
            return PartialView(db.Products.Where(x => x.TypeView == 0).OrderBy(x => x.TenSanPham).ToList());
        }


        // view sản phẩm random
        public PartialViewResult ListRandomProductPartial()
        {
            return PartialView(db.Products.OrderBy(x => x.TenSanPham).ToList());
        }


        // danh sach logo duoi cung tren trang chu
        public PartialViewResult ListLogoProductPartial()
        {
            return PartialView(db.Comments.ToList());
        }

        public PartialViewResult ListReviewsPartial(int id)
        {
            var reviews = db.ReViews.Where(r => r.Products_ID == id);
            ViewBag.ID = id;
            return PartialView(reviews.ToList());
        }

        public ActionResult AddReview(int id, string txtReviews, string SendA)
        {
            ReView r = new ReView();
            r.Products_ID = id;
            r.ReViews = txtReviews;
            r.Rate = Convert.ToInt32(SendA);
            r.GhiChu = "";
            r.TrangThai = true;

            if (!FormsAuthentication.CookiesSupported || Request.Cookies[FormsAuthentication.FormsCookieName] == null)
            {
                r.TacGia = "User";
            }
            else
            {
                string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                r.TacGia = username;
            }
            r.NgayTao = DateTime.Now.ToLocalTime();

            db.ReViews.Add(r);
            db.SaveChanges();
            Product product = db.Products.Find(id);
            int nreview = db.ReViews.Where(re => re.Products_ID == id).Count();
            float nrate = (float)db.ReViews.Where(rew => rew.Products_ID == id).Sum(rew => rew.Rate) / nreview;
            product.NReViews = nreview;
            product.Nrate = nrate;
            db.Entry(product).State = EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("ListReviewsPartial", new { id = id });
        }

        public ActionResult SearchPartial()
        {
            ViewBag.LoaiSP = new SelectList(db.Categories.Where(c => c.TinhTrang == 1), "ID", "TenLoai", db.Categories.Where(c => c.TinhTrang == 1).First().ID);
            return PartialView();
        }

        public ActionResult previousProduct(int id)
        {
            int rs = id;
            try
            { 
                Product pro = db.Products.Find(id);
                Product product = db.Products.Where(p => p.ID < pro.ID && p.LoaiSP == pro.LoaiSP).OrderBy(p => p.ID).Take(1).Single();
                return RedirectToAction("P", new { id = product.ID });
            }
            catch
            {
                return RedirectToAction("P", new { id = rs });
            }
        }

        public ActionResult nextProduct(int id)
        {
            int rs = id;
            try
            {
                Product pro = db.Products.Find(id);
                Product product = db.Products.Where(p => p.ID > pro.ID && p.LoaiSP == pro.LoaiSP).OrderBy(p => p.ID).Take(1).Single();
                return RedirectToAction("P", new { id = product.ID });
            }
            catch
            {
                return RedirectToAction("P", new { id = rs });
            }
        }
    }
}

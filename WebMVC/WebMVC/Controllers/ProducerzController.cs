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
    public class ProducerzController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();

        public ActionResult P(int id, int page = 1, int pageSize = 10)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                var category = db.Producers.Find(id);

                if (category == null || category.TrangThai1.ID != 1)
                {
                    return HttpNotFound();
                }
                ProducerView z = new ProducerView(category, category.Products.ToList().OrderBy(p => p.ID).ToPagedList(page, pageSize));
                
                return View(z);
            }
            catch
            {
                RedirectToAction("Index", "Fteam");
            }
            return View();
        }
        //MenuPPartial
        public PartialViewResult MenuPPartial()
        {
            return PartialView(db.Producers.Where(x => x.TrangThai1.ID == 1).OrderBy(x => x.TenNSX).ToList());
        }
        // GET: Producerz
        public ActionResult Index()
        {
            var producers = db.Producers.Include(p => p.TrangThai1);
            return View(producers.ToList());
        }

        // GET: Producerz/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producers.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            return View(producer);
        }

        // GET: Producerz/Create
        public ActionResult Create()
        {
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai");
            return View();
        }

        // POST: Producerz/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,MaNSX,TenNSX,DiaChi,SDT,TuKhoa,TrangThai,NgayTao,NgayCapNhat,GhiChu")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                db.Producers.Add(producer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", producer.TrangThai);
            return View(producer);
        }

        // GET: Producerz/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producers.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", producer.TrangThai);
            return View(producer);
        }

        // POST: Producerz/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MaNSX,TenNSX,DiaChi,SDT,TuKhoa,TrangThai,NgayTao,NgayCapNhat,GhiChu")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(producer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TrangThai = new SelectList(db.TrangThais, "ID", "TenTrangThai", producer.TrangThai);
            return View(producer);
        }

        // GET: Producerz/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producers.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            return View(producer);
        }

        // POST: Producerz/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Producer producer = db.Producers.Find(id);
            db.Producers.Remove(producer);
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

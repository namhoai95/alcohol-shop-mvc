using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVC.Models;

namespace WebMVC.Controllers
{
    public class PageJobzController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        // GET: PageJobz
        public ActionResult Index()
        {
            return View(db.Jobs.Where(j => j.TrangThai == true).OrderByDescending(j => j.dayupdate).Take(5).ToList());
        }

        // GET: PageJobz/Details/5
        public ActionResult Details(decimal id)
        {
            Job j = db.Jobs.Find(id);
            ViewBag.CurTime = getStrTime(j.id);
            return View(j);
        }

        public String getStrTime(Decimal q)
        {
            Decimal d = Decimal.Parse((DateTime.Now.Ticks/1000).ToString());
            long k = long.Parse((d - q).ToString());
            TimeSpan elapsedSpan = new TimeSpan(k);
            double kc = elapsedSpan.TotalMilliseconds;
            if (kc < 60000)
            {
                return ((int)(kc / 1000) + " giây trước");
            }
            else if (kc < 3600000)
            {
                return ((int)(kc / 60000) + " phút trước");
            }
            else if (kc < (24 * 3600000))
            {
                return ((int)(kc / 3600000) + " giờ trước");
            }
            else
            {
                return ((int)(kc / (24 * 36000000)) + " ngày trước");
            }
        }

        // GET: PageJobz/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PageJobz/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: PageJobz/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: PageJobz/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: PageJobz/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: PageJobz/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public PartialViewResult _NewsPartial()
        {
            return PartialView(db.Jobs.Where(j => j.TrangThai == true).OrderByDescending(j => j.dayupdate).Take(5).ToList());
        }
    }
}

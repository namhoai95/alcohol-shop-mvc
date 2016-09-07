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
using WebMVC.Areas.Admin.Models;
using System.Web.Security;

namespace WebMVC.Areas.Admin.Controllers
{
    public class ContactsController : Controller
    {
        private fteamwineEntities db = new fteamwineEntities();
        static int pagecurrent;
        int pagesizes = 10;
        // GET: Admin/Contacts
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            pagecurrent = page;
            var contacts = db.Contacts.ToList();
            List<ContactView> v = new List<ContactView>();
            foreach(Contact c in contacts)
            {
                ContactView cv = new ContactView(c);
                v.Add(cv);
            }
            return View(v.OrderBy(c => c.id).ToPagedList(page,pageSize));
        }

        // GET: Admin/Contacts/Details/5
        public ActionResult Details(decimal id)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);

            if (contact == null)
            {
                return HttpNotFound();
            }
            
            ContactView cv = new ContactView(contact);
            cv.totalRecord = db.Contacts.ToList().Count();

            contact.trangthai = false;
            db.Entry(contact).State = EntityState.Modified;
            db.SaveChanges();


            return View(cv);
        }

        // GET: Admin/Contacts/Create
        public ActionResult Create()
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            return View();
        }

        // POST: Admin/Contacts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,ip,thoigian,name,email,tieude,noidung,trangthai")] Contact contact)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (ModelState.IsValid)
            {
                db.Contacts.Add(contact);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contact);
        }

        

        // GET: Admin/Contacts/Delete/5
        public ActionResult Delete(decimal id)
        {
            if (!checkLogin()) return RedirectToAction("R", "Users", new StrObject(Request.Url.ToString()));
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Admin/Contacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(decimal id)
        {
            Contact contact = db.Contacts.Find(id);
            db.Contacts.Remove(contact);
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC.Models;
using WebMVC.ViewModels;

namespace WebMVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        WineStoreEntities storeDB = new WineStoreEntities();
        private fteamwineEntities db = new fteamwineEntities();
        // GET: ShoppingCart
        public ActionResult Index()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(),
                CartTotal = Convert.ToInt32(cart.GetTotal())
            };
            // Return the view
            return View(viewModel);
        }
        public ActionResult AddToCart(int id)
        {
            if(!checkLogin())
            {
                var rsr = new Result
                {
                    error = -1,
                    msg = "Vui lòng đăng nhập"
                };
                return Json(rsr);
            }
            var addedProduct = db.Products.Where(c => c.ID == id).First();
            var cart = ShoppingCart.GetCart(this.HttpContext);
            cart.AddToCart(addedProduct);

            var rs = new Result
            {
                error = 0,
                msg = ""
            };
            return Json(rs);
            //return RedirectToAction("Index");
        }
        [Route("/ShoppingCart/UpdateCart/{id}/{sl}")]
        public ActionResult UpdateCart(int id, int sl)
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            cart.UpdateCart(id, sl);
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(),
                CartTotal = Convert.ToInt32(cart.GetTotal())
            };
            return View("Index",viewModel);
        }
        public ActionResult CheckOutCart()
        {
            if (!checkLogin())
            {
                return View();
            }
            
            // Return the view
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CheckOutCart(OrderView od)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(od);
                }
                if (!checkLogin())
                {
                    ViewData["Error"] = "5";
                    return View();
                }
                string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                if (username.Length <= 0)
                {
                    ViewData["Error"] = "5";
                    return View();
                }
                MembershipUser u = Membership.GetUser(username);
                if (u == null)
                {
                    ViewData["Error"] = "4";
                    return View();
                }
                Customer cus = db.Customers.Where(cs => cs.Email.Equals(u.Email)).First();

                if (cus == null)
                {
                    ViewData["Error"] = "3";
                    return View();
                }
                int rs = ShoppingCart.SaveOrder(this.HttpContext, od, cus);
                if (rs > 0)
                {
                    TempData["Success"] = "0";
                    return View();
                }
                else
                {
                    ViewData["Error"] = "2";
                    return View();
                }
            }
            catch
            {
                ViewData["Error"] = "2";
                return View();
            }

           
        }
        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            string productName = db.Products
               .Single(item => item.ID == id).TenSanPham;
            int itemCount = cart.RemoveFromCart(id);
            var results = new ShoppingCartRemoveViewModel
            {
                Message = Server.HtmlEncode(productName) +
                    " has been removed from your shopping cart.",
                CartTotal = Convert.ToInt32(cart.GetTotal()),
                CartCount = cart.GetCount(),
                ItemCount = itemCount,
                DeleteId = id
            };
            return Json(results);
        }
        [ChildActionOnly]
        public ActionResult CartSummary()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);

            ViewData["CartCount"] = cart.GetCount();
            return PartialView("CartSummary");
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
                if (roles.Length < 0)
                {
                    return false;
                }
                MembershipUserCollection l = Membership.FindUsersByName(username);
                foreach (MembershipUser us in l)
                {
                    if (us.IsApproved)
                        return true;

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
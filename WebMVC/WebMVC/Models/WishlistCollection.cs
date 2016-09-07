using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace WebMVC.Models
{
    public class WishlistCollection
    {
        string WishlistCollectionId { get; set; }

        WineStoreEntities storeDB = new WineStoreEntities();
        private fteamwineEntities db = new fteamwineEntities();
        public static WishlistCollection GetCart(HttpContextBase context)
        {
            var wl = new WishlistCollection();
            wl.WishlistCollectionId = wl.GetCartId(context);
            return wl;
        }
        // Helper method to simplify shopping cart calls
        public static WishlistCollection GetCart(Controller controller)
        {
            return GetCart(controller.HttpContext);
        }

        public void AddToCart(Product p,int _iduser,String _ip)
        {
            // Get the matching cart and album instances
            var cartItem = db.UaThichs.SingleOrDefault(
                c => c.iduser == _iduser
                && c.idsanpham == p.ID);
            

            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists
                cartItem = new UaThich
                {
                    id = decimal.Parse((DateTime.Now.Ticks / TimeSpan.TicksPerSecond).ToString()),
                    idsanpham = p.ID,
                    idwl = WishlistCollectionId,
                    iduser = _iduser,
                    ip = _ip
                };
                db.UaThichs.Add(cartItem);
            }
            else
            {
                
            }
            // Save changes
            db.SaveChanges();
        }



        public void RemoveFromCart(int id,int idu)
        {
            // Get the cart
            var cartItem = db.UaThichs.SingleOrDefault(
                c => c.iduser == idu
                && c.idsanpham == id);

          

            if (cartItem != null)
            {
                db.UaThichs.Remove(cartItem);
                // Save changes
                db.SaveChanges();
            }
            
        }

        public void EmptyCart(int idu)
        {
            var cartItems = db.UaThichs.Where(
                cart => cart.iduser == idu);

            foreach (var cartItem in cartItems)
            {
                db.UaThichs.Remove(cartItem);
            }
            // Save changes
            db.SaveChanges();
        }

        public List<UaThich> GetCartItems(int idu)
        {
            return db.UaThichs.Where(
                cart => cart.iduser == idu).ToList();
        }

        
        public int GetTotal(int idu)
        {
            return db.UaThichs.Where(
                cart => cart.iduser == idu).ToList().Count;
        }
        public const string CartSessionKey = "WLId";
        public string GetCartId(HttpContextBase context)
        {
            if (context.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(context.User.Identity.Name))
                {
                    context.Session[CartSessionKey] =
                        context.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid class
                    Guid tempCartId = Guid.NewGuid();
                    // Send tempCartId back to client as a cookie
                    context.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return context.Session[CartSessionKey].ToString();
        }


        public static String CreateIDs(String ma, String Chuoi)
        {
            //String ma1 = ma;
            string[] lines = Regex.Split(ma, Chuoi);
            int m = Convert.ToInt32(lines[1]) + 1;
            int leng = lines[1].Length;
            String o = String.Concat(Enumerable.Repeat("0", leng - m.ToString().Length));
            String news = Chuoi + o + m;
            return news;
        }
        
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using WebMVC.ViewModels;

namespace WebMVC.Models
{
    public class ShoppingCart
    {
        string ShoppingCartId { get; set; }

        WineStoreEntities storeDB = new WineStoreEntities();
        private fteamwineEntities db = new fteamwineEntities();
        public static ShoppingCart GetCart(HttpContextBase context)
        {
            var cart = new ShoppingCart();
            cart.ShoppingCartId = cart.GetCartId(context);
            return cart;
        }
        // Helper method to simplify shopping cart calls
        public static ShoppingCart GetCart(Controller controller)
        {
            return GetCart(controller.HttpContext);
        }

        public void AddToCart(Product p)
        {
            // Get the matching cart and album instances
            var cartItem = db.Carts.SingleOrDefault(
                c => c.CartId == ShoppingCartId
                && c.ProductId == p.ID);
            var pr = db.Carts.Where(c => c.ID > -1).OrderByDescending(c => c.ID).First();

            var p1 = db.Products.Find(p.ID);
            if (p1 == null) return;
            if (p1.SoLuongTon == 0 )
            {
                return;
            }
            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists
                cartItem = new Cart
                {
                    ID = pr.ID + 1,
                    ProductId = p.ID,
                    CartId = ShoppingCartId,
                    Count = 1,
                    DateCreated = DateTime.Now
                };
                db.Carts.Add(cartItem);
            }
            else
            {
                // If the item does exist in the cart, 
                // then add one to the quantity
                cartItem.Count++;
            }
            // Save changes
            db.SaveChanges();
        }

        
        public void UpdateCart(int id,int sl)
        {
            // Get the matching cart and album instances
            var cartItem = db.Carts.SingleOrDefault(
                c => c.CartId == ShoppingCartId
                && c.ProductId == id);
            var pr = db.Carts.Where(c => c.ID > -1).OrderByDescending(c => c.ID).First();

            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists
                cartItem = new Cart
                {
                    ID = pr.ID + 1,
                    ProductId = id,
                    CartId = ShoppingCartId,
                    Count = sl,
                    DateCreated = DateTime.Now
                };
                db.Carts.Add(cartItem);
            }
            else
            {
                // If the item does exist in the cart, 
                // then add one to the quantity
                sl = sl <= 0 ? 0 : sl;
                cartItem.Count = sl;
            }
            // Save changes
            db.SaveChanges();
        }
        public int RemoveFromCart(int id)
        {
            // Get the cart
            var cartItem = db.Carts.Single(
                cart => cart.CartId == ShoppingCartId
                && cart.ProductId == id);

            int itemCount = 0;

            if (cartItem != null)
            {
                if (cartItem.Count > 1)
                {
                    cartItem.Count--;
                    itemCount = (int)cartItem.Count;
                }
                else
                {
                    db.Carts.Remove(cartItem);
                }
                // Save changes
                db.SaveChanges();
            }
            return itemCount;
        }

        public void EmptyCart()
        {
            var cartItems = db.Carts.Where(
                cart => cart.CartId == ShoppingCartId);

            foreach (var cartItem in cartItems)
            {
                db.Carts.Remove(cartItem);
            }
            // Save changes
            db.SaveChanges();
        }

        public List<Cart> GetCartItems()
        {
            return db.Carts.Where(
                cart => cart.CartId == ShoppingCartId).ToList();
        }

        public int GetCount()
        {
            // Get the count of each item in the cart and sum them up
            int? count = (from cartItems in db.Carts
                          where cartItems.CartId == ShoppingCartId
                          select (int?)cartItems.Count).Sum();
            // Return 0 if all entries are null
            return count ?? 0;
        }
        public double GetTotal()
        {
            // Multiply album price by count of that album to get 
            // the current price for each of those albums in the cart
            // sum all album price totals to get the cart total
            double? total = (from cartItems in db.Carts
                              where cartItems.CartId == ShoppingCartId
                              select (int?)cartItems.Count *
                              cartItems.Product.Gia).Sum();

            return total ?? 0.0;
        }
        public const string CartSessionKey = "CartId";
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

        
        public static int SaveOrder(HttpContextBase context,OrderView o,Customer c)
        {
            var cart = new ShoppingCart();
            cart.ShoppingCartId = cart.GetCartId(context);
            return cart.CreateOrder(o, c);
        }
        // Helper method to simplify shopping cart calls
        public static int SaveOrder(Controller controller, OrderView o, Customer c)
        {
            return SaveOrder(controller.HttpContext,o,c);
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
        public int CreateOrder(OrderView order,Customer cus)
        {
            int orderTotal = 0;
            try
            {
                var cartItems = GetCartItems();
                if(cartItems.Count() <= 0)
                {
                    return -1;
                }
                Order r = new Order();
                var x = db.Orders.Where(z => z.ID > 0);
                
                if (x.Count() > 0)
                {
                    r.ID = (db.Orders.Select(rr => rr.ID > 0)) == null ? 1 : (db.Orders.OrderByDescending(r1 => r1.ID).First().ID + 1);

                    r.MaHD = CreateIDs(db.Orders.Find(r.ID - 1).MaHD, "HD");
                }
                else
                {
                    r.ID = 1;
                    r.MaHD = "HD000001";
                }
               
                r.KH_ID = cus.ID;
                r.MaGiamGia = "";
                r.NgayCapNhat = DateTime.Now;
                r.NgayDatHang = DateTime.Now;
                r.NgayGiaoHang = DateTime.Now.AddDays(7);
                r.NgayTao = DateTime.Now;
                r.TinhTrang = 2;
                r.TenNguoiNhan = order.TenNguoiNhan;
                r.SoNha = order.SoNha;
                r.Quan_Huyen = order.Quan;
                r.Tinh_TP = order.TP;
                r.XacNhan = false;
                r.Duong = order.Duong;
                int sl = 0;
                foreach (var item in cartItems)
                {
                    sl += Convert.ToInt32(item.Count);
                    orderTotal += (Convert.ToInt32(item.Count * item.Product.Gia));
                }
                r.SoLuong = sl;
                r.TongTien = orderTotal;
                db.Orders.Add(r);
                //db.SaveChanges();
                foreach (var item in cartItems)
                {

                }
                    foreach (var item in cartItems)
                {
                    var orderDetail = new OrderDetail
                    {
                        SanPham_ID = item.ProductId,
                        HD_ID = r.ID,
                        DonGia = item.Product.Gia,
                        SoLuong = item.Count,
                        GhiChu = "",
                        NgayCapNhat = DateTime.Now,
                        NgayTao = DateTime.Now,
                        TrangThai = 2

                    };
                    var p = db.Products.Find(item.ProductId);
                    if (p == null) continue;
                    p.SoLuongTon = p.SoLuongTon - item.Count;
                    if(p.SoLuongTon < 0)
                    {
                        // huy

                        return -2;
                    }
                    p.SoLuotMua += item.Count;

                    db.OrderDetails.Add(orderDetail);

                }
                // Save the order
                db.SaveChanges();
                // Empty the shopping cart
                EmptyCart();
                // Return the OrderId as the confirmation number
                return r.ID;
            }
            catch(Exception ex)
            {
                string es = ex.ToString();
                return 0;
            }
            
        }
    }
}
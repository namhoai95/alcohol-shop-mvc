using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.Models
{
    public class CartItem : IEquatable<CartItem>
    {
        public int CartItemID { get; set; }
        public int Quantity { get; set; }
        public int ProductID { get; set; }
        public Product Product { get; set; }
        public float Price { get; set; }
        public float Total { get; set; }
        public double SubTotal { get; set; }

        public CartItem()
        {
            Product = new Product();
        }

        public CartItem(int productID)
        {
            Product = new Product();
            this.ProductID = productID;
        }
        public bool Equals(CartItem other)
        {
            return other.ProductID == this.ProductID;
        }
    }
}
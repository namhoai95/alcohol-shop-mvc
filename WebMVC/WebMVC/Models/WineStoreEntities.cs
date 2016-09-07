using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace WebMVC.Models
{
    public class WineStoreEntities : DbContext
    {
        public DbSet<Product> Products { get; set; }
        
        public DbSet<Cart>Carts{ get; set; }
        public DbSet<Order> Orders{ get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
    }
}
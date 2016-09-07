using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVC.Models;

namespace WebMVC.ViewModels
{
    public class WishlistView
    {
        public List<Product> WItems { get; set; }
        public int WTotal { get; set; }

        public WishlistView()
        {
            WItems = new List<Product>();
            WTotal = 0;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVC.Models;

namespace WebMVC.ViewModels
{
    public class CompareView
    {
        public int UserID { get; set; }
        public String UserName { get; set; }
        public String ComID { get; set; }
        public long TimeKill { get; set; }
        public List<Product> listItem { get; set; }

        public String urlReturn { get; set; }
    }
}
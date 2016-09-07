using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMVC.Models
{
    public class ProductResultView
    {
        ViewResult conten;
        Product pro;
        int Status;
        public ProductResultView() { }
        public ProductResultView(ViewResult conten, Product pro, int status)
        {
            this.conten = conten;
            this.pro = pro;
            Status = status;
        }
    }
}
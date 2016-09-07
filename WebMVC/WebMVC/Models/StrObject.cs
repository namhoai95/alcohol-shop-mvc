using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.Models
{
    public class StrObject
    {
        public StrObject(string str)
        {
            this.str = str;
        }
        public StrObject() { }



        public String str { get; set; }
        public decimal deci { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.Models
{
    public class Result
    {
        public Result(int error, string msg)
        {
            this.error = error;
            this.msg = msg;
        }
        public Result() { }
        public int error { get; set; }
        public String msg { get; set; }
    }
}
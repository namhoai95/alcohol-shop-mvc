using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVC.Models;

namespace WebMVC.Areas.Admin.Models
{
    public class JobsView
    {
        public decimal id { get; set; }
        public string title { get; set; }
        
        public string tag { get; set; }
        public Nullable<System.DateTime> day { get; set; }
        public Nullable<int> nview { get; set; }
        public Nullable<double> rate { get; set; }
        public Nullable<int> nrate { get; set; }
        public string contents { get; set; }
        public Nullable<System.DateTime> dayupdate { get; set; }
        public string usercreate { get; set; }
        public Nullable<bool> TrangThai { get; set; }

        public HttpPostedFileBase taptin { get; set; }

        
        public string img
        {
            get
            {
                if (taptin != null)
                    return taptin.FileName;
                else
                    return String.Empty;
            }
        }
    }
}
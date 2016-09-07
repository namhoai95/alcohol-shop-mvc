using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebMVC.Areas.Admin.Models
{
    public class UploadImage
    {
        [Required]
        public HttpPostedFileBase File { get; set; }
    }
}
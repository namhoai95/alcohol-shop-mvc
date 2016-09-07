using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebMVC.ViewModels
{
    public class OrderView
    {
        [Required(ErrorMessage = "Vui lòng nhập tên người nhận")]
        public String TenNguoiNhan { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số nhà")]
        public String SoNha { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên đường")]
        public String Duong { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập quận")]
        public String Quan { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tỉnh/ thành phố")]
        public String TP { get; set; }
    }
}
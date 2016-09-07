using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebMVC.ViewModels
{
    public class RegisterViewModel
    {
        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        public string TenKH { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public string DiaChi { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        [Phone(ErrorMessage = "Số điện thoại không hợp lệ")]
        public string SDT { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email")]
        [EmailAddress(ErrorMessage ="Email không hợp lệ")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tài khoản")]
        [StringLength(1000, MinimumLength = 6, ErrorMessage = "Tài khoàn dài ít nhất 6 kí tự")]
        public string TaiKhoan { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [StringLength(1000, MinimumLength = 6, ErrorMessage = "Mật khẩu dài ít nhất 6 kí tự")]
        [DataType(DataType.Password)]
        public string MatKhau { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập xác nhận mật khẩu")]
        [DataType(DataType.Password)]
        [Compare("MatKhau")]
        public string Confirm { get; set; }

        
        //[MustBeTrue(ErrorMessage = "Vui lòng đánh dấu check vào ô !")]
        //public bool checkb { get; set; }
    }
    
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = false)]
    public class MustBeTrueAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            return value != null && value is bool && (bool)value;
        }
    }
}
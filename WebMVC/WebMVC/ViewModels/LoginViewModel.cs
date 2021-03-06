﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebMVC.ViewModels
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập")]
        public String Username { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public String Password { get; set; }
        public bool Remmeber { get; set; }
    }
}
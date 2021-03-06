﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebMVC.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    public partial class Producer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Producer()
        {
            this.Products = new HashSet<Product>();
        }
    
        public int ID { get; set; }
        public string MaNSX { get; set; }
        [Required(ErrorMessage = "Tên NSX không được để trống!")]
        public string TenNSX { get; set; }
        [Required(ErrorMessage = "Địa chỉ không được để trống!")]
        public string DiaChi { get; set; }
        [Required(ErrorMessage = "Số điện thoại không được để trống!")]
        [RegularExpression("^[0-9]{6,15}$", ErrorMessage = "Số điện thoại phải từ 6-15 số!")]
        public string SDT { get; set; }
        [Required(ErrorMessage = "Từ khóa không được để trống!")]
        public string TuKhoa { get; set; }
        public Nullable<int> TrangThai { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public Nullable<System.DateTime> NgayCapNhat { get; set; }
        public string GhiChu { get; set; }
    
        public virtual TrangThai TrangThai1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }
    }
}

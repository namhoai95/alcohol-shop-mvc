//------------------------------------------------------------------------------
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
    
    public partial class Image
    {
        public int ID { get; set; }
        public Nullable<int> SanPham_ID { get; set; }
        public string Url_img { get; set; }
        public string TuKhoa { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public Nullable<int> ViTriHinh { get; set; }
        public Nullable<System.DateTime> NgayCapNhat { get; set; }
        public Nullable<double> ChieuRong { get; set; }
        public Nullable<int> TrangThai { get; set; }
        public Nullable<double> ChieuCao { get; set; }
        public string GhiChu { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual TrangThai TrangThai1 { get; set; }
    }
}

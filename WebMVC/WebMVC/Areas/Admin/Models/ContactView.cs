using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVC.Models;

namespace WebMVC.Areas.Admin.Models
{
    public class ContactView
    {
        public decimal id { get; set; }
        public string ip { get; set; }
        public Nullable<System.DateTime> thoigian { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string tieude { get; set; }
        public string noidung { get; set; }
        public Nullable<bool> trangthai { get; set; }

        public string shortEmail { get; set; }
        public string shortTieuDe { get; set; }
        public string shortNoiDung { get; set; }
        public string shortDate { get; set; }

        public int totalRecord { get; set; }
        public ContactView() { }
        public ContactView(Contact c)
        {
            id = c.id;
            ip = c.ip;
            thoigian = c.thoigian;
            name = c.name;
            email = c.email;
            tieude = c.tieude;
            noidung = c.noidung;
            trangthai = c.trangthai;
            shortTieuDe = tieude.Length < 15 ? tieude : (tieude.Substring(0, 14)+"..");
            shortNoiDung = noidung.Length < 15 ? noidung : (noidung.Substring(0, 14) + "..");
            shortEmail = tieude.Length < 15 ? tieude : (tieude.Substring(0, 14) + "..");
            shortDate = thoigian.Value.ToShortDateString();
            
        }
    }
}
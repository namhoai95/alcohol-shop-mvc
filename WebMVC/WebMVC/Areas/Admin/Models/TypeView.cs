using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.Areas.Admin.Models
{
    public class TypeView
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public TypeView() { }

        public static IEnumerable<TypeView> initList()
        {
            IEnumerable<TypeView> list = new List<TypeView>() {
                new TypeView { ID = 0, Name = "Sản phẩm mới" },
                new TypeView { ID = 1, Name = "Sản phẩm bán chạy" },
                new TypeView { ID = 2, Name = "Sản phẩm thường" },
                new TypeView { ID = 3, Name = "Sản phẩm sắp bán" },
                new TypeView { ID = 4, Name = "Sản phẩm đặt biệt" }
            };
            return list;
        }
    }
}
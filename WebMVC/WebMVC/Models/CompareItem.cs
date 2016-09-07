using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.Models
{
    public class CompareItem : IEquatable<CompareItem>
    {
        public int ProductID { get; set; }
        public List<Product> listItem { get; set; }

        public bool Equals(CompareItem other)
        {
            throw new NotImplementedException();
        }
    }
}
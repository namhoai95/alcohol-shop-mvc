using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.Models
{
    public class CategoryView
    {
        private Category category;
        private IPagedList<Product> pagedList;

        

        public CategoryView() { }

        

        public CategoryView(Category category, IPagedList<Product> pagedList)
        {
            this.Category = category;
            this.PagedList = pagedList;
        }

        public Category Category
        {
            get
            {
                return category;
            }

            set
            {
                category = value;
            }
        }

        public IPagedList<Product> PagedList
        {
            get
            {
                return pagedList;
            }

            set
            {
                pagedList = value;
            }
        }
    }
}
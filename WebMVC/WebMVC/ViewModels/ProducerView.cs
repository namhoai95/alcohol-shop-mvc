using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVC.Models;

namespace WebMVC.ViewModels
{
    public class ProducerView
    {
        private Producer m;
        private IPagedList<Product> pagedList;



        public ProducerView() { }



        public ProducerView(Producer _m, IPagedList<Product> pagedList)
        {
            this.m = _m;
            this.PagedList = pagedList;
        }

        public Producer M
        {
            get
            {
                return m;
            }

            set
            {
                m = value;
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
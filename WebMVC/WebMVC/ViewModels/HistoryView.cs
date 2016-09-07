using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVC.Models;

namespace WebMVC.ViewModels
{
    public class HistoryView
    {
        public Order order { get; set; }
        public List<OrderDetail> detail { get; set; }

        public HistoryView()
        {
            order = new Order();
            detail = new List<OrderDetail>();
        }
        
    }
}
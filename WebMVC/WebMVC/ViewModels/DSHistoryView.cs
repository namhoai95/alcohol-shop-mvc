using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.ViewModels
{
    public class DSHistoryView
    {
        public List<HistoryView> h { get; set; }
        public DSHistoryView()
        {
            h = new List<HistoryView>();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMVC.Models
{
    public class CompareCollection
    {
        private fteamwineEntities db = new fteamwineEntities();
        public int UserID { get; set; }
        public String UserName { get; set; }
        public String ComID { get; set; }
        public long TimeKill { get; set; }
        public List<Product> listItem { get; set; }
        public const string SessionKey = "ASPNETCompare";
        public const string ComSessionKey = "ComId";
        public static readonly CompareCollection Instance;
        static CompareCollection()
        {
            
            
            
            if (HttpContext.Current.Session[SessionKey] == null)
            {
                Instance = new CompareCollection();
                Instance.listItem = new List<Product>();
                Instance.TimeKill = DateTime.Now.Ticks / TimeSpan.TicksPerSecond;
                Instance.ComID = (DateTime.Now.Ticks / TimeSpan.TicksPerSecond).ToString();
                HttpContext.Current.Session[SessionKey] = Instance;
                HttpContext.Current.Session[ComSessionKey] = Instance.ComID;
            }
            else {
                Instance = (CompareCollection)HttpContext.Current.Session[SessionKey];
                long t = DateTime.Now.Ticks / TimeSpan.TicksPerSecond;
                if (Instance.TimeKill + 30 * 60 * 60 < t)
                {
                    Instance.RemoveAllItem();
                }
            }
            
        }
        protected CompareCollection() { }

        public void AddItem(int productId)
        {

            Product p = db.Products.Find(productId);
            if (p == null) return;
            foreach (Product z in listItem)
            {
                if (p.ID == z.ID)
                {
                    return;
                }
            }
            listItem.Add(p);
        }
        public void RemoveItem(int productId)
        {
            
            Product p = db.Products.Find(productId);
            if (p == null) return;

            foreach (Product z in listItem)
            {
                if (p.ID == z.ID)
                {
                    listItem.Remove(z);
                    return;
                }
            }

            int to = Instance.GetTotal();
        }
        public int GetTotal()
        {
            return listItem.Count;
        }
        public void RemoveAllItem()
        {
            int l = listItem.Count;
            listItem.RemoveRange(0, l);

        }
    }
}
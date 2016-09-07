using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace WebMVC.Areas.Admin.Controllers
{
    public class CreateID
    {
        public static String CreateIDs(String ma, String Chuoi)
        {
            //String ma1 = ma;
            string[] lines = Regex.Split(ma, Chuoi);
            int m = Convert.ToInt32(lines[1]) + 1;
            int leng = lines[1].Length;
            String o = String.Concat(Enumerable.Repeat("0", leng - m.ToString().Length));
            String news = Chuoi + o + m;
            return news;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC.Models
{
    public class MRoles
    {
        public String Name { get; set; }
        public int NumberUser { get; set; }

        public String Email { get; set; }

        public DateTime LastLoginDate { get; set; }
        public Boolean IsOnline { get; set; }

        public DateTime CreationDate { get; set; }

        public Boolean IsApproved { get; set; }
        public MRoles()
        {

        }
        public MRoles(string s, int n)
        {
            Name = s;
            NumberUser = n;
        }

        public MRoles(string name, int numberUser, string email, DateTime lastLoginDate, bool isOnline, DateTime creationDate)
        {
            Name = name;
            NumberUser = numberUser;
            Email = email;
            LastLoginDate = lastLoginDate;
            IsOnline = isOnline;
            CreationDate = creationDate;
        }

        public MRoles(string name, int numberUser, string email, DateTime lastLoginDate, bool isOnline, DateTime creationDate, bool isApproved)
        {
            Name = name;
            NumberUser = numberUser;
            Email = email;
            LastLoginDate = lastLoginDate;
            IsOnline = isOnline;
            CreationDate = creationDate;
            IsApproved = isApproved;
        }
    }
}
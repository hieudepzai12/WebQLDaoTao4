using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class Account
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }

        public Account() { }
        public Account(string username, string password, string role)
        {
            Username = username;
            Password = password;
            Role = role;
        }
    }
}
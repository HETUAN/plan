using Bruce.Paln.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bruce.Paln.Web.Helper
{
    public class Account
    {
        public static int UserId
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["user"] != null)
                {
                    string user = HttpContext.Current.Request.Cookies["user"].Value.ToString();
                    int id = Convert.ToInt32(user.Split(';')[0]);
                    return id;
                }
                return 0;
            }
        }

        public static string PassWord
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["user"] != null)
                {
                    string user = HttpContext.Current.Request.Cookies["user"].Value.ToString();
                    string pwd = user.Split(';')[1];
                    return pwd;
                }
                return null;
            }
        }

        public static bool SerUser(int id, string passWord)
        {
            try
            {
                var json = (id + ";" + passWord).ToString();

                var userCookie = new HttpCookie("user", json);
                userCookie.Expires.AddDays(1);
                HttpContext.Current.Response.Cookies.Add(userCookie);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool CheckUser()
        {
            if (HttpContext.Current.Request.Cookies["user"] != null)
            {
                string user = HttpContext.Current.Request.Cookies["user"].Value.ToString();
                int id = Convert.ToInt32(user.Split(';')[0]);
                string pwd = user.Split(';')[1];
                UserService uService = new UserService();
                var r = uService.UserExist(id, pwd);
                if (r > 0)
                {
                    return true;
                }
                else
                {
                    HttpContext.Current.Response.Cookies.Clear();
                    return false;
                }
            }
            return false;
        }

    }
}
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
                if (HttpContext.Current.Session["UserId"] == null)
                    return 0;
                else
                    return (int)HttpContext.Current.Session["UserId"];
            }
        }
    }
}
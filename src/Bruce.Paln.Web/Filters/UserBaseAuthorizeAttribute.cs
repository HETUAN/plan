using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Filters
{
    public class UserBaseAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            var user = HttpContext.Current.Session["UserID"];
            if (user == null)
            {
                filterContext.Result = new RedirectResult("/User/Index");
            }
            else
            {
                base.OnAuthorization(filterContext);
                if (filterContext.HttpContext.Response.StatusCode == 403)
                {
                    filterContext.Result = new RedirectResult("/User/Index");
                }
            }
        }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            return true;
        }
    }
}
using Bruce.Paln.Entity.ViewModel;
using Bruce.Paln.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        public ActionResult Index()
        {
            if (HttpContext.Session["UserID"] != null)
                return RedirectToAction("Home", "Home");
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginViewModel model)
        {
            //
            UserService _service = new UserService();
            var result = _service.GetViewModel(model.UserName, model.PassWord);
            if (result != null)
            {
                HttpContext.Session.Add("UserID", result.UserID);
                HttpContext.Session.Timeout = 500;
                return RedirectToAction("Home", "Home");
            }
            return View(model);
        }

        public ActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Home", "Home");
        }

        [HttpGet]
        public JsonResult GetModel()
        {
            if (HttpContext.Session["UserID"] == null)
            {
                return Json(new { }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                int UserID = (int)HttpContext.Session["UserID"];
                UserService uService = new UserService();
                return Json(uService.GetViewModel(UserID), JsonRequestBehavior.AllowGet);
            }
        }
    }
}
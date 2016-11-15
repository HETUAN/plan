using System;
using System.Web.Mvc;
using Bruce.Paln.Service;
using Bruce.Paln.Web.Helper;

namespace Bruce.Paln.Web.Controllers
{
    public class KeyCountController : Controller
    {
        readonly KeyCountService _service;

        public KeyCountController()
        {
            _service = new KeyCountService();
        }

        public ActionResult Index()
        {
            return View();
        }

        //获取最近七天数据
        public JsonResult GetLastSevenDaysData()
        {
            return Json(_service.GetLast7DayViewModels(Account.UserId), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetData(DateTime sday, DateTime eday)
        {
            return Json(_service.GetViewModels(Account.UserId, sday, eday), JsonRequestBehavior.AllowGet);
        }

    }
}
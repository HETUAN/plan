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

        //获取最近七天数据
        public JsonResult GetLastSevenDaysData()
        {
            return Json(_service.GetLast7DayViewModels(Account.UserId), JsonRequestBehavior.AllowGet);
        }

    }
}
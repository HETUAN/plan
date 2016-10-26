using Bruce.Paln.Web.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Controllers
{
    public class LeetCodeController : Controller
    {
        LeetCodeHelper _leetCode;

        public LeetCodeController()
        {
            _leetCode = new LeetCodeHelper();
        }

        //
        // GET: /LeetCode/
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult GetAllQuestion()
        {
            //
            return Json(_leetCode.GetAllQuestion(), JsonRequestBehavior.AllowGet);
        }
    }
}
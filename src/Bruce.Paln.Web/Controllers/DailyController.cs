using Bruce.Paln.Entity;
using Bruce.Paln.Service;
using Bruce.Paln.Web.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Controllers
{
    public class DailyController : Controller
    {
        private DailyService _service;

        /// <summary>
        /// 需求分析：
        /// 1. 列表页，分页每页五个可以查找。
        /// 2. 添加，在添加的时候根据当天的日期判断当天的日记是否已经存在，如果已经存在那么就直接跳到编辑页面。
        /// 3. 编辑就是编辑。
        /// 4. 暂时没有删除。
        /// </summary>
        public DailyController()
        {
            _service = new DailyService();
        }
        //
        // GET: /Daily/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetModel(int id)
        {
            return Json(_service.GetModel(id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetModelByDate(DateTime date)
        {
            return Json(_service.GetModel(Account.UserId, date), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetList()
        {
            return Json(_service.GetList(Account.UserId), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Add(DailyEntity model)
        {
            model.UserId = Account.UserId;
            //model.DailyDate = model.DailyDate.Date;
            model.DailyDate = DateTime.Now.Date;
            model.CreateTime = DateTime.Now;
            model.UpdateTime = DateTime.Now;
            return Json(new { result = _service.Insert(model) > 0 });
        }

        [HttpPost]
        public ActionResult Edit(DailyEntity model)
        {
            model.UserId = Account.UserId;
            model.CreateTime = DateTime.Now;
            model.UpdateTime = DateTime.Now;
            return Json(new { result = _service.Update(model) > 0 });
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            return Json(_service.Delete(id));
        }

        //public Action IsExist(DateTime today) { 
        //    //

        //}
    }
}
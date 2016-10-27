using Bruce.Paln.Entity;
using Bruce.Paln.Service;
using Bruce.Paln.Web.Helper;
using System;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Controllers
{
    public class NoteController : Controller
    {
        readonly NoteService _service;

        public NoteController()
        {
            _service = new NoteService();
        }

        public JsonResult GetLastModel()
        {
            return Json(_service.GetLastMode(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetModel(int id)
        {
            if (id == 0)
                return Json(new { }, JsonRequestBehavior.AllowGet);
            return Json(_service.GetMode(id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetListPager(int pageindex, int pageSize, string title)
        {
            int rows;
            var list = _service.GetList(Account.UserId, pageindex, pageSize, title, out rows);
            return Json(new { rowCount = rows, curIndex = pageindex, List = list }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Add(NoteEntity node)
        {
            //
            node.UserId = Account.UserId;
            node.CreateTime = DateTime.Now;
            node.UpdateTime = DateTime.Now;
            return Json(new { result = (_service.Insert(node) > 0) });
        }

        [HttpPost]
        public ActionResult Edit(NoteEntity node)
        {
            return Json(new { result = (_service.Update(node) > 0) });
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            return Json(_service.Delete(id));
        }
    }
}
using Bruce.Paln.Service;
using Bruce.Paln.Web.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Controllers
{
    public class SmallNoteController : Controller
    {
        private readonly SmallNoteService _service;

        public SmallNoteController()
        {
            _service = new SmallNoteService();
        }

        /// <summary>
        /// 完成项管理
        /// </summary>
        /// <returns></returns>
        public ActionResult DelList()
        {
            return View();
        }

        /// <summary>
        /// 未完成的项目
        /// </summary>
        /// <returns></returns>
        public JsonResult GetShowList()
        {
            return Json(_service.GetListByState(Account.UserId, 0), JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 以完成的项
        /// </summary>
        /// <returns></returns>
        public JsonResult GetDeleteList()
        {
            return Json(_service.GetListByState(Account.UserId, 1), JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 创建项
        /// </summary>
        /// <param name="note">内容</param>
        /// <returns></returns>
        public JsonResult AddSmallNote(string note)
        {
            var result = _service.Insert(new Entity.SmallNoteEntity() { UserId = Account.UserId, Note = note, NState = 0 });
            return Json(result > 0 ? true : false, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 更新状态
        /// </summary>
        /// <param name="id">Id</param>
        /// <param name="state">0或1（未完成或已完成）</param>
        /// <returns></returns>
        public JsonResult UpdateState(int id, int state)
        {
            return Json(_service.UpdateState(id, state, Account.UserId) > 0 ? true : false, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeleteNote(int id)
        {
            return Json(_service.Delete(id, Account.UserId) > 0 ? true : false, JsonRequestBehavior.AllowGet);
        }
    }
}
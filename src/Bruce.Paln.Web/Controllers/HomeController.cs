using Bruce.Paln.Entity;
using Bruce.Paln.Service;
using Bruce.Paln.Web.Filters;
using Bruce.Paln.Web.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Controllers
{
    public class HomeController : Controller
    {
        UserPlanService upService = new UserPlanService();
        PlanResultService prService = new PlanResultService();
        //
        // GET: /Home/
        [UserBaseAuthorizeAttribute]
        public ActionResult Index()
        {
            return View();
        }

        [UserBaseAuthorizeAttribute]
        public ActionResult Test()
        {
            return View();
        }

        [UserBaseAuthorizeAttribute]
        public ActionResult Home()
        {
            return View();
        }

        /// <summary>
        /// 获取数据列表
        /// </summary>
        /// <param name="type"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <returns></returns>
        [HttpPost]
        [UserBaseAuthorizeAttribute]
        public JsonResult GetData(int type, DateTime? startTime, DateTime? endTime)
        {
            if (startTime == null)
                startTime = DateTime.Now.Date;
            if (endTime == null)
                endTime = DateTime.Now.Date.AddDays(1);
            //var ll = upService.GetVmList().Where(item => item.HappenTime >= startTime.Value.Date && item.HappenTime.Date <= endTime.Value.Date);
            var ll = upService.GetVmList(Account.UserId, (DateTime)startTime, (DateTime)endTime);
            return Json(ll);
        }

        /// <summary>
        /// 获取计划实体
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet]
        [UserBaseAuthorizeAttribute]
        public JsonResult GetModel(int Id)
        {
            if (Id > 0)
            {
                return Json(upService.GetModel(Id), JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { }, JsonRequestBehavior.AllowGet);
            }
        }

        /// <summary>
        /// 添加计划
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [HttpPost]
        [UserBaseAuthorizeAttribute]
        public JsonResult Add(UserPlanEntity entity)
        {
            int id = upService.Insert(entity);
            var result = new { result = (id > 0 ? true : false) };
            return Json(result);
        }

        /// <summary>
        /// 编辑计划
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [HttpPost]
        [UserBaseAuthorizeAttribute]
        public JsonResult Edit(UserPlanEntity entity)
        {
            var id = upService.Update(entity);
            var result = new { result = id };
            return Json(result);
        }

        /// <summary>
        /// 删除计划
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpPost]
        [UserBaseAuthorizeAttribute]
        public JsonResult Delete(int Id)
        {
            if (Id > 0)
            {
                int row = upService.Delete(Id);
                return Json(new { result = row > 0 ? true : false });
            }
            else
            {
                return Json(new { });
            }
        }

        /// <summary>
        /// 添加结果
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [HttpPost]
        [UserBaseAuthorizeAttribute]
        public JsonResult AddResult(PlanResultEntity entity)
        {
            int id = 0;
            if (prService.ExistResult(entity.PlanId))
                id = prService.Update(entity);
            else
                id = prService.Insert(entity);
            var result = new { result = (id > 0 ? true : false) };
            return Json(result);
        }

        /// <summary>
        /// 编辑结果
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [HttpPost]
        [UserBaseAuthorizeAttribute]
        public JsonResult EditResult(PlanResultEntity entity)
        {
            int id = prService.Update(entity);
            var result = new { result = (id > 0 ? true : false) };
            return Json(result);
        }

        /// <summary>
        /// 获取结果实体
        /// </summary>
        /// <param name="planId"></param>
        /// <returns></returns>
        [UserBaseAuthorizeAttribute]
        public JsonResult GetResultModel(int planId)
        {
            return Json(prService.GetModel(planId), JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 时间是否有冲突
        /// </summary>
        /// <param name="startTime"></param>
        /// <param name="useTime"></param>
        /// <returns></returns>
        [UserBaseAuthorizeAttribute]
        public JsonResult CheckConflict(DateTime startTime, int useTime)
        {
            //
            DateTime endTime = startTime.AddMinutes(useTime);
            int result = upService.CheckConflict(Account.UserId, startTime, endTime);
            return Json(new { result = (result > 0) });
        }
    }
}
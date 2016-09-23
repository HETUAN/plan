﻿using Bruce.Paln.Entity;
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
            return Json(_service.GetMode(id));
        }

        public ActionResult GetList()
        {
            return Json(_service.GetList(Account.UserId));
        }

        public ActionResult Add(DailyEntity model)
        {
            model.UserId = Account.UserId;
            model.CreateTime = DateTime.Now;
            model.UpdateTime = DateTime.Now;
            return Json(new { result = _service.Insert(model) > 0 });
        }

        public ActionResult Edit(DailyEntity model)
        {
            model.UserId = Account.UserId;
            model.CreateTime = DateTime.Now;
            model.UpdateTime = DateTime.Now;
            return Json(new { result = _service.Update(model) > 0 });
        }

        public ActionResult Delete(int id)
        {
            return Json(_service.Delete(id));
        }
    }
}
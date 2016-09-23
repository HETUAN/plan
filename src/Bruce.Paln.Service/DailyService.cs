﻿using Bruce.Paln.Entity;
using Bruce.Paln.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Service
{
    public class DailyService
    {
        private readonly DailyRepository _repository;
        public DailyService()
        {
            _repository = new DailyRepository();
        }


        public DailyEntity GetMode(int UserId, DateTime Date)
        {
            return _repository.GetModel(UserId, Date);
        }

        public List<DailyEntity> GetList(int UserId)
        {
            return _repository.GetList(UserId);
        }

        public int Insert(DailyEntity model)
        {
            return _repository.Insert(model);
        }

        public int Update(DailyEntity model)
        {
            return _repository.Update(model);
        }

        public int Delete(int id)
        {
            return _repository.Delete(id);
        }
    }
}
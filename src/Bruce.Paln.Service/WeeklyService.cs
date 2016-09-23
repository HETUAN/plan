using Bruce.Paln.Entity;
using Bruce.Paln.Entity.ViewModel;
using Bruce.Paln.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Service
{
    public class WeeklyService
    {
        private readonly WeeklyRepository _repository;
        public WeeklyService()
        {
            _repository = new WeeklyRepository();
        }


        public WeeklyEntity GetMode(int UserId, DateTime Date)
        {
            return _repository.GetModel(UserId, Date);
        }

        public List<WeeklyViewModel> GetList(int UserId)
        {
            return _repository.GetList(UserId);
        }

        public int Insert(WeeklyEntity model)
        {
            return _repository.Insert(model);
        }

        public int Update(WeeklyEntity model)
        {
            return _repository.Update(model);
        }

        public int Delete(int id)
        {
            return _repository.Delete(id);
        }
    }
}

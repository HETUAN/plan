using Bruce.Paln.Entity;
using Bruce.Paln.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Service
{
    public class PlanResultService
    {
        public PlanResultRepository _repository;

        public PlanResultService()
        {
            _repository = new PlanResultRepository();
        }
        public PlanResult GetModel(int Id)
        {
            return _repository.GetModel(Id);
        }

        public int Insert(PlanResult model)
        {
            return _repository.Insert(model);
        }

        public int Update(PlanResult model)
        {
            return _repository.Update(model);
        }

        public bool ExistResult(int planId)
        {
            return _repository.ExistResult(planId);
        }
    }
}

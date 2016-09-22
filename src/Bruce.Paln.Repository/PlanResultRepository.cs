using Bruce.Paln.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Repository
{
    public class PlanResultRepository : BaseRepository
    {
        public PlanResult GetModel(int Id)
        {
            string sql = @"SELECT [Id]
                              ,[PlanId]
                              ,[Result]
                              ,[Summary]
                          FROM [PlanResult] WHERE PlanId = @PlanId";
            return QuerySingle<PlanResult>(OpenMsSqlConnection(), sql, new { PlanId = Id });
        }

        public int Insert(PlanResult model)
        {
            string sql = @"INSERT INTO [PlanResult]
                               ([PlanId]
                               ,[Result]
                               ,[Summary])
                         VALUES
                               (@PlanId, 
                                @Result, 
                                @Summary)";
            return Execute(OpenMsSqlConnection(), sql, model);
        }

        public int Update(PlanResult model)
        {
            string sql = @"UPDATE [PlanResult]
                               SET [Result] = @Result 
                                  ,[Summary] = @Summary 
                             WHERE [PlanId] = @PlanId";
            return Execute(OpenMsSqlConnection(), sql, model);
        }

        public bool ExistResult(int planId)
        {
            //
            string sql = @"SELECT COUNT(1)
                          FROM [PlanResult] WHERE PlanId = @PlanId";
            return QuerySingle<int>(OpenMsSqlConnection(), sql, new { PlanId = planId }) > 0;
        }

    }
}

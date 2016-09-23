using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bruce.Paln.Entity;

namespace Bruce.Paln.Repository
{
    public class DailyRepository : BaseRepository
    {
        public DailyEntity GetModel(int UserId, DateTime Date)
        {
            string sql = @"SELECT [Id]
                                  ,[UserId]
                                  ,[DailyDate]
                                  ,[Summary]
                                  ,[CreateTime]
                                  ,[UpdateTime]
                              FROM [Daily] WHERE UserId = @UserId AND DailyDate = @DailyDate";
            return QuerySingle<DailyEntity>(OpenMsSqlConnection(), sql, new { UserId = UserId, DailyDate = Date.Date });
        }

        public List<DailyEntity> GetList(int UserId)
        {
            string sql = @"SELECT [Id]
                                  ,[UserId]
                                  ,[DailyDate]
                                  ,[Summary]
                                  ,[CreateTime]
                                  ,[UpdateTime]
                              FROM [Daily] WHERE UserId = @UserId ORDER BY UpdateTime DESC";
            return Query<DailyEntity>(OpenMsSqlConnection(), sql, new { UserId = UserId });
        }

        public int Insert(DailyEntity model)
        {
            string sql = @"INSERT INTO [Daily]
                                       ([UserId]
                                       ,[DailyDate]
                                       ,[Summary]
                                       ,[CreateTime]
                                       ,[UpdateTime])
                                 VALUES
                                       (@UserId 
                                       ,@DailyDate
                                       ,@Summary
                                       ,GETDATE()
                                       ,GETDATE())";
            return Execute(OpenMsSqlConnection(), sql, model);
        }


        public int Update(DailyEntity model)
        {
            string sql = @"UPDATE [Daily]
                                           SET [UserId] = @UserId
                                              ,[DailyDate] = @DailyDate 
                                              ,[Summary] = @Summary  
                                              ,[UpdateTime] = GETDATE()
                                         WHERE Id = @Id";
            return Execute(OpenMsSqlConnection(), sql, model);
        }


        public int Delete(int id)
        {
            string sql = @"DELETE FROM [Daily] WHERE Id = @Id";
            return Execute(OpenMsSqlConnection(), sql, new { Id = id });
        }
    }
}

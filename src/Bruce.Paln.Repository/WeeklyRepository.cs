using Bruce.Paln.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Repository
{
    public class WeeklyRepository : BaseRepository
    {
        public WeeklyEntity GetModel(int userId, DateTime date)
        {
            //
            string sql = @"SELECT [Id]
                                  ,[UserId]
                                  ,[WeekDate]
                                  ,[Summary]
                                  ,[CreateTime]
                                  ,[UpdateTime]
                              FROM [Weekly] WHERE UserId = @UserId AND DailyDate = @DailyDate";
            return QuerySingle<WeeklyEntity>(OpenMsSqlConnection(), sql, new { UserId = userId, DailyDate = date.Date });
        }


        public List<WeeklyEntity> GetList(int UserId)
        {
            string sql = @"SELECT [Id]
                                  ,[UserId]
                                  ,[WeekDate]
                                  ,[Summary]
                                  ,[CreateTime]
                                  ,[UpdateTime]
                              FROM [Weekly] WHERE UserId = @UserId ORDER BY UpdateTime DESC";
            return Query<WeeklyEntity>(OpenMsSqlConnection(), sql, new { UserId = UserId });
        }

        public int Insert(WeeklyEntity model)
        {
            string sql = @"INSERT INTO [Weekly]
                                        ([UserId]
                                        ,[WeekDate]
                                        ,[Summary]
                                        ,[CreateTime]
                                        ,[UpdateTime])
                                    VALUES
                                        (@UserId
                                        ,@WeekDate
                                        ,@Summary
                                       ,GETDATE()
                                       ,GETDATE())";
            return Execute(OpenMsSqlConnection(), sql, model);
        }


        public int Update(WeeklyEntity model)
        {
            string sql = @"UPDATE [Weekly]
                                SET [UserId] = @UserId
                                    ,[WeekDate] = @WeekDate 
                                    ,[Summary] = @Summary  
                                    ,[UpdateTime] = GETDATE()
                                WHERE Id = @Id";
            return Execute(OpenMsSqlConnection(), sql, model);
        }


        public int Delete(int id)
        {
            string sql = @"DELETE FROM [Weekly] WHERE Id = @Id";
            return Execute(OpenMsSqlConnection(), sql, new { Id = id });
        }
    }
}

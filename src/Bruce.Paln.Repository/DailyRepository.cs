using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bruce.Paln.Entity;
using Bruce.Paln.Entity.ViewModel;

namespace Bruce.Paln.Repository
{
    public class DailyRepository : BaseRepository
    {
        public DailyEntity GetModel(int UserId, DateTime Date)
        {
            string sql = @"SELECT [Id]
                                  ,[UserId]
                                  ,[DailyDate]
                                  ,[Title]
                                  ,[Summary]
                                  ,[CreateTime]
                                  ,[UpdateTime]
                              FROM [Daily] WHERE UserId = @UserId AND DailyDate = @DailyDate";
            return QuerySingle<DailyEntity>(OpenMsSqlConnection(), sql, new { UserId = UserId, DailyDate = Date.Date });
        }

        public DailyEntity GetModel(int Id)
        {
            string sql = @"SELECT [Id]
                                  ,[UserId]
                                  ,[DailyDate]
                                  ,[Title]
                                  ,[Summary]
                                  ,[CreateTime]
                                  ,[UpdateTime]
                              FROM [Daily] WHERE Id = @Id";
            return QuerySingle<DailyEntity>(OpenMsSqlConnection(), sql, new { Id = Id });
        }

        public List<DailyViewModel> GetList(int UserId)
        {
            string sql = @"SELECT [Id]
                                  ,[UserId]
                                  ,[DailyDate] 
                                  ,[Title]
                                  ,[CreateTime]
                                  ,[UpdateTime]
                              FROM [Daily] WHERE UserId = @UserId ORDER BY UpdateTime DESC";
            return Query<DailyViewModel>(OpenMsSqlConnection(), sql, new { UserId = UserId });
        }

        public int Insert(DailyEntity model)
        {
            string sql = @"INSERT INTO [Daily]
                                       ([UserId]
                                       ,[DailyDate]
                                       ,[Title]
                                       ,[Summary]
                                       ,[CreateTime]
                                       ,[UpdateTime])
                                 VALUES
                                       (@UserId 
                                       ,@DailyDate
                                       ,@Title
                                       ,@Summary
                                       ,GETDATE()
                                       ,GETDATE())";
            return Execute(OpenMsSqlConnection(), sql, new
            {
                UserId = model.UserId,
                DailyDate = model.DailyDate.Date,
                Title = model.Title,
                Summary = model.Summary
            });
        }


        public int Update(DailyEntity model)
        {
            string sql = @"UPDATE [Daily]
                                           SET [Title] = @Title
                                              ,[Summary] = @Summary
                                              ,[UpdateTime] = GETDATE()
                                         WHERE Id = @Id";
            return Execute(OpenMsSqlConnection(), sql, new
            {
                Id = model.Id,
                Title = model.Title,
                Summary = model.Summary
            });
        }


        public int Delete(int id)
        {
            string sql = @"DELETE FROM [Daily] WHERE Id = @Id";
            return Execute(OpenMsSqlConnection(), sql, new { Id = id });
        }

        public int Count(DateTime today)
        {
            string sql = "SELECT COUNT(*) FROM Daily WHERE DailyDate = @Today";
            return QuerySingle<int>(OpenMsSqlConnection(), sql, new { Today = today.Date });
        }

    }
}

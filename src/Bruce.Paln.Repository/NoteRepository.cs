using Bruce.Paln.Entity;
using Bruce.Paln.Entity.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Repository
{
    public class NoteRepository : BaseRepository
    {

        public NoteEntity GetModel(int Id)
        {
            string sql = @"SELECT SELECT [Id]
                                          ,[UserId]
                                          ,[Title]
                                          ,[Note]
                                          ,[CreateTime]
                                          ,[UpdateTime]
                                      FROM [Note] WHERE Id = @Id";
            return QuerySingle<NoteEntity>(OpenMsSqlConnection(), sql, new { Id = Id });
        }

        public List<NoteViewModel> GetList(int UserId)
        {
            string sql = @"SELECT [Id]
                                ,[UserId]
                                ,[Title] 
                                ,[CreateTime]
                                ,[UpdateTime]
                              FROM [Note] WHERE UserId = @UserId ORDER BY UpdateTime DESC";
            return Query<NoteViewModel>(OpenMsSqlConnection(), sql, new { UserId = UserId });
        }

        public int Insert(NoteEntity model)
        {
            string sql = @"INSERT INTO [Note]
                                       ([UserId]
                                       ,[Note]
                                       ,[Title]
                                       ,[CreateTime]
                                       ,[UpdateTime])
                                 VALUES
                                       (@UserId
                                       ,@Note
                                       ,@Title
                                       ,GETDATE()
                                       ,GETDATE())";
            return Execute(OpenMsSqlConnection(), sql, model);
        }


        public int Update(NoteEntity model)
        {
            string sql = @"UPDATE [Note]
                                           SET [UserId] = @UserId
                                              ,[Title] = @Title  
                                              ,[Note] = @Note  
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

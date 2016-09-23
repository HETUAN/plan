using Bruce.Paln.Entity;
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
                                          ,[Note]
                                          ,[CreateTime]
                                          ,[UpdateTime]
                                      FROM [Note] WHERE Id = @Id";
            return QuerySingle<NoteEntity>(OpenMsSqlConnection(), sql, new { Id = Id });
        }

        public List<NoteEntity> GetList(int UserId)
        {
            string sql = @"SELECT [Id]
                                ,[UserId]
                                ,[Note]
                                ,[CreateTime]
                                ,[UpdateTime]
                              FROM [Note] WHERE UserId = @UserId ORDER BY UpdateTime DESC";
            return Query<NoteEntity>(OpenMsSqlConnection(), sql, new { UserId = UserId });
        }

        public int Insert(NoteEntity model)
        {
            string sql = @"INSERT INTO [Note]
                                       ([UserId]
                                       ,[Note]
                                       ,[CreateTime]
                                       ,[UpdateTime])
                                 VALUES
                                       (@UserId
                                       ,@Note
                                       ,GETDATE()
                                       ,GETDATE())";
            return Execute(OpenMsSqlConnection(), sql, model);
        }


        public int Update(NoteEntity model)
        {
            string sql = @"UPDATE [Note]
                                           SET [UserId] = @UserId
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

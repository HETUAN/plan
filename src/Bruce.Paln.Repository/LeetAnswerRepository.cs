using System.Collections.Generic;
using Bruce.Paln.Entity;
using Bruce.Paln.Entity.LeetCode;

namespace Bruce.Paln.Repository
{
    public class LeetAnswerRepository : BaseRepository
    {
        public int Insert(LeetAnswerEntity entity)
        {
            string sql = @"INSERT INTO [Leet_Answer]
                                        ([Id],[UserId],[LeetCodeId],[Status],[Answer])
                                    VALUES
                                        (@Id,@UserId,@LeetCodeId,@STATUS,@Answer)";
            return base.Execute(OpenMsSqlConnection(), sql, entity);
        }

        public int Update(LeetAnswerEntity entity)
        {
            string sql = @"UPDATE [Leet_Answer]
                                   SET [Status] = @STATUS
                                      ,[Answer] = @Answer
                                      ,[UpdateTime] = @UpdateTime
                                 WHERE  Id = @Id";
            return 0;
        }


    }
}

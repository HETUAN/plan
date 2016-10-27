using System.Collections.Generic;
using Bruce.Paln.Entity;
using Bruce.Paln.Entity.ViewModel;

namespace Bruce.Paln.Repository
{
    public class LeetQuestionRepository : BaseRepository
    {
        public LeetQuestionEntity GetNextLeetQuestion(int userId)
        {
            //
            string sql = @"SELECT TOP 1 [TotalAcs],[QuestionTitle],[QuestionArticleSlug]
                                      ,[TotalSubmitted],[QuestionTitleSlug],[QuestionArticleLive]
                                      ,[QuestionHide],[QuestionId],[Level]
                                      ,[PaidOnly],[Frequency],[Progress]
                              FROM [Leet_Question] lq 
                                  LEFT JOIN  (SELECT * FROM Leet_Answer WHERE UserId = @UserId )la 
                                  ON la.LeetCodeId = lq.question_id 
                                  WHERE la.Status IS NULL OR la.status = 0 ORDER BY lq.[question_id] ";
            return base.QuerySingle<LeetQuestionEntity>(OpenMsSqlConnection(), sql,
                new
                {
                    UserId = userId
                }
            );
        }


        public List<LeetQuestionViewModel> GetList(int userId)
        {
            string sql = @"SELECT LQ.[TotalAcs],LQ.[QuestionTitle],LQ.[QuestionArticleSlug]
                                  ,LQ.[TotalSubmitted],LQ.[QuestionTitleSlug],LQ.[QuestionArticleLive]
                                  ,LQ.[QuestionHide],LQ.[QuestionId],LQ.[Level]
                                  ,LQ.[PaidOnly],LQ.[Frequency],LQ.[Progress]
                                  ,LA.[Answer],LA.[Status],LA.[CreateTime],LA.[UpdateTime]
                              FROM [Leet_Question] LQ LEFT JOIN Leet_Answer LA 
                              ON LA.LeetCodeId = LQ.QuestionId 
                              WHERE LA.UserId = @UserId";
            return base.Query<LeetQuestionViewModel>(OpenMsSqlConnection(), sql,
                new
                {
                    UserId = userId
                }
            );
        }

    }
}

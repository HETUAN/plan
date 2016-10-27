using System.Collections.Generic;
using Bruce.Paln.Entity;
using Bruce.Paln.Entity.ViewModel;
using Bruce.Paln.Repository;

namespace Bruce.Paln.Service
{
    public class LeetQuestionService
    {
        private readonly LeetQuestionRepository _repository;

        public LeetQuestionService()
        {
            _repository = new LeetQuestionRepository();
        }

        public LeetQuestionEntity GetNextLeetQuestion(int userId)
        {
            return _repository.GetNextLeetQuestion(userId);
        }

        public List<LeetQuestionViewModel> GetList(int userId)
        {
            return _repository.GetList(userId);
        }
    }
}

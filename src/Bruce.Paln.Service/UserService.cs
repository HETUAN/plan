using Bruce.Paln.Entity.ViewModel;
using Bruce.Paln.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Service
{
    public class UserService
    {
        private readonly UserRepository _repository;

        public UserService()
        {
            _repository = new UserRepository();
        }

        public UserViewModel GetViewModel(int UserID)
        {
            return _repository.GetViewModel(UserID);
        }
        public UserViewModel GetViewModel(string userName, string passWord)
        {
            return _repository.GetViewModel(userName, passWord);
        }

        public int UserExist(int id, string passWord)
        {
            return _repository.UserExist(id, passWord);
        }
    }
}

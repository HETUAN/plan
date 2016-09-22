using Bruce.Paln.Entity.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Repository
{
    public class UserRepository : BaseRepository
    {
        public UserViewModel GetViewModel(string userName, string passWord)
        {
            //
            string sql = @"SELECT [UserID] 
                              ,[UserName]
                              ,[Name]
                              ,[Sex] 
                              ,[Email] 
                          FROM [Users] WHERE UserName = @UserName AND PassWord = @PassWord";
            return QuerySingle<UserViewModel>(OpenMsSqlConnection(), sql, new { UserName = userName, PassWord = passWord });
        }

        public UserViewModel GetViewModel(int UserID)
        {
            //
            string sql = @"SELECT [UserID] 
                              ,[UserName]
                              ,[Name]
                              ,[Sex] 
                              ,[Email] 
                          FROM [Users] WHERE UserID = @UserID";
            return QuerySingle<UserViewModel>(OpenMsSqlConnection(), sql, new { UserID = UserID });
        }
    }
}

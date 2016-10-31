using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Threading;
using System.Xml;

namespace Bruce.Plan.ScheduledTask
{
    public class SyncKeyCount
    {
        private readonly string _localPath;
        private readonly string _databaseConnStr;
        private readonly int _userId;


        public SyncKeyCount()
        {
            _databaseConnStr = "Data Source=.;Initial Catalog=Bruce;User ID=sa;Password=123.com;";
            _localPath = @"C:\tdata.td";
            _userId = 12;
        }


        public void RunAsService()
        {
            //
            Thread thread = new Thread(new ThreadStart(ThreadTask));
            thread.IsBackground = true;
            thread.Start();
        }

        private void ThreadTask()
        {
            while (true)
            {
                Run();
                Thread.Sleep(3600000);
            }
        }

        public void RunAll()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(ReadFile());
            var dayList = doc.SelectNodes("tdata/days/onedaydata");
            if (dayList != null && dayList.Count > 0)
            {
                for (int i = 0; i < dayList.Count; i++)
                {
                    try
                    {
                        string macAddr = dayList[i].Attributes["macaddr"].Value.Trim();
                        string day = dayList[i].Attributes["day"].Value.Trim();
                        string workId = dayList[i].Attributes["workid"].Value.Trim();
                        int keyCount = Convert.ToInt32(dayList[i].InnerText);
                        if (!CheckDataExist(workId, macAddr, day, _userId))
                        {
                            DateTime timeStamp = DateTime.Parse(dayList[i].Attributes["timesatmp"].Value);
                            InsertDay(workId, macAddr, day, timeStamp, keyCount, _userId);
                            Console.WriteLine("ADD:" + day);
                        }
                        else
                        {
                            UpdateDay(workId, macAddr, day, keyCount, _userId);
                            Console.WriteLine("UPDATE:" + day);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }

        public void Run()
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(ReadFile());
            var dayList = doc.SelectNodes("tdata/days/onedaydata");
            DateTime lastAddTime = DateTime.Now;
            if (dayList != null && dayList.Count > 0)
            {
                for (int i = 0; i < dayList.Count; i++)
                {
                    try
                    {
                        string macAddr = dayList[i].Attributes["macaddr"].Value.Trim();
                        if (i == 0)
                        {
                            lastAddTime = GetLastUpdateTimeInThisMac(macAddr, _userId).Date;
                        }
                        DateTime timeStamp = DateTime.Parse(dayList[i].Attributes["timesatmp"].Value);
                        if (timeStamp < lastAddTime)
                        {
                            continue;
                        }
                        string day = dayList[i].Attributes["day"].Value.Trim();
                        string workId = dayList[i].Attributes["workid"].Value.Trim();
                        int keyCount = Convert.ToInt32(dayList[i].InnerText);
                        if (!CheckDataExist(workId, macAddr, day, _userId))
                        {
                            InsertDay(workId, macAddr, day, timeStamp, keyCount, _userId);
                            Console.WriteLine("ADD:" + day);
                        }
                        else
                        {
                            UpdateDay(workId, macAddr, day, keyCount, _userId);
                            Console.WriteLine("UPDATE:" + day);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }

        private DateTime GetLastUpdateTimeInThisMac(string macaddr, int userId)
        {
            string cmdText = "SELECT MAX(AddTime) FROM KeyCount WHERE MacAddr = @MacAddr AND UserId = @UserId";
            SqlParameter[] param =
            {
                new SqlParameter("@MacAddr", macaddr), 
                new SqlParameter("@UserId", userId)
            };

            using (SqlConnection conn = new SqlConnection(_databaseConnStr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    foreach (SqlParameter p in param)
                    {
                        cmd.Parameters.Add(p);
                    }
                    conn.Open();
                    var result = cmd.ExecuteScalar();
                    return result == DBNull.Value ? DateTime.Now : Convert.ToDateTime(result);
                }
            }
        }

        private bool CheckDataExist(string workId, string macaddr, string day, int userId)
        {
            //
            int rows;
            string cmdText = "SELECT COUNT(1) FROM KeyCount WHERE MacAddr = @MacAddr AND Day = @Day AND WorkId = @WorkId AND UserId = @UserId";
            SqlParameter[] param =
            {
                new SqlParameter("@MacAddr", macaddr),
                new SqlParameter("@Day", day),
                new SqlParameter("@WorkId", workId),
                new SqlParameter("@UserId", userId)
            };

            using (SqlConnection conn = new SqlConnection(_databaseConnStr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    foreach (SqlParameter p in param)
                    {
                        cmd.Parameters.Add(p);
                    }
                    conn.Open();
                    rows = Convert.ToInt32(cmd.ExecuteScalar());
                }
                return rows > 0;
            }
        }

        private void InsertDay(string workId, string macAddr, string day, DateTime timeStamp, int keyCount, int userId)
        {
            string cmdText = @"INSERT INTO [KeyCount]([WorkId],[MacAddr],[Day],[TimeStamp],[KCount],[UserId]) VALUES (@WorkId,@MacAddr ,@DAY ,@TIMESTAMP,@KCount,@UserId)";
            SqlParameter[] param =
            {
                new SqlParameter("@WorkId", workId),
                new SqlParameter("@MacAddr", macAddr),
                new SqlParameter("@Day", day),
                new SqlParameter("@TimeStamp", timeStamp),
                new SqlParameter("@KCount", keyCount),
                new SqlParameter("@UserId", userId)
            };

            using (SqlConnection conn = new SqlConnection(_databaseConnStr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    foreach (SqlParameter p in param)
                    {
                        cmd.Parameters.Add(p);
                    }
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void UpdateDay(string workId, string macAddr, string day, int keyCount, int userId)
        {
            //

            string cmdText = @"UPDATE [KeyCount] SET [KCount] = @KCount,[UpdateTime] = GETDATE()
                                 WHERE [WorkId] = @WorkId AND [MacAddr] = @MacAddr AND [Day] = @Day AND  [UserId] = @UserId";
            SqlParameter[] param =
            {
                new SqlParameter("@WorkId", workId),
                new SqlParameter("@MacAddr", macAddr),
                new SqlParameter("@Day", day), 
                new SqlParameter("@KCount", keyCount),
                new SqlParameter("@UserId", userId)
            };

            using (SqlConnection conn = new SqlConnection(_databaseConnStr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    foreach (SqlParameter p in param)
                    {
                        cmd.Parameters.Add(p);
                    }
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private string ReadFile()
        {
            return File.ReadAllText(_localPath);
        }

    }
}

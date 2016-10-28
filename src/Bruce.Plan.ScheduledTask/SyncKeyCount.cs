using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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
            _userId = 13;
        }

        public void Run()
        {
            XmlDocument doc = new XmlDataDocument();
            doc.LoadXml(ReadFile());
            var dayList = doc.SelectNodes("tdata/days/onedaydata");
            if (dayList != null && dayList.Count > 0)
            {
                for (int i = 0; i < dayList.Count; i++)
                {
                    try
                    {
                        string macAddr = dayList[i].Attributes["macaddr"].Value;
                        string day = dayList[i].Attributes["day"].Value;
                        if (!CheckDataExist(macAddr, day))
                        {
                            string workId = dayList[i].Attributes["workid"].Value;
                            DateTime timeStamp = DateTime.Parse(dayList[i].Attributes["timesatmp"].Value);
                            int keyCount = Convert.ToInt32(dayList[i].InnerText);
                            InsertDay(workId, macAddr, day, timeStamp, keyCount, _userId);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }

        private bool CheckDataExist(string macaddr, string day)
        {
            //
            int rows;
            string cmdText = "SELECT COUNT(1) FROM KeyCount WHERE MacAddr = @MacAddr AND Day = @Day";
            SqlParameter[] param =
            {
                new SqlParameter("@MacAddr", macaddr),
                new SqlParameter("@Day", day)
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

        private string ReadFile()
        {
            return File.ReadAllText(_localPath);
        }

    }
}

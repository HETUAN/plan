using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Plan.ScheduledTask
{
    partial class Service1 : ServiceBase
    {
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            // TODO:  在此处添加代码以启动服务。
            try
            {
                SyncKeyCount syncKeyCount = new SyncKeyCount();
                syncKeyCount.RunAsService();
            }
            catch (Exception ex)
            {
                using (System.IO.StreamWriter sw = new System.IO.StreamWriter("C:\\log.txt", true))
                {
                    sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "ERROR:\n\r" + ex.ToString());
                }
            }
            Console.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "Service Start.");
        }

        protected override void OnStop()
        {
            Console.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "Service Stop.");
            // TODO:  在此处添加代码以执行停止服务所需的关闭操作。
        }
    }
}

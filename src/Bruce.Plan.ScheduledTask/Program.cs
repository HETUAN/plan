using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Plan.ScheduledTask
{
    class Program
    {
        static void Main(string[] args)
        {
            SyncKeyCount skc = new SyncKeyCount();
            skc.Run();
            Console.WriteLine("OVER!");
            Console.ReadKey();
            return;
        }
    }
}

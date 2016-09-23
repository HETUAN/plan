using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Entity
{
    public class DailyEntity
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public DateTime DailyDate { get; set; }
        public string Summary { get; set; }
        public DateTime CreateTime { get; set; }
        public DateTime UpdateTime { get; set; }
    }
}

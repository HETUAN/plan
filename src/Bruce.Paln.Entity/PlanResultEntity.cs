using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Entity
{
    public class PlanResultEntity
    {
        public int Id { get; set; }
        public int PlanId { get; set; }
        public int Result { get; set; }
        public string Summary { get; set; }
    }
}

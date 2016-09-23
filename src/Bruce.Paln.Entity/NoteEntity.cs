using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Entity
{
    public class NoteEntity
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Note { get; set; }
        public DateTime CreateTime { get; set; }
        public DateTime UpdateTime { get; set; }
    }
}

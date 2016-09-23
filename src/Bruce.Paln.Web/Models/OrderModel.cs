using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Bruce.Paln.Web.Models
{
    public class OrderModel
    {
        [Display(Name = "姓名")]
        public string UserName { get; set; }

        [Display(Name = "菜名")]
        public string Meal { get; set; }

        public DateTime? CreateTime { get; set; }
    }
}
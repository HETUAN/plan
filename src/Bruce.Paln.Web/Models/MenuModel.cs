using System.ComponentModel.DataAnnotations;

namespace Bruce.Paln.Web.Models
{
    public class MenuModel
    {
        //public int Id { get; set; }

        [Display(Name = "菜名")]
        public string MealName { get; set; }

        [Display(Name = "价格")]
        public double MealPrice { get; set; }

        [Display(Name = "图片")]
        public string Image { get; set; }
    }
}
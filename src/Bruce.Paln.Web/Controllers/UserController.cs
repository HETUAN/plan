using Bruce.Paln.Entity.ViewModel;
using Bruce.Paln.Service;
using Bruce.Paln.Web.Helper;
using System.Web.Mvc;

namespace Bruce.Paln.Web.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        public ActionResult Index()
        {

            if (Account.CheckUser())
                return RedirectToAction("Home", "Home");
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginViewModel model)
        {
            //
            UserService service = new UserService();
            string pwd = Core.MD5Helper.GetMD5(model.PassWord);
            var result = service.GetViewModel(model.UserName, pwd);
            if (result != null)
            {
                //HttpContext.Session.Add("UserID", result.UserID);
                //HttpContext.Session.Timeout = 500;
                //Account.UserId = result.UserID;
                Account.SerUser(result.UserID, pwd);
                return RedirectToAction("Home", "Home");
            }
            return View(model);
        }

        public ActionResult Logout()
        {
            HttpContext.Response.Cookies.Clear();
            return RedirectToAction("Home", "Home");
        }

        [HttpGet]
        public JsonResult GetModel()
        {
            if (Account.UserId == 0)
            {
                return Json(new { }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                //int UserID = Account.UserId;
                UserService uService = new UserService();
                return Json(uService.GetViewModel(Account.UserId), JsonRequestBehavior.AllowGet);
            }
        }
    }
}
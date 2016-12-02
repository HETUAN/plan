using Bruce.Paln.Web.Helper;
using System.Web.Mvc;
using Bruce.Paln.Entity;
using Bruce.Paln.Entity.LeetCode;
using Bruce.Paln.Service;

namespace Bruce.Paln.Web.Controllers
{
    public class LeetCodeController : Controller
    {
        readonly LeetCodeHelper _leetCode;

        public LeetCodeController()
        {
            _leetCode = new LeetCodeHelper();
        }

        //
        // GET: /LeetCode/
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult GetAllQuestion()
        {
            //
            return Json(_leetCode.GetAllQuestion(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetNextQuestion()
        {
            LeetQuestionService _service = new LeetQuestionService();
            return Json(_service.GetNextLeetQuestion(Account.UserId), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetList()
        {
            LeetQuestionService _service = new LeetQuestionService();
            return Json(_service.GetList(Account.UserId), JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddAnswer(int questionId, string answer)
        {
            LeetAnswerEntity entity = new LeetAnswerEntity();
            entity.UserId = Account.UserId;
            entity.Answer = answer;
            entity.Status = 1;
            entity.LeetCodeId = questionId;
            LeetAnswerService _service = new LeetAnswerService();
            return Json(new { result = (_service.Insert(entity) > 0) });
        }

    }
}
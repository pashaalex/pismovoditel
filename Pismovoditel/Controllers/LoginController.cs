using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pismovoditel.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Logic.Security.Logout();
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult Index(Models.LoginModel loginModel)
        {
            if (loginModel.Login.Contains("\\"))
            {
                string[] ss = loginModel.Login.Split('\\');
                if ((ss.Length == 2) && (ss.All(n => n.Length > 0)))
                {
                    bool success = Logic.Security.Login(ss[1], loginModel.Password, ss[0]);
                    if (success)
                    {
                        if (Request["backUrl"] != null)
                            return new RedirectResult(Request["backUrl"]);
                        return RedirectToAction("Index", "Home");
                    }
                    ViewData["Message"] = "Неверная комбинация Логин/Пароль";
                    return View();
                }
                else
                {
                    ViewData["Message"] = "Недопустимое имя пользователя";
                    return View();
                }
            }

            ViewData["Message"] = "Укажите рабочее пространство в формате [пространство]\\[имя]";
            return View();
        }
    }
}
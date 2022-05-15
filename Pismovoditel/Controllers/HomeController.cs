using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pismovoditel.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {            
            return View();
        }

        public ActionResult My()
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int userId = Logic.Security.GetCurrentUser().UserId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var u = db.User.FirstOrDefault(n => n.UserId == userId);
                if (u != null)
                    return View(new Models.UserModel(u));
            }

            ViewData["Message"] = "User not found";
            return View();
        }

        [HttpPost]
        public ActionResult My(Models.UserModel user)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int userId = Logic.Security.GetCurrentUser().UserId;            

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var u = db.User.FirstOrDefault(n => n.UserId == userId);
                user.IsActive = u.IsActive;
                if (!string.IsNullOrEmpty(user.OldPassword))
                {
                    if (Logic.Security.MD5(user.OldPassword) == u.PasswordMD5)
                    {
                        user.Password = Logic.Security.MD5(user.Password);                        
                        user.Sync(u, true);
                    }
                    else
                    {
                        ViewData["Message"] = "Неверный пароль!";
                        return View(new Models.UserModel(u));
                    }
                }
                else
                    user.Sync(u);

                db.SaveChanges();
            }


            return RedirectToAction("Index", "Task");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
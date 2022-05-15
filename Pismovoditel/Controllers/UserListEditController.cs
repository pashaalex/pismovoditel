using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pismovoditel.Controllers
{
    public class UserListEditController : Controller
    {
        // GET: UserListEdit
        public ActionResult Index()
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;
            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var lst = db.User.Where(n => n.WorkspaceId == workspaceId).ToList();

                return View(
                    lst
                    .Select(n => new Models.UserModel(n))
                    .ToList()
                    );
            }
        }


        // GET: UserListEdit/Create
        public ActionResult Create()
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            Models.UserModel userModel = new Models.UserModel()
            {
                IsActive = true
            };

            return View(userModel);
        }

        // POST: UserListEdit/Create
        [HttpPost]
        public ActionResult Create(Models.UserModel userModel)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                Models.User u = new Models.User();
                userModel.Password = Logic.Security.MD5(userModel.Password);
                userModel.Sync(u, true);
                u.WorkspaceId = workspaceId;
                db.User.Add(u);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        // GET: UserListEdit/Edit/5
        public ActionResult Edit(int id)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var u = db.User.FirstOrDefault(n => n.WorkspaceId == workspaceId && n.UserId == id);
                if (u != null)
                    return View(new Models.UserModel(u));
            }

            ViewData["Message"] = "User not found";
            return View();
        }

        // POST: UserListEdit/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Models.UserModel userModel)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var u = db.User.FirstOrDefault(n => n.WorkspaceId == workspaceId && n.UserId == id);
                if (u != null)
                {
                    userModel.Sync(u);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }                    
            }

            ViewData["Message"] = "User not found";
            return View();
        }

        // GET: UserListEdit/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: UserListEdit/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

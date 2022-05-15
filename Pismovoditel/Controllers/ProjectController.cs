using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace Pismovoditel.Controllers
{
    public class ProjectController : Controller
    {
        // GET: Project
        public ActionResult Index()
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var data = db.Projects
                    .Where(n => n.WorkspaceId == workspaceId)
                    .ToList();

                return View(data);
            }
        }


        // GET: Project/Create
        public ActionResult Create()
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            return View("~/Views/Project/Edit.cshtml", new Models.Project());
        }

        // POST: Project/Create
        [HttpPost]
        public ActionResult Create(Models.Project proj)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                proj.WorkspaceId = Logic.Security.GetCurrentUser().WorkspaceId;
                db.Projects.Add(proj);
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        // GET: Project/Edit/5
        public ActionResult Edit(int id)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;            

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                int[] userInProject = db.ProjectUsers.Where(n => n.ProjectId == id).Select(n => n.UserId).ToArray();
                ViewBag.UserList = new SelectList(db.User.Where(n => n.WorkspaceId == workspaceId && !userInProject.Contains(n.UserId)).ToList(), "UserId", "Login");

                ViewBag.id = id;

                return View(db
                    .Projects
                    .Include(n => n.ProjectUsers)
                    .Include(n => n.ProjectUsers.Select(p => p.User))
                    .FirstOrDefault(n => n.ProjectId == id && n.WorkspaceId == workspaceId));
            }
        }

        // POST: Project/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Models.Project proj)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var p = db.Projects.FirstOrDefault(n => n.ProjectId == id && n.WorkspaceId == workspaceId);
                p.ProjectName = proj.ProjectName;
                p.ProjectShortName = proj.ProjectShortName;
                p.IsActive = proj.IsActive;
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult AddProjectUser(int id, int NewProjectUserId, bool IsOwner, bool IsTeam, bool IsObserver)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                int[] userInProject = db.ProjectUsers.Where(n => n.ProjectId == id).Select(n => n.UserId).ToArray();
                var u = db.User.First(n => n.UserId == NewProjectUserId && n.WorkspaceId == workspaceId);
                if (!userInProject.Contains(u.UserId))
                {
                    Models.ProjectUser pu = new Models.ProjectUser();
                    pu.ProjectId = id;
                    pu.UserId = NewProjectUserId;
                    pu.IsObserver = IsObserver;
                    pu.IsOwner = IsOwner;
                    pu.IsTeam = IsTeam;
                    db.ProjectUsers.Add(pu);
                    db.SaveChanges();
                }
            }

            return RedirectToAction("Edit", new { id = id });
        }

        public ActionResult DeleteProjectUser(int userId, int projectId)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var u = db.ProjectUsers
                    .Include(n => n.User)
                    .Include(n => n.Project)
                    .Where(n => n.ProjectId == projectId && n.UserId == userId)
                    .Where(n => n.Project.WorkspaceId == workspaceId)
                    .Where(n => n.User.WorkspaceId == workspaceId)
                    .First();

                db.ProjectUsers.Remove(u);
                db.SaveChanges();
            }

            return RedirectToAction("Edit", new { id = projectId });
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Text;


namespace Pismovoditel.Controllers
{
    public class TaskController : Controller
    {
        // GET: Task
        public ActionResult Index()
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                int projectId = 0;
                if (Request["ProjectId"] != null) int.TryParse(Request["ProjectId"], out projectId);

                int taskExecutorId = 0;
                if (Request["TaskExecutorId"] != null) int.TryParse(Request["TaskExecutorId"], out taskExecutorId);

                var t = new Models.TaskListModel();
                t.ProjectId = projectId;
                t.TaskExecutorId = taskExecutorId;
                var l = db.Status.ToList();
                t.statusList = l.Select(n => new Models.CheckBoxItem() { ID = n.StatusId, Name = n.StatusName }).ToList();                
                foreach (var i in t.statusList)                
                    i.IsChecked = Request["st_" + i.ID] != "false";                

                List<int> aa = t.statusList.Where(n => n.IsChecked).Select(n => n.ID).ToList();

                t.tasks = db.Tasks
                    .Include(n => n.Priority)
                    .Include(n => n.Project)
                    .Include(n => n.Status)
                    .Include(n => n.User)
                    .Include(n => n.User1)
                    .Include(n => n.TaskType)
                    .Where(n => n.Project.IsActive == true)
                    .Where(n => n.Project.WorkspaceId == workspaceId)
                    .ToList();

                t.tasks = t.tasks.Where(n => n.ProjectId == projectId || projectId == 0)
                    .Where(n => n.TaskExecutorId == taskExecutorId || taskExecutorId == 0)
                    .Where(n => aa.Contains(n.StatusId.Value))
                    .OrderByDescending(n => n.UpdateDate)
                    .ToList();

                ViewBag.ProjectList = new SelectList(db.Projects.ToList(), "ProjectId", "ProjectName");
                ViewBag.UserList = new SelectList(db.User.Where(n => n.WorkspaceId == workspaceId).ToList(), "UserId", "FIO");

                string not_finished = "/Task/Index?" + string.Join("&",
                db.Status.Where(n => n.IsTerminal).ToList()
                    .Select(n => "st_" + n.StatusId + "=false")
                    .ToArray());
                ViewBag.NotFinishedLink = not_finished;

                ViewBag.NotFinishedLink_ForMe = not_finished + "&TaskExecutorId=" + Logic.Security.GetCurrentUser().UserId;

                return View(t);
            }            
        }

        // GET: Task/Details/5
        public ActionResult Details(int id)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                Models.TaskDetail td = new Models.TaskDetail();
                td.task = db.Tasks
                    .Include(n => n.Priority)
                    .Include(n => n.Project)
                    .Include(n => n.Status)
                    .Include(n => n.User)
                    .Include(n => n.User1)
                    .Include(n => n.TaskType)                    
                    .FirstOrDefault(n => n.TaskId == id);

                td.comments = db.Comments
                    .Include(nameof => nameof.User)
                    .Where(n => n.TaskId == id)
                    .OrderByDescending(n => n.CreateTime)
                    .ToList();

                td.logItems = Logic.TaskLogLogic.GetTaskLog(id);

                FillComboboxes();

                ViewBag.id = id;
                return View(td);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddComment(int id, Models.TaskDetail detail)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            if ((detail.comment != null) && (detail.comment.CommentText != null) && (detail.comment.CommentText.Length > 2))
            {
                using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
                {
                    var c = new Models.Comment();
                    db.Comments.Add(c);
                    c.CommentText = detail.comment.CommentText;
                    c.ActorId = Logic.Security.GetCurrentUser().UserId;
                    c.TaskId = id;
                    c.CreateTime = DateTime.Now;

                    var task_db = db.Tasks.FirstOrDefault(n => n.TaskId == id);
                    task_db.UpdateDate = DateTime.Now;                    

                    db.SaveChanges();                    
                }
            }

            return RedirectToAction("Details", new { id = id });
        }


        [HttpPost]
        public ActionResult DetailsChange(int id, Models.TaskDetail detail)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);
            Logic.TaskLogLogic.LogChanges(detail.task, id);

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var task_db = db.Tasks.FirstOrDefault(n => n.TaskId == id);
                task_db.PriorityId = detail.task.PriorityId;
                task_db.ProjectId = detail.task.ProjectId;
                task_db.StatusId = detail.task.StatusId;
                task_db.TaskExecutorId = detail.task.TaskExecutorId;
                task_db.TaskTypeId = detail.task.TaskTypeId;
                task_db.TillDate = detail.task.TillDate;
                task_db.UpdateDate = DateTime.Now;
                db.SaveChanges();
            }


            return RedirectToAction("Details", new { id = id });
        }

        /// <summary>
        /// Возвращает список пользователей для данного проекта
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public JsonResult GetActiveUsersForProject(int id)
        {
            
            if (Logic.Security.GetCurrentUser() == null) return null;
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;
            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                return Json(
                db.ProjectUsers
                    .Where(n => n.ProjectId == id && n.Project.WorkspaceId == workspaceId)
                    .Select(n => n.User)
                    .Select(n => new { ID = n.UserId, FIO = n.FIO, LOGIN = n.Login })
                    .ToList(), JsonRequestBehavior.AllowGet);
            }
        }


        public void FillComboboxes()
        {
            int workspaceId = Logic.Security.GetCurrentUser().WorkspaceId;

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                ViewBag.ProjectList = new SelectList(db.Projects.Where(n => n.WorkspaceId == workspaceId && n.IsActive == true).ToList(), "ProjectId", "ProjectName");
                ViewBag.UserList = new SelectList(db.User.Where(n => n.WorkspaceId == workspaceId).ToList(), "UserId", "Login");
                ViewBag.TaskTypeList = new SelectList(db.TaskTypes.ToList(), "TaskTypeId", "TaskTypeName");
                ViewBag.StatusList = new SelectList(db.Status.ToList(), "StatusId", "StatusName");
                ViewBag.PriorityList = new SelectList(db.Priorities.ToList(), "PriorityId", "PriorityName");
            }
        }

        // GET: Task/Create        
        public ActionResult Create()
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            FillComboboxes();

            return View("~/Views/Task/Edit.cshtml", new Models.Task());
        }

        // POST: Task/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Models.Task task)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                task.CreateDate = DateTime.Now;
                task.UpdateDate = DateTime.Now;
                task.TaskCreatorId = Logic.Security.GetCurrentUser().UserId;
                db.Tasks.Add(task);
                db.SaveChanges();

                var log = new Models.TaskLog();
                db.TaskLogs.Add(log);
                log.TaskId = task.TaskId;
                log.ActorId = Logic.Security.GetCurrentUser().UserId;
                log.ChangeTime = DateTime.Now;

                log.PriorityId = task.PriorityId;
                log.ProjectId = task.ProjectId;
                log.StatusId = task.StatusId;
                log.TaskBody = task.TaskBody;
                log.TaskExecutorId = task.TaskExecutorId;
                log.TaskName = task.TaskName;
                log.TaskTypeId = task.TaskTypeId;
                log.TillDate = task.TillDate;
                db.SaveChanges();                
            }

            return RedirectToAction("Index");
        }

        // GET: Task/Edit/5
        public ActionResult Edit(int id)
        {
            if (Logic.Security.GetCurrentUser() == null) return new RedirectResult("~/Login?backUrl=" + Request.Url);

            FillComboboxes();

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
                return View(db.Tasks.FirstOrDefault(n => n.TaskId == id));
        }

        // POST: Task/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, Models.Task task)
        {
            try
            {
                Logic.TaskLogLogic.LogChanges(task, id, false);

                using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
                {
                    var task_db = db.Tasks.FirstOrDefault(n => n.TaskId == id);
                    task_db.PriorityId = task.PriorityId;
                    task_db.ProjectId = task.ProjectId;
                    task_db.StatusId = task.StatusId;
                    task_db.TaskBody = task.TaskBody;
                    task_db.TaskExecutorId = task.TaskExecutorId;
                    task_db.TaskName = task.TaskName;
                    task_db.TaskTypeId = task.TaskTypeId;
                    task_db.TillDate = task.TillDate;
                    task_db.UpdateDate = DateTime.Now;
                    db.SaveChanges();

                    var log = new Models.TaskLog();
                    db.TaskLogs.Add(log);
                    log.TaskId = task.TaskId;
                    log.ActorId = Logic.Security.GetCurrentUser().UserId;
                    log.ChangeTime = DateTime.Now;

                    log.PriorityId = task.PriorityId;
                    log.ProjectId = task.ProjectId;
                    log.StatusId = task.StatusId;
                    log.TaskBody = task.TaskBody;
                    log.TaskExecutorId = task.TaskExecutorId;
                    log.TaskName = task.TaskName;
                    log.TaskTypeId = task.TaskTypeId;
                    log.TillDate = task.TillDate;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

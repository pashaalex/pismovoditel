using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Pismovoditel.Logic
{
    public class TaskLogLogic
    {
        enum Events
        {
            ProjectId = 1,
            TaskName = 2,
            TaskBody = 3,
            TaskExecutorId = 4,
            TillDate = 5,
            TaskTypeId = 6,
            PriorityId = 7,
            StatusId = 8
        }
        public static void LogChanges(Models.Task task, int taskId, bool partial = true)
        {
            int userId = Security.GetCurrentUser().UserId;
            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var t = db.Tasks.First(n => n.TaskId == taskId);

                if (t.ProjectId != task.ProjectId)
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.ProjectId,
                        Int1 = t.ProjectId,
                        Int2 = task.ProjectId
                    });

                if ((!partial) && (t.TaskName != task.TaskName))
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.TaskName,
                        string1 = t.TaskName,
                        string2 = task.TaskName
                    });

                if ((!partial) && (t.TaskBody != task.TaskBody))
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.TaskBody,
                        string1 = t.TaskName,
                        string2 = task.TaskName
                    });

                if (t.TaskExecutorId != task.TaskExecutorId)
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.TaskExecutorId,
                        Int1 = t.TaskExecutorId,
                        Int2 = task.TaskExecutorId
                    });

                if (t.TillDate != task.TillDate)
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.TillDate,
                        Date1 = t.TillDate,
                        Date2 = task.TillDate
                    });

                if (t.TaskTypeId != task.TaskTypeId)
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.TaskTypeId,
                        Int1 = t.TaskTypeId,
                        Int2 = task.TaskTypeId
                    });

                if (t.PriorityId != task.PriorityId)
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.PriorityId,
                        Int1 = t.PriorityId,
                        Int2 = task.PriorityId
                    });

                if (t.StatusId != task.StatusId)
                    db.TaskEventLogs.Add(new Models.TaskEventLog()
                    {
                        ActorId = userId,
                        ChangeTime = DateTime.Now,
                        TaskId = taskId,
                        EventTypeId = (int)Events.StatusId,
                        Int1 = t.StatusId,
                        Int2 = task.StatusId
                    });
                db.SaveChanges();
            }
        }

        public static List<Models.TaskLogItem> GetTaskLog(int taskId)
        {
            List<Models.TaskLogItem> ret = new List<Models.TaskLogItem>();
            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                foreach (var l in db.TaskEventLogs.Where(n => n.TaskId == taskId).ToList())
                {
                    var actor = db.User.First(n => n.UserId == l.ActorId);
                    Models.TaskLogItem i = new Models.TaskLogItem()
                    {
                        ActorFIO = actor.FIO,
                        ActorID = actor.UserId,
                        EventDate = l.ChangeTime
                    };
                    ret.Add(i);

                    switch (l.EventTypeId)
                    {
                        case (int)Events.PriorityId:
                            i.ChangeObjectName = "приоритет";
                            i.ChangeFrom = db.Priorities.First(n => n.PriorityId == l.Int1.Value).PriorityName;
                            i.ChangeTo = db.Priorities.First(n => n.PriorityId == l.Int2.Value).PriorityName;
                            break;
                        case (int)Events.ProjectId:
                            i.ChangeObjectName = "проект";
                            i.ChangeFrom = db.Projects.First(n => n.ProjectId == l.Int1.Value).ProjectName;
                            i.ChangeTo = db.Projects.First(n => n.ProjectId == l.Int2.Value).ProjectName;
                            break;
                        case (int)Events.StatusId:
                            i.ChangeObjectName = "статус";
                            i.ChangeFrom = db.Status.First(n => n.StatusId == l.Int1.Value).StatusName;
                            i.ChangeTo = db.Status.First(n => n.StatusId == l.Int2.Value).StatusName;
                            break;
                        case (int)Events.TaskExecutorId:
                            i.ChangeObjectName = "исполнителя";
                            i.ChangeFrom = (l.Int1.HasValue ? db.User.FirstOrDefault(n => n.UserId == l.Int1.Value).FIO : "Не определено");
                            i.ChangeTo = (l.Int2.HasValue ? db.User.FirstOrDefault(n => n.UserId == l.Int2.Value).FIO : "Не определено");
                            break;
                        case (int)Events.TaskBody:
                            i.ChangeObjectName = "текст задачи";
                            break;
                        case (int)Events.TaskName:
                            i.ChangeObjectName = $"название задачи";
                            i.ChangeFrom = l.string1;
                            i.ChangeTo = l.string2;
                            break;
                        case (int)Events.TaskTypeId:
                            i.ChangeObjectName = "тип задачи";
                            i.ChangeFrom = db.TaskTypes.FirstOrDefault(n => n.TaskTypeId == l.Int1.Value).TaskTypeName;
                            i.ChangeTo = db.TaskTypes.FirstOrDefault(n => n.TaskTypeId == l.Int2.Value).TaskTypeName;
                            break;
                        case (int)Events.TillDate:
                            i.ChangeObjectName = "срок задачи";
                            i.ChangeFrom = (l.Date1.HasValue ? l.Date1.Value.ToString("dd.MM.yyyy") : "Не определено");
                            i.ChangeTo = (l.Date2.HasValue ? l.Date2.Value.ToString("dd.MM.yyyy") : "Не определено");
                            break;
                    }
                }

                foreach (var l in db.Comments.Include(n => n.User).Where(n => n.TaskId == taskId).ToList())
                    ret.Add(new Models.TaskLogItem()
                    {
                        ActorFIO = l.User.FIO,
                        ActorID = l.User.UserId,
                        EventDate = l.CreateTime.Value,
                        RawHTML = l.CommentText
                    });
            }
            return ret.OrderByDescending(n => n.EventDate).ToList();
        }
    }
}
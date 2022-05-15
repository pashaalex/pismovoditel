using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pismovoditel.Models
{
    public class TaskDetail
    {
        public Task task { get; set; }
        public Comment comment { get; set; }
        public List<Comment> comments { get; set; }
        public List<TaskLogItem> logItems { get; set; }
    }
}
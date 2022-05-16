using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pismovoditel.Models
{
    public class TaskListModel
    {
        public List<Task> tasks { get; set; }
        public int? ProjectId { get; set; }
        public int? TaskExecutorId { get; set; }
        public List<CheckBoxItem> statusList { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pismovoditel.Models
{
    public class TaskLogItem
    {
        public string ActorFIO { get; set; }
        public int ActorID { get; set; }
        public DateTime EventDate { get; set; }
        public string RawHTML { get; set; }
        public string ChangeObjectName { get; set; }
        public string ChangeFrom { get; set; }
        public string ChangeTo { get; set; }
    }
}
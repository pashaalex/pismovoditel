//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pismovoditel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Task
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Task()
        {
            this.Comments = new HashSet<Comment>();
        }
    
        public int TaskId { get; set; }
        public int ProjectId { get; set; }
        public string TaskName { get; set; }
        public string TaskBody { get; set; }
        public int TaskCreatorId { get; set; }
        public Nullable<int> TaskExecutorId { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.DateTime> TillDate { get; set; }
        public int TaskTypeId { get; set; }
        public Nullable<int> PriorityId { get; set; }
        public Nullable<int> StatusId { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
    
        public virtual Priority Priority { get; set; }
        public virtual Status Status { get; set; }
        public virtual TaskType TaskType { get; set; }
        public virtual User User { get; set; }
        public virtual User User1 { get; set; }
        public virtual Project Project { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pismovoditel.Models
{
    public class CheckBoxItem
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public bool IsChecked { get; set; }
    }
}
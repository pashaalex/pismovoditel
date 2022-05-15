using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pismovoditel.Models
{
    public class UserListEdit
    {
        public List<UserModel> ExistingUsers { get; set; }
        public UserModel EditingUser { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pismovoditel.Models
{
    public class UserModel
    {
        public UserModel() { }
        public UserModel(Models.User u) {
            UserId = u.UserId;
            Login = u.Login;
            FIO = u.FIO;
            Email = u.Email;
            IsActive = u.IsActive;
            IsWorkspaceAdmin = u.IsWorkspaceAdmin;
        }
        public bool IsActive { get; set; }
        public int UserId { get; set; }
        public string Login { get; set; }
        public string FIO { get; set; }
        public string Email { get; set; }
        public bool IsWorkspaceAdmin { get; set; }
        public string Password { get; set; }
        public string OldPassword { get; set; }

        public void Sync(Models.User u, bool syncPassword = false)
        {
            u.Login = Login;
            u.FIO = FIO;
            u.Email = Email;
            u.IsActive = IsActive;
            u.IsWorkspaceAdmin = IsWorkspaceAdmin;
            if (syncPassword)
                u.PasswordMD5 = Password;
        }
    }
}
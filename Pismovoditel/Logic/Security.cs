using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Pismovoditel.Logic
{
    public class Security
    {
        public static string MD5(string input)
        {
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] arr = System.Text.Encoding.Default.GetBytes(input);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < arr.Length; i++)
                sb.Append(arr[i].ToString("x2"));
            return sb.ToString();            
        }

        public static Models.User GetCurrentUser()
        {
            object o = HttpContext.Current.Session["CurrentUser"];
            if (o is Models.User) return (Models.User)o;
            return null;
        }

        public static bool Logout()
        {
            HttpContext.Current.Session["CurrentUser"] = null;
            HttpContext.Current.Session["CurrentLogin"] = null;
            HttpContext.Current.Session["WorkspaceName"] = null;
            return true;
        }

        public static bool Login(string Login, string Password, string Workspace)
        {
            /*
            Login = "Admin";
            Password = "Qwerty11";
            Workspace = "Default";
            */
            
            Password = MD5(Password);

            using (Models.PismovoditelEntities db = new Models.PismovoditelEntities())
            {
                var user = db.User.FirstOrDefault(n => (n.Login == Login) && (n.PasswordMD5 == Password) && (n.Workspace.WorkspaceShortName == Workspace));
                if (user != null)
                {
                    HttpContext.Current.Session["CurrentUser"] = user;
                    HttpContext.Current.Session["CurrentLogin"] = user.Login;
                    HttpContext.Current.Session["WorkspaceName"] = user.Workspace.WorkspaceName;
                    return true;
                }
            }
            return false;
        }
    }
}
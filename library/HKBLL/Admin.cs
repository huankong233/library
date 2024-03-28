using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace HK.BLL
{
    public class Admin
    {
        public static bool Insert(HK.Model.Admin Admin)
        {
            return HK.DAL.Admin.Insert(Admin);
        }

        public static List<HK.Model.Admin> Get(string Name)
        {
            return HK.DAL.Admin.Get(Name);
        }

        public static HK.Model.Admin Get(int Id)
        {
            return HK.DAL.Admin.Get(Id);
        }

        public static bool CheckIsExists(string Name)
        {
            List<HK.Model.Admin> Data = HK.DAL.Admin.Get(Name);
            return Data.Count > 0;
        }

        public static string Login(HK.Model.Admin Admin)
        {
            List<HK.Model.Admin> Data = HK.DAL.Admin.Get(Admin.Name);
            if (Data.Count <= 0) return "账户不存在";
            if (Data[0].Pwd != Admin.Pwd) return "密码错误";
            HttpContext.Current.Session["Id"] = Data[0].Id;
            HttpContext.Current.Session["Name"] = Data[0].Name;
            return "登陆成功";
        }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class Admin
    {
        public static HK.Model.Admin Get(string Name)
        {
            string Sql = "select * from tb_admin where name = '" + Name + "'";
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            List<HK.Model.Admin> List = DtToList(Dt);
            if (List.Count == 0)
            {
                return null;
            }
            else
            {
                return List[0];
            }
        }

        public static HK.Model.Admin Get(int Id)
        {
            string Sql = "select * from tb_admin where id = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            List<HK.Model.Admin> List = DtToList(Dt);
            if (List.Count == 0)
            {
                return null;
            }
            else
            {
                return List[0];
            }
        }

        public static List<HK.Model.Admin> DtToList(DataTable Dt)
        {
            List<HK.Model.Admin> List = new List<HK.Model.Admin>();
            foreach (DataRow Row in Dt.Rows)
            {
                HK.Model.Admin Admin = new HK.Model.Admin();
                Admin.Id = int.Parse(Row["id"].ToString());
                Admin.Name = Row["name"].ToString();
                Admin.Pwd = Row["pwd"].ToString();
                List.Add(Admin);
            }
            return List;
        }

        public static bool Insert(HK.Model.Admin Admin)
        {
            string Sql = "insert into tb_admin (id,name,pwd) values ('" + (HK.Utils.MsSqlHelper.getNowIndex("tb_admin") + 1) + "','" + Admin.Name + "','" + Admin.Pwd + "');";
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class Bookcase
    {
        public static List<HK.Model.Bookcase> Get()
        {
            string Sql = "select * from tb_bookcase";
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static HK.Model.Bookcase Get(int Id)
        {
            string Sql = "select * from tb_bookcase where id = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt)[0];
        }

        public static List<HK.Model.Bookcase> DtToList(DataTable Dt)
        {
            List<HK.Model.Bookcase> List = new List<HK.Model.Bookcase>();
            foreach (DataRow Row in Dt.Rows)
            {
                HK.Model.Bookcase Type = new HK.Model.Bookcase();
                Type.Id = int.Parse(Row["id"].ToString());
                Type.Name = Row["name"].ToString();
                List.Add(Type);
            }
            return List;
        }

        public static bool Insert(HK.Model.Bookcase Bookcase)
        {
            string Sql = "insert into tb_bookcase (name) values ('" + Bookcase.Name + "');";
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Update(HK.Model.Bookcase Bookcase)
        {
            string Sql = "update tb_bookcase set name = '" + Bookcase.Name + "' where id = " + Bookcase.Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Delete(int Id)
        {
            string Sql = "delete from tb_bookcase where id = " + Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }
    }
}

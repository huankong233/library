using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class Library
    {
        public static List<HK.Model.Library> Get()
        {
            string sql = "select * from tb_library";
            DataTable dt = HK.Utils.MsSqlHelper.Query(sql);
            return DtToList(dt);
        }

        public static List<HK.Model.Library> DtToList(DataTable dt)
        {
            List<HK.Model.Library> list = new List<HK.Model.Library>();
            foreach (DataRow row in dt.Rows)
            {
                HK.Model.Library library = new HK.Model.Library();
                library.Libraryname = row["libraryname"].ToString();
                library.Curator = row["curator"].ToString();
                library.Tel = row["tel"].ToString();
                library.Address = row["address"].ToString();
                library.Email = row["email"].ToString();
                library.Url = row["url"].ToString();
                library.Createdate = Convert.ToDateTime(row["createdate"].ToString());
                library.Introduce = row["introduce"].ToString();
                list.Add(library);
            }
            return list;
        }

        public static bool Insert(HK.Model.Library library)
        {
            string sql;
            if (Get().Count == 0)
            {
                sql = "INSERT INTO tb_library (libraryname,curator,tel,address,email,url,createdate,introduce) VALUES ('" + library.Libraryname + "','" + library.Curator + "','" + library.Tel + "','" + library.Address + "','" + library.Email + "','" + library.Url + "','" + library.Createdate + "','" + library.Introduce + "');";
            }
            else
            {
                sql = "UPDATE tb_library SET libraryname = '" + library.Libraryname + "',curator = '" + library.Curator + "',tel = '" + library.Tel + "',address = '" + library.Address + "',email = '" + library.Email + "',url = '" + library.Url + "',createdate = '" + library.Createdate + "',introduce = '" + library.Introduce + "';";
            }
            return HK.Utils.MsSqlHelper.NoQuery(sql);
        }
    }
}

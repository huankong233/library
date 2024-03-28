using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class BookType
    {
        public static List<HK.Model.BookType> Get()
        {
            string Sql = "select * from tb_booktype";
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static HK.Model.BookType Get(int Id)
        {
            string Sql = "select * from tb_booktype where id = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt)[0];
        }

        public static List<HK.Model.BookType> DtToList(DataTable Dt)
        {
            List<HK.Model.BookType> List = new List<HK.Model.BookType>();
            foreach(DataRow Row in Dt.Rows)
            {
                HK.Model.BookType Type = new HK.Model.BookType();
                Type.Id = int.Parse(Row["id"].ToString());
                Type.Typename = Row["typename"].ToString();
                Type.Days = int.Parse(Row["days"].ToString());
                List.Add(Type);
            }
            return List;
        }
    }
}

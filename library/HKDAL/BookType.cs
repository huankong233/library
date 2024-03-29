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

        public static bool Insert(HK.Model.BookType BookType)
        {
            string Sql = "insert into tb_booktype (typename,days) values ('" + BookType.Typename + "'," + BookType.Days + ");";
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Update(HK.Model.BookType BookType)
        {
            string Sql = "update tb_booktype set typename = '" + BookType.Typename + "', days = " + BookType.Days + " where id = " + BookType.Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Delete(int Id)
        {
            string Sql = "delete from tb_booktype where id = " + Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }
    }
}

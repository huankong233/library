using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class BookInfo
    {
        public static List<HK.Model.BookInfo> Get()
        {
            string Sql = "select * from tb_bookinfo";
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static HK.Model.BookInfo Get(int Id)
        {
            string Sql = "select * from tb_bookinfo where id = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt)[0];
        }

        public static List<HK.Model.BookInfo> DtToList(DataTable Dt)
        {
            List<HK.Model.BookInfo> List = new List<HK.Model.BookInfo>();
            foreach(DataRow Row in Dt.Rows)
            {
                HK.Model.BookInfo Book = new HK.Model.BookInfo();
                Book.Bookcode = Row["bookcode"].ToString();
                Book.Bookname = Row["bookname"].ToString();
                Book.Type = HK.DAL.BookType.Get(int.Parse(Row["type"].ToString()));
                Book.Author = Row["Author"].ToString();
                Book.Translator = Row["translator"].ToString();
                Book.Pubname = Row["pubname"].ToString();
                Book.Price = int.Parse(Row["price"].ToString());
                Book.Page = int.Parse(Row["translator"].ToString());
                Book.Bcase = HK.DAL.Bookcase.Get(int.Parse(Row["bcase"].ToString()));
                Book.Storage = int.Parse(Row["storage"].ToString());
                Book.InTime = Convert.ToDateTime(Row["intime"].ToString());
                Book.Oper = HK.DAL.Admin.Get(int.Parse(Row["oper"].ToString()));
                Book.Borrownum = int.Parse(Row["borrownum"].ToString());
                List.Add(Book);
            }
            return List;
        }
    }
}

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

        public static HK.Model.BookInfo Get(string Bookcode)
        {
            string Sql = "select * from tb_bookinfo where bookcode = '" + Bookcode + "'";
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt)[0];
        }

        public static List<HK.Model.BookInfo> GetByBookcase(int Id)
        {
            string Sql = "select * from tb_bookinfo where bcase = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static List<HK.Model.BookInfo> GetByBookType(int Id)
        {
            string Sql = "select * from tb_bookinfo where type = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static List<HK.Model.BookInfo> DtToList(DataTable Dt)
        {
            List<HK.Model.BookInfo> List = new List<HK.Model.BookInfo>();
            foreach (DataRow Row in Dt.Rows)
            {
                HK.Model.BookInfo Book = new HK.Model.BookInfo();
                Book.Bookcode = Row["bookcode"].ToString();
                Book.Bookname = Row["bookname"].ToString();
                Book.Type = HK.DAL.BookType.Get(int.Parse(Row["type"].ToString()));
                Book.Author = Row["Author"].ToString();
                Book.Translator = Row["translator"].ToString();
                Book.Pubname = Row["pubname"].ToString();
                Book.Price = decimal.Parse(Row["price"].ToString());
                Book.Page = int.Parse(Row["page"].ToString());
                Book.Bcase = HK.DAL.Bookcase.Get(int.Parse(Row["bcase"].ToString()));
                Book.Storage = int.Parse(Row["storage"].ToString());
                Book.InTime = Convert.ToDateTime(Row["intime"].ToString());
                Book.Oper = HK.DAL.Admin.Get(int.Parse(Row["oper"].ToString()));
                Book.Borrownum = int.Parse(Row["borrownum"].ToString());
                List.Add(Book);
            }
            return List;
        }

        public static bool Insert(HK.Model.BookInfo BookInfo)
        {
            string Sql = "insert into tb_bookinfo (bookcode,bookname,type,author,translator,pubname,price,page,bcase,storage,inTime,oper,borrownum) values ('" + BookInfo.Bookcode + "','" + BookInfo.Bookname + "'," + BookInfo.Type.Id + ",'" + BookInfo.Author + "','" + BookInfo.Translator + "','" + BookInfo.Pubname + "'," + BookInfo.Price + "," + BookInfo.Page + "," + BookInfo.Bcase.Id + "," + BookInfo.Storage + ",'" + BookInfo.InTime + "'," + BookInfo.Oper.Id + "," + BookInfo.Borrownum + ");";
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Update(HK.Model.BookInfo BookInfo)
        {
            string Sql = "update tb_bookinfo set bookname = '" + BookInfo.Bookname + "',type = " + BookInfo.Type.Id + ",author = '" + BookInfo.Author + "',translator = '" + BookInfo.Translator + "',pubname = '" + BookInfo.Pubname + "',price = " + BookInfo.Price + ",page = " + BookInfo.Page + ",bcase = " + BookInfo.Bcase.Id + ",storage = " + BookInfo.Storage + ",inTime = '" + BookInfo.InTime + "',oper = " + BookInfo.Oper.Id + ",borrownum = " + BookInfo.Borrownum + " where bookcode = '" + BookInfo.Bookcode + "'";
            string a = Sql;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Delete(string Bookcode)
        {
            string Sql = "delete from tb_bookinfo where bookcode = '" + Bookcode + "'";
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }
    }
}

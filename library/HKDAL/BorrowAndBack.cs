using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class BorrowAndBack
    {
        public static List<HK.Model.BorrowAndBack> Get()
        {
            string Sql = "select * from tb_borrowandback";
            DataTable dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(dt);
        }

        public static List<HK.Model.BorrowAndBack> DtToList(DataTable Dt)
        {
            List<HK.Model.BorrowAndBack> List = new List<Model.BorrowAndBack>();
            foreach (DataRow Row in Dt.Rows)
            {
                HK.Model.BorrowAndBack Item = new HK.Model.BorrowAndBack();
                Item.Id = int.Parse(Row["id"].ToString());
                Item.Reader = HK.DAL.Reader.Get(int.Parse(Row["reader"].ToString()));
                Item.Bookcode = HK.DAL.BookInfo.Get(int.Parse(Row["bookcode"].ToString()));
                Item.Ygbacktime = Convert.ToDateTime(Row["ygbacktime"]);
                Item.Sjbacktime = Convert.ToDateTime(Row["sjbacktime"]);
                Item.Borrowoper = HK.DAL.Admin.Get(int.Parse(Row["borrowoper"].ToString()));
                Item.Backoper = HK.DAL.Admin.Get(int.Parse(Row["backoper"].ToString()));
                Item.Isback = Convert.ToBoolean(Row["isback"]);
                List.Add(Item);
            }
            return List;
        }
    }
}

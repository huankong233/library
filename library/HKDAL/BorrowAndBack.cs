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
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static HK.Model.BorrowAndBack Get(int Id)
        {
            string Sql = "select * from tb_borrowandback where id = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt)[0];
        }

        public static List<HK.Model.BorrowAndBack> GetByReaderAndHaveBookNotBack(int Id)
        {
            string Sql = "select * from tb_borrowandback where reader = " + Id + " AND isback = 0";
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static List<HK.Model.BorrowAndBack> DtToList(DataTable Dt)
        {
            List<HK.Model.BorrowAndBack> List = new List<Model.BorrowAndBack>();
            foreach (DataRow Row in Dt.Rows)
            {
                HK.Model.BorrowAndBack Item = new HK.Model.BorrowAndBack();
                Item.Id = int.Parse(Row["id"].ToString());
                Item.Reader = HK.DAL.Reader.Get(int.Parse(Row["reader"].ToString()));
                Item.Bookcode = HK.DAL.BookInfo.Get(Row["bookcode"].ToString());
                Item.Borrowtime = Convert.ToDateTime(Row["borrowtime"].ToString());
                Item.Ygbacktime = Convert.ToDateTime(Row["ygbacktime"].ToString());
                string Sjbacktime = Row["sjbacktime"].ToString();
                if (Sjbacktime != "")
                {
                    Item.Sjbacktime = Convert.ToDateTime(Sjbacktime);
                }

                string Backoper = Row["backoper"].ToString();
                if (Backoper != "")
                {
                    Item.Backoper = HK.DAL.Admin.Get(int.Parse(Backoper));
                }

                Item.Borrowoper = HK.DAL.Admin.Get(int.Parse(Row["borrowoper"].ToString()));
                Item.Isback = Convert.ToBoolean(Row["isback"].ToString());
                List.Add(Item);
            }
            return List;
        }

        public static bool Insert(HK.Model.BorrowAndBack BorrowAndBack)
        {
            // 检查是否还能再借
            if (BorrowAndBack.Reader.Borrownum >= BorrowAndBack.Reader.Type.Number)
            {
                // 已经到达借书上限
                return false;
            }

            // 检查图书库存是否充足
            if (BorrowAndBack.Bookcode.Storage - 1 < 0)
            {
                return false;
            }

            // 更新读者信息
            BorrowAndBack.Reader.Borrownum += 1;
            BorrowAndBack.Reader.Num += 1;
            bool ReaderResult = HK.DAL.Reader.Update(BorrowAndBack.Reader);

            // 更新书本信息
            BorrowAndBack.Bookcode.Storage -= 1;
            BorrowAndBack.Bookcode.Borrownum += 1;
            bool BookInfoResult = HK.DAL.BookInfo.Update(BorrowAndBack.Bookcode);

            // 插入借阅记录
            string BorrowAndBackSql = "insert into tb_borrowandback (id,reader,bookcode,borrowtime,ygbacktime,borrowoper,isback) values ('"+ (HK.Utils.MsSqlHelper.getNowIndex("tb_borrowandback") + 1) + "','" + BorrowAndBack.Reader.Id + "','" + BorrowAndBack.Bookcode.Bookcode + "','" + BorrowAndBack.Borrowtime + "','" + BorrowAndBack.Ygbacktime + "'," + BorrowAndBack.Borrowoper.Id + ",'" + BorrowAndBack.Isback + "');";
            bool BorrowAndBackResult = HK.Utils.MsSqlHelper.NoQuery(BorrowAndBackSql);

            return ReaderResult && BookInfoResult && BorrowAndBackResult;
        }

        public static bool Update(HK.Model.BorrowAndBack BorrowAndBack)
        {
            // 更新借阅信息
            string BorrowAndBackSql = "update tb_borrowandback set sjbacktime = '" + BorrowAndBack.Sjbacktime + "', backoper = " + BorrowAndBack.Backoper.Id + ", isback = '" + BorrowAndBack.Isback + "' where id = " + BorrowAndBack.Id;
            bool BorrowAndBackResult = HK.Utils.MsSqlHelper.NoQuery(BorrowAndBackSql);

            // 更新书本信息
            BorrowAndBack.Bookcode.Storage += 1;
            bool BookInfoResult = HK.DAL.BookInfo.Update(BorrowAndBack.Bookcode);

            // 更新读者信息
            BorrowAndBack.Reader.Borrownum -= 1;
            bool ReaderResult = HK.DAL.Reader.Update(BorrowAndBack.Reader);

            return ReaderResult && BookInfoResult && BorrowAndBackResult;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.BLL
{
    public class BookInfo
    {
        public static List<HK.Model.BookInfo> Get()
        {
            return HK.DAL.BookInfo.Get();
        }

        public static HK.Model.BookInfo Get(string Bookcode)
        {
            return HK.DAL.BookInfo.Get(Bookcode);
        }

        public static List<HK.Model.BookInfo> GetByBookcase(int Id)
        {
            return HK.DAL.BookInfo.GetByBookcase(Id);
        }

        public static List<HK.Model.BookInfo> GetByBookType(int Id)
        {
            return HK.DAL.BookInfo.GetByBookType(Id);
        }

        public static bool Insert(HK.Model.BookInfo BookInfo)
        {
            return HK.DAL.BookInfo.Insert(BookInfo);
        }

        public static bool Update(HK.Model.BookInfo BookInfo)
        {
            return HK.DAL.BookInfo.Update(BookInfo);
        }

        public static string Delete(string Bookcode)
        {
            if (HK.DAL.BookInfo.Delete(Bookcode))
            {
                return "删除成功";
            }
            else
            {
                return "执行出错";
            }
        }
    }
}

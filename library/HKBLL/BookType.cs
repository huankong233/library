using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.BLL
{
    public class BookType
    {
        public static List<HK.Model.BookType> Get()
        {
            return HK.DAL.BookType.Get();
        }

        public static HK.Model.BookType Get(string Name)
        {
            return HK.DAL.BookType.Get(Name);
        }

        public static HK.Model.BookType Get(int Id)
        {
            return HK.DAL.BookType.Get(Id);
        }

        public static bool Insert(HK.Model.BookType BookType)
        {
            return HK.DAL.BookType.Insert(BookType);
        }

        public static bool Update(HK.Model.BookType BookType)
        {
            return HK.DAL.BookType.Update(BookType);
        }

        public static string Delete(int Id)
        {
            // 检查是否存在关联的书本
            if (HK.DAL.BookInfo.GetByBookType(Id).Count > 0)
            {
                return "存在关联的书本";
            }

            if (HK.DAL.BookType.Delete(Id))
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.BLL
{
    public class Bookcase
    {
        public static List<HK.Model.Bookcase> Get()
        {
            return HK.DAL.Bookcase.Get();
        }

        public static HK.Model.Bookcase Get(int Id)
        {
            return HK.DAL.Bookcase.Get(Id);
        }

        public static bool Insert(HK.Model.Bookcase Bookcase)
        {
            return HK.DAL.Bookcase.Insert(Bookcase);
        }

        public static bool Update(HK.Model.Bookcase Bookcase)
        {
            return HK.DAL.Bookcase.Update(Bookcase);
        }

        public static string Delete(int Id)
        {
            // 检查是否存在关联的书本
            if (HK.DAL.BookInfo.GetByBookcase(Id).Count > 0)
            {
                return "存在关联的书本";
            }

            if (HK.DAL.Bookcase.Delete(Id))
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

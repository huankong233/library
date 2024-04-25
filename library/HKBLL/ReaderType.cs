using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.BLL
{
    public class ReaderType
    {
        public static List<HK.Model.ReaderType> Get()
        {
            return HK.DAL.ReaderType.Get();
        }

        public static HK.Model.ReaderType Get(int Id)
        {
            return HK.DAL.ReaderType.Get(Id);
        }

        public static HK.Model.ReaderType Get(string Name)
        {
            return HK.DAL.ReaderType.Get(Name);
        }

        public static bool Insert(HK.Model.ReaderType Readertype)
        {
            return HK.DAL.ReaderType.Insert(Readertype);
        }

        public static bool Update(HK.Model.ReaderType Readertype)
        {
            return HK.DAL.ReaderType.Update(Readertype);
        }

        public static string Delete(int Id)
        {
            // 检查是否存在关联的Reader
            if (HK.BLL.Reader.GetByType(Id).Count != 0)
            {
                return "本 readertype 包含关联的 reader";
            }

            if (HK.DAL.ReaderType.Delete(Id))
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

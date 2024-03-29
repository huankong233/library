using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.BLL
{
    public class BorrowAndBack
    {
        public static List<HK.Model.BorrowAndBack> Get()
        {
            return HK.DAL.BorrowAndBack.Get();
        }

        public static HK.Model.BorrowAndBack Get(int Id)
        {
            return HK.DAL.BorrowAndBack.Get(Id);
        }

        public static List<HK.Model.BorrowAndBack> GetByReaderAndHaveBookNotBack(int Id)
        {
            return HK.DAL.BorrowAndBack.GetByReaderAndHaveBookNotBack(Id);
        }

        public static bool Insert(HK.Model.BorrowAndBack BorrowAndBack)
        {
            return HK.DAL.BorrowAndBack.Insert(BorrowAndBack);
        }

        public static bool Update(HK.Model.BorrowAndBack BorrowAndBack)
        {
            return HK.DAL.BorrowAndBack.Update(BorrowAndBack);
        }
    }
}

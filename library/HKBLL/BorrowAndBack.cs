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
    }
}

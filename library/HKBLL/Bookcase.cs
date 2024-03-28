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
    }
}

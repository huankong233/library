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

        public static HK.Model.BookType Get(int Id)
        {
            return HK.DAL.BookType.Get(Id);
        }
    }
}

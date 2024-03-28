using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.BLL
{
    public class Library
    {
        public static List<HK.Model.Library> Get()
        {
            return HK.DAL.Library.Get();
        }

        public static bool Insert(HK.Model.Library library)
        {
            return HK.DAL.Library.Insert(library);
        }
    }
}

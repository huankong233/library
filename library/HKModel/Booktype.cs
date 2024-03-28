using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.Model
{
    public class BookType
    {
        private int id;
        private string typename;
        private int days;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Typename
        {
            get
            {
                return typename;
            }

            set
            {
                typename = value;
            }
        }

        public int Days
        {
            get
            {
                return days;
            }

            set
            {
                days = value;
            }
        }
    }
}

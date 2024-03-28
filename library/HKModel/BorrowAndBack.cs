using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.Model
{
    public class BorrowAndBack
    {
        private int id;
        private HK.Model.Reader reader;
        private HK.Model.BookInfo bookcode;
        private DateTime borrowtime;
        private DateTime ygbacktime;
        private DateTime sjbacktime;
        private HK.Model.Admin borrowoper;
        private HK.Model.Admin backoper;
        private bool isback;

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

        public HK.Model.Reader Reader
        {
            get
            {
                return reader;
            }

            set
            {
                reader = value;
            }
        }

        public HK.Model.BookInfo Bookcode
        {
            get
            {
                return bookcode;
            }

            set
            {
                bookcode = value;
            }
        }

        public DateTime Borrowtime
        {
            get
            {
                return borrowtime;
            }

            set
            {
                borrowtime = value;
            }
        }

        public DateTime Ygbacktime
        {
            get
            {
                return ygbacktime;
            }

            set
            {
                ygbacktime = value;
            }
        }

        public DateTime Sjbacktime
        {
            get
            {
                return sjbacktime;
            }

            set
            {
                sjbacktime = value;
            }
        }

        public HK.Model.Admin Borrowoper
        {
            get
            {
                return borrowoper;
            }

            set
            {
                borrowoper = value;
            }
        }

        public HK.Model.Admin Backoper
        {
            get
            {
                return backoper;
            }

            set
            {
                backoper = value;
            }
        }

        public bool Isback
        {
            get
            {
                return isback;
            }

            set
            {
                isback = value;
            }
        }
    }
}

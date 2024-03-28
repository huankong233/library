using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.Model
{
    public class BookInfo
    {
        private string bookcode;
        private string bookname;
        private HK.Model.BookType type;
        private string author;
        private string translator;
        private string pubname;
        private decimal price;
        private int page;
        private HK.Model.Bookcase bcase;
        private long storage;
        private DateTime inTime;
        private HK.Model.Admin oper;
        private int borrownum;

        public string Bookcode
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
        
        public string Bookname
        {
            get
            {
                return bookname;
            }

            set
            {
                bookname = value;
            }
        }
        
        public HK.Model.BookType Type
        {
            get
            {
                return type;
            }

            set
            {
                type = value;
            }
        }

        public string Author
        {
            get
            {
                return author;
            }

            set
            {
                author = value;
            }
        }

        public string Translator
        {
            get
            {
                return translator;
            }

            set
            {
                translator = value;
            }
        }

        public string Pubname
        {
            get
            {
                return pubname;
            }

            set
            {
                pubname = value;
            }
        }

        public decimal Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public int Page
        {
            get
            {
                return page;
            }

            set
            {
                page = value;
            }
        }

        public HK.Model.Bookcase Bcase
        {
            get
            {
                return bcase;
            }

            set
            {
                bcase = value;
            }
        }

        public long Storage
        {
            get
            {
                return storage;
            }

            set
            {
                storage = value;
            }
        }

        public DateTime InTime
        {
            get
            {
                return inTime;
            }

            set
            {
                inTime = value;
            }
        }

        public HK.Model.Admin Oper
        {
            get
            {
                return oper;
            }

            set
            {
                oper = value;
            }
        }

        public int Borrownum
        {
            get
            {
                return borrownum;
            }

            set
            {
                borrownum = value;
            }
        }
    }
}

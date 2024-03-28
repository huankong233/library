using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.Model
{
    public class Purview
    {
        private int id;
        private bool sysset;
        private bool readset;
        private bool bookset;
        private bool borrowback;
        private bool sysquery;

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

        public bool Sysset
        {
            get
            {
                return sysset;
            }

            set
            {
                sysset = value;
            }
        }

        public bool Readset
        {
            get
            {
                return readset;
            }

            set
            {
                readset = value;
            }
        }

        public bool Bookset
        {
            get
            {
                return bookset;
            }

            set
            {
                bookset = value;
            }
        }

        public bool Borrowback
        {
            get
            {
                return borrowback;
            }

            set
            {
                borrowback = value;
            }
        }

        public bool Sysquery
        {
            get
            {
                return sysquery;
            }

            set
            {
                sysquery = value;
            }
        }
    }
}

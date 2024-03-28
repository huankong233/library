using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.Model
{
    public class Library
    {
        private string libraryname;
        private string curator;
        private string tel;
        private string address;
        private string email;
        private string url;
        private DateTime createdate;
        private string introduce;

        public string Libraryname
        {
            get
            {
                return libraryname;
            }

            set
            {
                libraryname = value;
            }
        }

        public string Curator
        {
            get
            {
                return curator;
            }

            set
            {
                curator = value;
            }
        }

        public string Tel
        {
            get
            {
                return tel;
            }

            set
            {
                tel = value;
            }
        }

        public string Address
        {
            get
            {
                return address;
            }

            set
            {
                address = value;
            }
        }

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public string Url
        {
            get
            {
                return url;
            }

            set
            {
                url = value;
            }
        }

        public DateTime Createdate
        {
            get
            {
                return createdate;
            }

            set
            {
                createdate = value;
            }
        }

        public string Introduce
        {
            get
            {
                return introduce;
            }

            set
            {
                introduce = value;
            }
        }
    }
}

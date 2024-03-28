using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.Model
{
    public class Reader
    {
        private int id;
        private string name;
        private HK.Model.ReaderType type;
        private DateTime birthday;
        private string papertype;
        private string papernum;
        private string tel;
        private string email;
        private DateTime createdate;
        private HK.Model.Admin oper;
        private string remark;
        private int borrownum;
        private int num;
        private string password;

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

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public HK.Model.ReaderType Type
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

        public DateTime Birthday
        {
            get
            {
                return birthday;
            }

            set
            {
                birthday = value;
            }
        }

        public string Papertype
        {
            get
            {
                return papertype;
            }

            set
            {
                papertype = value;
            }
        }

        public string Papernum
        {
            get
            {
                return papernum;
            }

            set
            {
                papernum = value;
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

        public string Remark
        {
            get
            {
                return remark;
            }

            set
            {
                remark = value;
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

        public int Num
        {
            get
            {
                return num;
            }

            set
            {
                num = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.Model
{
    public class Admin
    {
        private int id;
        private string name;
        private string pwd;

        // ctrl + r + e
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
        
        public string Pwd
        {
            get
            {
                return pwd;
            }

            set
            {
                pwd = value;
            }
        }
    }
}

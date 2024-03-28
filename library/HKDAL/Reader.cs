using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class Reader
    {
        public static List<HK.Model.Reader> Get()
        {
            string Sql = "select * from tb_reader";
            DataTable dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(dt);
        }

        public static HK.Model.Reader Get(int Id)
        {
            string Sql = "select * from tb_reader where id = " + Id;
            DataTable dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(dt)[0];
        }

        public static List<HK.Model.Reader> GetByType(int Typeid)
        {
            string Sql = "select * from tb_reader where type = " + Typeid;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static List<HK.Model.Reader> DtToList(DataTable Dt)
        {
            List<HK.Model.Reader> List = new List<Model.Reader>();
            foreach (DataRow Row in Dt.Rows)
            {
                HK.Model.Reader Reader = new HK.Model.Reader();
                Reader.Id = int.Parse(Row["id"].ToString());
                Reader.Name = Row["name"].ToString();
                Reader.Type = HK.DAL.ReaderType.Get(int.Parse(Row["type"].ToString()));
                Reader.Birthday = Convert.ToDateTime(Row["birthday"].ToString());
                Reader.Papertype = Row["papertype"].ToString();
                Reader.Papernum = Row["papernum"].ToString();
                Reader.Tel = Row["tel"].ToString();
                Reader.Email = Row["email"].ToString();
                Reader.Createdate = Convert.ToDateTime(Row["createdate"].ToString());
                Reader.Oper = HK.DAL.Admin.Get(int.Parse(Row["oper"].ToString()));
                Reader.Remark = Row["remark"].ToString();
                Reader.Borrownum = int.Parse(Row["borrownum"].ToString());
                Reader.Num = int.Parse(Row["num"].ToString());
                List.Add(Reader);
            }
            return List;
        }

        public static bool Insert(HK.Model.Reader Reader)
        {
            string Sql = "insert into tb_reader (name,type,birthday,papertype,papernum,tel,email,createdate,oper,remark,borrownum,num) values ('" + Reader.Name + "','" + Reader.Type.Id + "','" + Reader.Birthday + "','" + Reader.Papertype + "','" + Reader.Papernum + "','" + Reader.Tel + "','" + Reader.Email + "','" + Reader.Createdate + "','" + Reader.Oper.Id + "','" + Reader.Remark + "','" + Reader.Borrownum + "','" + Reader.Num + "');";
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Update(HK.Model.Reader Reader)
        {
            string Sql = "update tb_reader set name = '" + Reader.Name + "', type = '" + Reader.Type.Id + "',birthday = '" + Reader.Birthday + "', papertype = '" + Reader.Papertype + "', papernum = '" + Reader.Papernum + "', tel = '" + Reader.Tel + "', email = '" + Reader.Email + "', oper = '" + Reader.Oper.Id + "', remark = '" + Reader.Remark + "', borrownum = '" + Reader.Borrownum + "', num = '" + Reader.Num + "' where id = " + Reader.Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Delete(int Id)
        {
            string Sql = "delete from tb_reader where id = " + Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }
    }
}

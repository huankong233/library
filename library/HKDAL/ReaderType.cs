using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HK.DAL
{
    public class ReaderType
    {
        public static List<HK.Model.ReaderType> Get()
        {
            string Sql = "select * from tb_readertype";
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt);
        }

        public static HK.Model.ReaderType Get(int Id)
        {
            string Sql = "select * from tb_readertype where id = " + Id;
            DataTable Dt = HK.Utils.MsSqlHelper.Query(Sql);
            return DtToList(Dt)[0];
        }

        public static List<HK.Model.ReaderType> DtToList(DataTable Dt)
        {
            List<HK.Model.ReaderType> List = new List<HK.Model.ReaderType>();
            foreach (DataRow Row in Dt.Rows)
            {
                HK.Model.ReaderType Type = new HK.Model.ReaderType();
                Type.Id = int.Parse(Row["id"].ToString());
                Type.Name = Row["name"].ToString();
                Type.Number = int.Parse(Row["number"].ToString());
                List.Add(Type);
            }
            return List;
        }

        public static bool Insert(HK.Model.ReaderType Readertype)
        {
            string Sql = "insert into tb_readertype (name,number) values ('" + Readertype.Name + "','" + Readertype.Number + "');";
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Update(HK.Model.ReaderType Readertype)
        {
            string Sql = "update tb_readertype set name = '" + Readertype.Name + "', number = " + Readertype.Number + " where id = " + Readertype.Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }

        public static bool Delete(int Id)
        {
            string Sql = "delete from tb_readertype where id = " + Id;
            return HK.Utils.MsSqlHelper.NoQuery(Sql);
        }
    }
}

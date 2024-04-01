using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace HK.Utils
{
    public class MsSqlHelper
    {
        public static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["library"].ConnectionString;

        public static DataTable Query(string Sql)
        {
            SqlConnection Conn = new SqlConnection(ConnectionString);
            Conn.Open();
            SqlDataAdapter Sdap = new SqlDataAdapter(Sql, Conn);
            DataSet Ds = new DataSet();
            Sdap.Fill(Ds);
            Conn.Close();
            return Ds.Tables[0];
        }

        public static bool NoQuery(string Sql)
        {
            SqlConnection Conn = new SqlConnection(ConnectionString);
            Conn.Open();
            SqlCommand Cmd = new SqlCommand(Sql, Conn);
            int Rows = Cmd.ExecuteNonQuery();
            Conn.Close();
            return Rows > 0;
        }

        public static int getNowIndex(string DBName, string IDCol = "id")
        {
            string Sql = "SELECT TOP 1 * FROM " + DBName + " order by " + IDCol + " desc";
            DataTable Dt = Query(Sql);
            if (Dt.Rows.Count == 0)
            {
                return 1;
            }
            return int.Parse(Dt.Rows[0][IDCol].ToString());
        }
    }
}

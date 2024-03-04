using System.Data;
using System.Data.SqlClient;

namespace App.DataAccessLayer
{
    public class DbConnection
    {
        private const string sqlConnectionString = @"Data Source=PRISM;
                                            Initial Catalog=AppWinform;
                                            User ID=sa;
                                            Password=1234;
                                            Encrypt=True;
                                            TrustServerCertificate=True";

        private SqlConnection con = new SqlConnection(sqlConnectionString);

        /// <summary>
        /// Tạo hàm để kiểm tra kết nối có mở không, nếu đang đóng thì mở ra?
        /// </summary>
        /// <returns></returns>
        public SqlConnection GetCon()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            return con;
        }

        /// <summary>
        /// Tạo hàm ExecuteNonQuery để thực hiện Insert, Update, Delete, Etc
        /// </summary>
        /// <returns></returns>
        public int ExeNonQuery(SqlCommand cmd)
        {
            cmd.Connection = GetCon();
            int rowsAffected = -1;
            rowsAffected = cmd.ExecuteNonQuery();
            con.Close();
            return rowsAffected;
        }

        public object ExeScalar(SqlCommand cmd)
        {
            cmd.Connection = GetCon();
            object obj = -1;
            obj = cmd.ExecuteScalar();
            con.Close();
            return obj;
        }

        public DataTable ExeReader(SqlCommand cmd)
        {
            cmd.Connection = GetCon();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            con.Close();
            return dt;
        }
    }
}
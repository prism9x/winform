using App.DataAccessLayer;
using App.DataTransferObject;
using System.Data;
using System.Data.SqlClient;

namespace App.BusinessLogicLayer
{
    public class UserBUS
    {
        public DbConnection db = new DbConnection();
        public User user = new User();

        public DataTable GetAll()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tb_users";

            return db.ExeReader(cmd);
        }
        public int Insert(User user)
        {
            // Tạo câu lệnh SQL
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandType = System.Data.CommandType.Text;
            //cmd.CommandText = "INSERT INTO tb_users VALUES ('" + user.Name + "','" + user.Password + "',1 )";

            // Thực thi Procedure
            //CREATE PROCEDURE InsertUser
            //    @Username NVARCHAR(50),
            //    @Password NVARCHAR(50),
            //    @Role INT = 1
            //AS
            //BEGIN
            //    INSERT INTO tb_users(name, password, role_id)
            //    VALUES(@Username, @Password, @Role);
            //END;

            SqlCommand cmd = new SqlCommand("InsertUser");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Username", user.Name);
            cmd.Parameters.AddWithValue("@Password", user.Password);


            // Thực thi câu lệnh SQL
            return db.ExeNonQuery(cmd);
        }

        /// <summary>
        /// Hàm update info truyền vào một đối tượng
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int Update(User user)
        {
            SqlCommand cmd = new SqlCommand("UpdateUserInfoById", db.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", user.Id);
            cmd.Parameters.AddWithValue("@NewUsername", user.Name);
            cmd.Parameters.AddWithValue("@NewPassword", user.Password);
            cmd.Parameters.AddWithValue("@NewRoleId", user.RoleId);


            // Thực thi câu lệnh SQL
            return db.ExeNonQuery(cmd);
        }


    }
}

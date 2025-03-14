using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebQLDaoTao.Models
{
    public class AccountDAO
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString;

        // Kết nối cơ sở dữ liệu
        public SqlConnection Connect()
        {
            return new SqlConnection(connectionString);
        }

        // Kiểm tra đăng nhập
        public Account CheckLogin(string username, string password)
        {
            Account account = null;

            try
            {
                using (var conn = Connect())
                {
                    conn.Open();
                    string sql = "SELECT * FROM Account WHERE username = @username AND password = @password";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                account = new Account
                                {
                                    Username = dr["username"].ToString(),
                                    Password = dr["password"].ToString(),
                                    Role = dr["role"].ToString()
                                };
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log lỗi
                Console.WriteLine("Error in CheckLogin: " + ex.Message);
            }

            return account;
        }

        // Đăng ký tài khoản
        public bool SignInAccount(Account tk)
        {
            try
            {
                using (var conn = Connect())
                {
                    string sql = "INSERT INTO Account (username, password, role) VALUES (@username, @password, @role)";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", tk.Username);
                        cmd.Parameters.AddWithValue("@password", tk.Password); // Cần băm mật khẩu trước khi lưu
                        cmd.Parameters.AddWithValue("@role", tk.Role);

                        conn.Open();
                        int result = cmd.ExecuteNonQuery();
                        return result > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log lỗi
                Console.WriteLine("Error in SignInAccount: " + ex.Message);
                return false;
            }
        }

        // Cập nhật mật khẩu
        public bool UpdatePassword(string username, string newPassword)
        {
            try
            {
                using (var conn = Connect())
                {
                    string sql = "UPDATE Account SET password = @newPassword WHERE username = @username";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@newPassword", newPassword); // Cần băm mật khẩu
                        cmd.Parameters.AddWithValue("@username", username);

                        conn.Open();
                        int result = cmd.ExecuteNonQuery();
                        return result > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log lỗi
                Console.WriteLine("Error in UpdatePassword: " + ex.Message);
                return false;
            }
        }

        // Kiểm tra tồn tại tài khoản
        public bool ExistenceCheck(string username)
        {
            try
            {
                using (var conn = Connect())
                {
                    string sql = "SELECT COUNT(*) FROM Account WHERE username = @username";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", username);

                        conn.Open();
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log lỗi
                Console.WriteLine("Error in ExistenceCheck: " + ex.Message);
                return false;
            }
        }
    }
}

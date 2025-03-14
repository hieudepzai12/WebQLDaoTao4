using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string vaitro = "Sinhvien"; // ✅ Gán vai trò mặc định là Khách

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Kiểm tra mật khẩu xác nhận
            if (password != confirmPassword)
            {
                lblMessage.Text = "Mật khẩu xác nhận không khớp.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            AccountDao dao = new AccountDao();

            // 🛑 Kiểm tra tài khoản đã tồn tại chưa
            if (dao.ExistenceCheck(username))
            {
                lblMessage.Text = "Tài khoản đã tồn tại. Vui lòng chọn tên khác!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Nếu chưa tồn tại, thực hiện đăng ký
            Account newUser = new Account(username, password, vaitro);

            if (dao.SignInAccount(newUser))
            {
                lblMessage.Text = "Đăng ký thành công!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                lblMessage.Text = "Có lỗi xảy ra. Vui lòng thử lại!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}

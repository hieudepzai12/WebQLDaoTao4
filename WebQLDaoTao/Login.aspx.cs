using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            AccountDao dao = new AccountDao();
            Account tk = dao.CheckLogin(username, password);

            if (tk != null)
            {
                // ✅ Lưu thông tin tài khoản vào Session
                Session["Username"] = tk.Username;
                Session["VaiTro"] = tk.Role;



                // ✅ Chuyển hướng không bị mất Session
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Tên đăng nhập hoặc mật khẩu không đúng.";
            }

        }
    }

}
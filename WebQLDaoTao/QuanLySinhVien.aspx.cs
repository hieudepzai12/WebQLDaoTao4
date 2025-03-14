using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QuanLySinhVien : System.Web.UI.Page
    {
        StudentDao svDAO = new StudentDao();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        private void LienKetDuLieu()
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string masv = txtMaSV.Text;
            string hosv = txtHoSV.Text;
            string tensv = txtTenSV.Text;
            Boolean gioitinh = rdNam.Checked ? true : false;
            DateTime ngaysinh = DateTime.Parse(txtNgaySinh.Text);
            string noisinh = txtNoiSinh.Text;
            string diachi = txtDiaChi.Text;

            string makh = ddlKhoa.SelectedValue;
            //thêm sinh vien vào csdl
            Student sv = new Student { MaSV = masv, HoSV = hosv, TenSV = tensv, GioiTinh = gioitinh, NgaySinh = ngaysinh, NoiSinh = noisinh, DiaChi = diachi, MaKH = makh };
            svDAO.Insert(sv);
            gvSinhVien.DataBind();
        }


    }
}
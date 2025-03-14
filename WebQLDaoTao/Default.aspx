<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebQLDaoTao.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <style>
        .container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
            max-width: 80%;
        }


        .card {
            text-align: center;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            margin: auto;
            max-width: 90%;
        }


        .feature-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px;
            margin-top: 40px;
        }

        .row.text-center .col-md-3 {
            display: flex;
            justify-content: center;
        }

        .row.text-center .card {
            width: 100%;
            max-width: 250px; /* Định kích thước cố định */
        }

        /* Chỉnh lại box chức năng */
        .feature-box {
            width: 200px; /* Định kích thước */
            padding: 20px;
            text-align: center;
            border-radius: 15px;
            background: #ffffff;
            transition: all 0.3s ease-in-out;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: none;
        }

        /* Tiêu đề trang chủ */
        h2.text-center {
            font-weight: bold;
            font-size: 28px;
            color: #01579b;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>


    <div class="container">
        <h2 class="text-center">NỘI DUNG TRANG CHỦ</h2>

        <!-- Giới thiệu hệ thống -->
        <div class="card p-4 mb-4">
            <h4>🎓 Giới thiệu hệ thống</h4>
            <p>
                Hệ thống Quản lý Đào tạo giúp cán bộ và sinh viên dễ dàng theo dõi thông tin học tập, 
                đăng ký môn học và quản lý điểm thi một cách hiệu quả.
           
           
            </p>
        </div>



        <!-- Chức năng chính -->
        <div class="feature-container">
            <a href="QuanLyMonHoc.aspx" class="feature-box">
                <i class="fas fa-book feature-icon"></i>
                <p>Quản lý môn học</p>
            </a>
            <a href="QuanLyKhoa.aspx" class="feature-box">
                <i class="fas fa-university feature-icon"></i>
                <p>Quản lý khoa</p>
            </a>
            <a href="QuanLySinhVien.aspx" class="feature-box">
                <i class="fas fa-users feature-icon"></i>
                <p>Quản lý sinh viên</p>
            </a>
            <a href="QuanLyDiemThi.aspx" class="feature-box">
                <i class="fas fa-edit feature-icon"></i>
                <p>Quản lý điểm</p>
            </a>
        </div>
    </div>

</asp:Content>

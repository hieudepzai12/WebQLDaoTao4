<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQLDaoTao.Login" %>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập tài khoản</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: white;
            overflow: hidden;
            position: relative;
        }

        .ripple-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://www.transparenttextures.com/patterns/asfalt-light.png') repeat;
        }

        .login-container {
            position: relative;
            width: 350px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
            border-radius: 15px;
            box-shadow: 0 0 15px cyan;
            text-align: center;
            z-index: 2;
        }

        .login-reflection {
            position: absolute;
            width: 350px;
            height: 100px;
            top: 100%;
            left: 50%;
            transform: translateX(-50%) scaleY(-1);
            opacity: 0.3;
            background: rgba(0, 255, 255, 0.5);
            filter: blur(10px);
        }

        h2 {
            color: cyan;
            margin-bottom: 20px;
            text-shadow: 0 0 10px cyan;
        }

        .input-box {
            position: relative;
            margin-bottom: 20px;
        }

            .input-box input, .aspNetTextBox {
                width: 100%;
                padding: 10px;
                border: none;
                outline: none;
                background: transparent;
                border-bottom: 2px solid cyan;
                color: cyan;
                font-size: 16px;
            }

        .btn, .aspNetButton {
            width: 100%;
            padding: 10px;
            border: none;
            background: cyan;
            color: black;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 0 15px cyan;
        }

            .btn:hover, .aspNetButton:hover {
                background: white;
                box-shadow: 0 0 25px white;
            }

        .links {
            margin-top: 15px;
            color: cyan;
        }

            .links a {
                color: cyan;
                text-decoration: none;
            }

                .links a:hover {
                    text-decoration: underline;
                }
    </style>
</head>
<body>
    <% if (Session["username"] == null)
        { %>
    <canvas id="rippleCanvas" class="ripple-container"></canvas>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Đăng Nhập</h2>
            <div class="input-box">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="aspNetTextBox" placeholder="Tên đăng nhập"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="aspNetTextBox" placeholder="Mật khẩu"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Đăng Nhập" CssClass="aspNetButton" OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
            <div class="links">
                <p><a href="ForgetPassword.aspx">Quên mật khẩu?</a></p>
                <p>Bạn chưa có tài khoản? <a href="Register.aspx">Đăng ký</a></p>
            </div>
        </div>
    </form>
    <div class="login-reflection"></div>
    <% }
        else
        {
            string username = Session["username"].ToString();
    %>
    <h1>Chào mừng <%= username %> đến với web Quản lý đào tạo</h1>
    <% } %>
</body>
</html>

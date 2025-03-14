<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="WebQLDaoTao.ForgetPassword" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu - Cosmic Ripple</title>
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
            background: black;
            overflow: hidden;
            position: relative;
        }

        .container {
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

        canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .music-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
            font-size: 20px;
            padding: 10px;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 0 10px cyan;
        }

            .music-button:hover {
                background: rgba(255, 255, 255, 0.5);
            }
    </style>
</head>
<body>
    <canvas id="cosmicCanvas"></canvas>
    <audio id="backgroundMusic" loop>
        <source src="https://www.bensound.com/bensound-music/bensound-slowmotion.mp3" type="audio/mpeg">
    </audio>
    <button id="musicToggle" class="music-button">
        <i class="fa fa-music"></i>
    </button>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Quên Mật Khẩu</h2>
            <div class="input-box">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="aspNetTextBox" placeholder="Tên đăng nhập"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="aspNetTextBox" placeholder="Mật khẩu mới"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="aspNetTextBox" placeholder="Xác nhận mật khẩu"></asp:TextBox>
            </div>
            <asp:Button ID="btnResetPassword" runat="server" Text="Đặt lại mật khẩu" CssClass="aspNetButton" OnClick="btnResetPassword_Click" />
            <div class="links">
                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
                <p><a href="Login.aspx">Quay lại đăng nhập</a></p>
            </div>
        </div>
    </form>

</body>
</html>

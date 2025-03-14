<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebQLDaoTao.Register" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fancy Register - Lava Ripple</title>
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

        .lava-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255, 69, 0, 0.5) 20%, black 80%);
        }

        .register-container {
            position: relative;
            width: 350px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
            border-radius: 15px;
            box-shadow: 0 0 15px orange;
            text-align: center;
            z-index: 2;
        }

        h2 {
            color: orange;
            margin-bottom: 20px;
            text-shadow: 0 0 10px orange;
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
                border-bottom: 2px solid orange;
                color: orange;
                font-size: 16px;
            }

        .btn, .aspNetButton {
            width: 100%;
            padding: 10px;
            border: none;
            background: orange;
            color: black;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 0 15px orange;
        }

            .btn:hover, .aspNetButton:hover {
                background: white;
                box-shadow: 0 0 25px white;
            }

        .links {
            margin-top: 15px;
            color: orange;
        }

            .links a {
                color: orange;
                text-decoration: none;
            }

                .links a:hover {
                    text-decoration: underline;
                }
    </style>
</head>
<body>
    <canvas id="lavaCanvas" class="lava-container"></canvas>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Đăng Ký</h2>
            <div class="input-box">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="aspNetTextBox" placeholder="Tên đăng nhập"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="aspNetTextBox" placeholder="Mật khẩu"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="aspNetTextBox" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                <asp:Button ID="btnRegister" runat="server" Text="Đăng Ký" CssClass="aspNetButton" OnClick="btnRegister_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
                <div class="links">
                    <p>Đã có tài khoản? <a href="Login.aspx">Đăng nhập</a></p>
                </div>
            </div>
        </div>
    </form>
    <script>
        const canvas = document.getElementById("lavaCanvas");
        const ctx = canvas.getContext("2d");
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        let particles = [];
        class Particle {
            constructor(x, y) {
                this.x = x;
                this.y = y;
                this.size = Math.random() * 5 + 2;
                this.speedY = Math.random() * 3 - 1.5;
                this.speedX = Math.random() * 3 - 1.5;
                this.color = `rgba(255, ${Math.random() * 150}, 0, 0.7)`;
            }
            update() {
                this.x += this.speedX;
                this.y += this.speedY;
                if (this.size > 0.2) this.size -= 0.05;
            }
            draw() {
                ctx.fillStyle = this.color;
                ctx.beginPath();
                ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                ctx.fill();
            }
        }

        function animate() {
            ctx.fillStyle = "rgba(0, 0, 0, 0.1)";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            particles.forEach((p, index) => {
                p.update();
                p.draw();
                if (p.size <= 0.2) particles.splice(index, 1);
            });
            requestAnimationFrame(animate);
        }

        canvas.addEventListener("mousemove", (event) => {
            for (let i = 0; i < 5; i++) {
                particles.push(new Particle(event.clientX, event.clientY));
            }
        });
        animate();
    </script>
</body>
</html>


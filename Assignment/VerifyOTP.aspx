<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyOTP.aspx.cs" Inherits="Assignment.VerifyOTP" %>

<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP - SkillForge</title>
    <style>
        body {
            font-family: 'Source Sans Pro', Arial, sans-serif;
            background: linear-gradient(135deg, #1a1a1a 0%, #000000 100%);
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
        }
        .otp-container {
            background: linear-gradient(145deg, #252525, #1e1e1e);
            border: 1px solid #333;
            border-radius: 20px;
            padding: 60px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            text-align: center;
        }
        .otp-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #a51c30, #7a1524);
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
        }
        h2 {
            font-family: Georgia, serif;
            font-size: 2rem;
            color: #ffffff;
            margin-bottom: 10px;
        }
        .subtitle {
            color: #888;
            margin-bottom: 30px;
            font-size: 0.95rem;
        }
        .timer-box {
            background: #1a1a1a;
            border: 1px solid #333;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        .timer-label {
            color: #888;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .timer-value {
            font-size: 2rem;
            color: #a51c30;
            font-weight: 700;
            font-family: monospace;
        }
        .otp-input {
            width: 100%;
            padding: 16px;
            background: #1a1a1a;
            border: 2px solid #444;
            border-radius: 10px;
            color: #fff;
            font-size: 1.5rem;
            text-align: center;
            letter-spacing: 8px;
            font-weight: 600;
            margin-bottom: 20px;
            transition: all 0.3s;
        }
        .otp-input:focus {
            border-color: #a51c30;
            outline: none;
        }
        .btn-verify {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #a51c30, #7a1524);
            color: #fff;
            border: none;
            border-radius: 10px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 15px;
            transition: all 0.3s;
        }
        .btn-verify:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(165,28,48,0.3);
        }
        .btn-resend {
            background: transparent;
            color: #888;
            border: 2px solid #333;
            padding: 12px 30px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-resend:hover {
            border-color: #a51c30;
            color: #a51c30;
        }
        .message {
            margin-top: 20px;
            padding: 12px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="otp-container">
            <div class="otp-icon">🔐</div>
            
            <h2>Verify Your Email</h2>
            <p class="subtitle">We've sent a 6-digit code to your email</p>
            
            <div class="timer-box">
                <div class="timer-label">Code expires in</div>
                <div class="timer-value" id="timer">05:00</div>
            </div>
            
            <asp:TextBox ID="txtOTP" runat="server" CssClass="otp-input" 
                placeholder="000000" MaxLength="6"></asp:TextBox>
            
            <asp:Button ID="btnVerify" runat="server" Text="Verify Code" 
                OnClick="BtnVerify_Click" CssClass="Btn-verify" />
            
            <asp:Button ID="btnResend" runat="server" Text="Resend New Code" 
                OnClick="BtnResend_Click" CssClass="Btn-resend" />
            
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
    
    <script>
        // Simple countdown timer (5 minutes = 300 seconds)
        let timeLeft = 300;
        
        function updateTimer() {
            let minutes = Math.floor(timeLeft / 60);
            let seconds = timeLeft % 60;
            document.getElementById('timer').textContent = 
                `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            
            if (timeLeft > 0) {
                timeLeft--;
                setTimeout(updateTimer, 1000);
            } else {
                document.getElementById('timer').style.color = '#dc3545';
            }
        }
        
        updateTimer();
    </script>
</body>
</html>
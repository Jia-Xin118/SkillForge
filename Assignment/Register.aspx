<%@ Page Title="Create Account - SkillForge" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="min-height: 100vh; display: flex; align-items: center; justify-content: center; background: linear-gradient(135deg, #1a1a1a 0%, #000000 100%); padding: 40px 20px;">
        <div style="background: linear-gradient(145deg, #252525, #1e1e1e); border: 1px solid #333; border-radius: 20px; padding: 60px; width: 100%; max-width: 500px; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);">
            
            <div style="text-align: center; margin-bottom: 40px;">
                <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #a51c30, #7a1524); border-radius: 50%; margin: 0 auto 20px; display: flex; align-items: center; justify-content: center; font-size: 2.5rem;">
                    🎓
                </div>
                <h1 style="font-family: Georgia, serif; font-size: 2.5rem; color: #ffffff; margin-bottom: 10px;">Create Your Account</h1>
                <p style="color: #888; font-size: 1rem;">Join 50,000+ professionals advancing their careers</p>
            </div>

            <asp:Label ID="lblMessage" runat="server" style="display: block; margin-bottom: 20px; padding: 12px; border-radius: 8px; text-align: center;"></asp:Label>

            <div style="margin-bottom: 25px;">
                <label style="display: block; color: #fff; margin-bottom: 8px; font-weight: 600; font-size: 0.9rem;">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" style="width: 100%; padding: 14px; background: #1a1a1a; border: 1px solid #444; border-radius: 8px; color: #fff; font-size: 1rem; transition: all 0.3s;" onfocus="this.style.borderColor='#a51c30'" onblur="this.style.borderColor='#444'"></asp:TextBox>
            </div>

            <div style="margin-bottom: 25px;">
                <label style="display: block; color: #fff; margin-bottom: 8px; font-weight: 600; font-size: 0.9rem;">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" style="width: 100%; padding: 14px; background: #1a1a1a; border: 1px solid #444; border-radius: 8px; color: #fff; font-size: 1rem; transition: all 0.3s;" onfocus="this.style.borderColor='#a51c30'" onblur="this.style.borderColor='#444'"></asp:TextBox>
            </div>

            <div style="margin-bottom: 10px;">
                <label style="display: block; color: #fff; margin-bottom: 8px; font-weight: 600; font-size: 0.9rem;">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" style="width: 100%; padding: 14px; background: #1a1a1a; border: 1px solid #444; border-radius: 8px; color: #fff; font-size: 1rem; transition: all 0.3s;" onfocus="this.style.borderColor='#a51c30'" onblur="this.style.borderColor='#444'"></asp:TextBox>
            </div>
            <p style="color: #666; font-size: 0.85rem; margin-bottom: 30px;">Must be at least 8 characters with letters and numbers</p>

            <asp:Button ID="BtnRegister" runat="server" Text="Create Account" OnClick="BtnRegister_Click" 
                style="width: 100%; padding: 16px; background: linear-gradient(135deg, #a51c30, #7a1524); color: #fff; border: none; border-radius: 8px; font-weight: 700; font-size: 1rem; cursor: pointer; text-transform: uppercase; letter-spacing: 1px; transition: all 0.3s; margin-bottom: 25px;"
                onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 10px 20px rgba(165,28,48,0.3)'" 
                onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='none'" />

            <div style="text-align: center; padding-top: 20px; border-top: 1px solid #333;">
                <p style="color: #888; margin: 0;">
                    Already have an account? 
                    <a href="Default.aspx" style="color: #a51c30; text-decoration: none; font-weight: 600;">Sign in</a>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
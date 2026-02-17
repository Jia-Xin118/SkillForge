<%@ Page Title="Your Certificate - SkillForge" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="Assignment.Certificate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- Success Message --%>
    <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
        <div style="max-width: 800px; margin: 60px auto; padding: 0 20px; text-align: center;">
            
            <%-- Certificate Preview Card --%>
            <div style="background: white; border: 3px solid #c9a227; border-radius: 12px; padding: 50px; margin-bottom: 30px; box-shadow: 0 10px 40px rgba(0,0,0,0.1);">
                <div style="font-size: 80px; margin-bottom: 20px;">🏆</div>
                <h1 style="color: #1e3a5f; margin-bottom: 10px; font-size: 36px;">Certificate of Completion</h1>
                <p style="color: #666; font-size: 18px; margin-bottom: 30px;">This certifies that</p>
                
                <h2 style="color: #1e3a5f; font-size: 32px; margin-bottom: 10px; border-bottom: 2px solid #c9a227; display: inline-block; padding-bottom: 10px;">
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                </h2>
                
                <p style="color: #666; font-size: 18px; margin: 30px 0 10px 0;">has successfully completed</p>
                
                <h3 style="color: #1e3a5f; font-size: 28px; margin-bottom: 20px;">
                    <asp:Label ID="lblCertificateName" runat="server"></asp:Label>
                </h3>
                
                <p style="color: #666; font-size: 16px; margin-bottom: 10px;">
                    Grade: <span style="color: #c9a227; font-weight: bold; font-size: 20px;"><asp:Label ID="lblGrade" runat="server"></asp:Label></span>
                </p>
                
                <p style="color: #999; font-size: 14px; margin-top: 30px;">
                    Certificate ID: <asp:Label ID="lblCertNumber" runat="server"></asp:Label><br/>
                    Issued: <asp:Label ID="lblDate" runat="server"></asp:Label>
                </p>
            </div>
            
            <%-- Download Button --%>
            <asp:Button ID="btnDownload" runat="server" Text="📄 Download PDF Certificate" OnClick="BtnDownload_Click"
                style="background: linear-gradient(135deg, #c9a227 0%, #d4af37 100%); color: #1e3a5f; 
                       padding: 18px 40px; font-size: 18px; font-weight: bold; border: none; " />
            
            <%-- Share Button (optional) --%>
            <asp:Button ID="btnLinkedIn" runat="server" Text="💼 Add to LinkedIn" OnClick="BtnLinkedIn_Click"
                style="background: #0077b5; color: white; padding: 18px 40px; font-size: 18px; 
                       font-weight: bold; border: none; border-radius: 8px; cursor: pointer;" />
        </div>
    </asp:Panel>
    
    <%-- Error Message --%>
    <asp:Panel ID="pnlError" runat="server" Visible="false">
        <div style="max-width: 600px; margin: 100px auto; text-align: center;">
            <div style="font-size: 64px; margin-bottom: 20px;">⚠️</div>
            <h2 style="color: #1e3a5f; margin-bottom: 15px;">Certificate Not Available</h2>
            <p style="color: #666; margin-bottom: 30px;">
                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
            </p>
            <a href="Modules.aspx" style="background: #2d5a87; color: white; padding: 15px 30px; 
                text-decoration: none; border-radius: 6px; display: inline-block;">Browse Modules</a>
        </div>
    </asp:Panel>
    
</asp:Content>
<%@ Page Title="Business Insight" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="Assignment.Article" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- Back to Home --%>
    <a href="Default.aspx" style="color: #2d5a87; text-decoration: none; font-size: 14px;">
        ← Back to Insights
    </a>
    
    <%-- Article Header --%>
    <div style="margin: 30px 0; padding-bottom: 20px; border-bottom: 2px solid #c9a227;">
        <span style="background-color: #c9a227; color: #1e3a5f; padding: 5px 15px; 
                     font-size: 12px; font-weight: bold; text-transform: uppercase;">
            <asp:Label ID="lblCategory" runat="server"></asp:Label>
        </span>
        
        <h1 style="color: #1e3a5f; font-size: 36px; margin: 20px 0; line-height: 1.3;">
            <asp:Label ID="lblTitle" runat="server"></asp:Label>
        </h1>
        
        <p style="color: #666; font-size: 14px;">
            By <asp:Label ID="lblAuthor" runat="server" Font-Bold="true"></asp:Label> | 
            <asp:Label ID="lblDate" runat="server"></asp:Label> | 
            <asp:Label ID="lblReadTime" runat="server"></asp:Label> min read
        </p>
    </div>
    
    <%-- Article Summary Box --%>
    <div style="background-color: #f5f5f5; padding: 20px; border-left: 4px solid #2d5a87; 
                margin-bottom: 30px; font-style: italic; color: #555;">
        <asp:Label ID="lblSummary" runat="server"></asp:Label>
    </div>
    
    <%-- Article Content --%>
    <div style="max-width: 800px; line-height: 1.8; color: #333; font-size: 16px;">
        <asp:Label ID="lblContent" runat="server"></asp:Label>
    </div>
    
    <%-- CTA to Certification --%>
    <div style="background: linear-gradient(135deg, #1e3a5f 0%, #2d5a87 100%); 
                color: white; padding: 40px; margin-top: 50px; border-radius: 8px; text-align: center;">
        <h2 style="margin-bottom: 15px;">Ready to Test Your Knowledge?</h2>
        <p style="margin-bottom: 25px; opacity: 0.9;">
            Take the certification exam to earn your credential in 
            <asp:Label ID="lblCertCategory" runat="server"></asp:Label>.
        </p>
        
        <% if (Session["UserID"] != null) { %>
            <a href="Modules.aspx?cat=Leadership" style="background-color: #c9a227; color: #1e3a5f; 
                padding: 15px 30px; text-decoration: none; font-weight: bold; 
                border-radius: 4px; display: inline-block;">Start Certification</a>
        <% } else { %>
            <p style="margin-bottom: 15px;">Login to track your progress and earn certificates.</p>
            <span style="color: #c9a227;">Use the login form above ↑</span>
        <% } %>
    </div>
    
</asp:Content>
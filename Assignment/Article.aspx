<%@ Page Title="Business Insight" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="Assignment.Article" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <a href="Default.aspx" class="back-link">← Back to Insights</a>
        
        <div class="article-header">
            <span class="article-category">
                <asp:Label ID="lblCategory" runat="server"></asp:Label>
            </span>
            
            <h1 class="article-title">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </h1>
            
            <p class="article-meta">
                By <asp:Label ID="lblAuthor" runat="server" Font-Bold="true"></asp:Label> | 
                <asp:Label ID="lblDate" runat="server"></asp:Label> | 
                <asp:Label ID="lblReadTime" runat="server"></asp:Label> min read
            </p>
        </div>
        
        <div class="article-summary">
            <asp:Label ID="lblSummary" runat="server"></asp:Label>
        </div>
        
        <div class="article-content">
            <asp:Label ID="lblContent" runat="server"></asp:Label>
        </div>
        
        <div class="article-cta">
            <h2>Ready to Test Your Knowledge?</h2>
            <p>
                Take the certification exam to earn your credential in 
                <asp:Label ID="lblCertCategory" runat="server"></asp:Label>.
            </p>
            
            <% if (Session["UserID"] != null) { %>
                <a href="Modules.aspx?cat=Leadership" class="btn btn-gold">Start Certification</a>
            <% } else { %>
                 <p style="margin-bottom: 15px;">Login to track your progress and earn certificates.</p>
                 <span style="color: #c9a227;">Use the login form above ↑</span>
            <% } %>
        </div>
    </div>
    
</asp:Content>
<%@ Page Title="Module Detail" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="ModuleDetail.aspx.cs" Inherits="Assignment.ModuleDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="module-detail-container">
        
        <!-- Back Link -->
        <a href="Modules.aspx" style="color: var(--text-secondary); text-decoration: none; 
                                      display: inline-flex; align-items: center; gap: 0.5rem; margin-bottom: 1.5rem;">
            ← Back to Modules
        </a>

        <!-- Header -->
        <div class="module-header">
            <span class="category">
                <asp:Label ID="lblCategory" runat="server"></asp:Label>
            </span>
            <h1><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
        </div>

        <!-- What You'll Learn -->
        <div class="module-content-box">
            <h3>📚 What You'll Learn</h3>
            <div class="module-content-text">
                <asp:Label ID="lblDescription" runat="server"></asp:Label>
            </div>
        </div>

        <!-- Lesson Content -->
        <div class="module-content-box">
            <h3>📝 Lesson Content</h3>
            <div class="module-content-text">
                <asp:Label ID="lblContent" runat="server"></asp:Label>
            </div>
        </div>

        <!-- Actions -->
        <div class="module-actions">
            <asp:Button ID="btnComplete" runat="server" Text="✓ Mark as Complete" 
                OnClick="BtnComplete_Click" CssClass="btn-complete" />
            
            <% if (Session["UserID"] != null) { %>
                <a href="Quiz.aspx?moduleId=<%= Request.QueryString["id"] %>" class="btn-quiz">
                    📝 Take Quiz
                </a>
            <% } %>
            
            <asp:Label ID="lblCompleted" runat="server" 
                Text="✓ You have completed this module!" CssClass="completed-badge" Visible="false">
            </asp:Label>
        </div>

    </div>
    
</asp:Content>
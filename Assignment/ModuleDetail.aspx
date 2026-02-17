<%@ Page Title="Module Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleDetail.aspx.cs" Inherits="Assignment.ModuleDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- Back button --%>
    <a href="Modules.aspx" style="color:#666; text-decoration:none;">← Back to Modules</a>
    
    <br /><br />
    
    <%-- Module Header --%>
    <div style="background-color:#1976d2; color:white; padding:30px; border-radius:8px; margin-bottom:20px;">
        <h1 style="margin:0;"><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
        <p style="margin:10px 0 0 0; font-size:18px;">
            Category: <asp:Label ID="lblCategory" runat="server"></asp:Label>
        </p>
    </div>
    
    <%-- Module Content --%>
    <div style="background-color:#fff; border:1px solid #ddd; padding:30px; border-radius:8px; min-height:300px;">
        <h3>What You'll Learn</h3>
        <p style="font-size:16px; line-height:1.6; color:#333;">
            <asp:Label ID="lblDescription" runat="server"></asp:Label>
        </p>
        
        <hr style="margin:30px 0;" />
        
        <h3>Lesson Content</h3>
        <div style="font-size:16px; line-height:1.8; color:#333;">
            <asp:Label ID="lblContent" runat="server"></asp:Label>
        </div>
    </div>
    
    <%-- Action Buttons --%>
    <div style="margin-top:30px; text-align:center;">
        
        <%-- Mark Complete Button --%>
        <asp:Button ID="btnComplete" runat="server" Text="✓ Mark as Complete" 
            OnClick="BtnComplete_Click" 
            style="background-color:#4CAF50; color:white; padding:15px 40px; 
                   font-size:18px; border:none; border-radius:8px; cursor:pointer; margin-right:10px;" />
        
        <%-- Take Quiz Button (only shows if logged in) --%>
        <% if (Session["UserID"] != null) { %>
    <a href="Quiz.aspx?moduleId=<%= Request.QueryString["id"] %>" 
       style="background-color:#c9a227; color:#1e3a5f; padding:15px 40px; 
              font-size:18px; text-decoration:none; border-radius:8px; 
              display:inline-block; font-weight:bold;">
        📝 Take Quiz
    </a>
<% } %>
        
        
        <asp:Label ID="lblCompleted" runat="server" 
            Text="✓ You have completed this module!" 
            style="color:#4CAF50; font-size:18px; font-weight:bold; display:none;"></asp:Label>
    </div>
    
</asp:Content>
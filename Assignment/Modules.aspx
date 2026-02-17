<%@ Page Title="Learning Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="Assignment.Modules" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Business Micro-Skills Modules</h2>
    
    <%-- Show which category is selected --%>
    <asp:Label ID="lblCategory" runat="server" Font-Size="Large" ForeColor="#666"></asp:Label>
    
    <br /><br />
    
    <%-- List of modules as clickable cards --%>
    <asp:Repeater ID="RepeaterModules" runat="server">
        <ItemTemplate>
            <div style="border:1px solid #ddd; padding:20px; margin-bottom:15px; 
                        border-radius:8px; background-color:#f9f9f9; cursor:pointer;"
                 onclick="location.href='ModuleDetail.aspx?id=<%# Eval("ModuleID") %>'"
                 onmouseover="this.style.backgroundColor='#e3f2fd'"
                 onmouseout="this.style.backgroundColor='#f9f9f9'">
                
                <h3 style="color:#1976d2; margin-top:0;">
                    <%# Eval("Title") %>
                </h3>
                <p style="color:#666; margin:5px 0;">
                    <strong>Category:</strong> <%# Eval("Category") %>
                </p>
                <p style="color:#333;">
                    <%# Eval("Description") %>
                </p>
                <p style="color:#4CAF50; font-size:12px;">
                    Click to learn more →
                </p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    
</asp:Content>
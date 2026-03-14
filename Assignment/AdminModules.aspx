<%@ Page Title="Admin - Manage Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminModules.aspx.cs" Inherits="Assignment.AdminModules" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Add CSS for uppercase headers -->
    <style>
        .gridview-header th {
            text-transform: uppercase !important;
            color: #fff !important;
            font-size: 14px !important;
        }
    </style>

    <div style="padding: 60px 0; min-height: 100vh;">
        <div class="container">
            
            <%-- Header --%>
            <div style="text-align: center; margin-bottom: 50px;">
                <h2 style="font-family: Georgia, serif; font-size: 2.5rem; color: #ffffff; margin-bottom: 10px;">Admin Dashboard</h2>
                <p style="color: #888;">Manage Learning Modules</p>
            </div>

            <%-- Add New Module Form --%>
            <div style="background: linear-gradient(145deg, #252525, #1e1e1e); border: 1px solid #333; border-radius: 20px; padding: 40px; margin-bottom: 50px;">
                <h3 style="color: #a51c30; margin-bottom: 30px; font-family: Georgia, serif; display: flex; align-items: center; gap: 10px;">
                    <span style="font-size: 1.5rem;">➕</span> Add New Module
                </h3>
                
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px; margin-bottom: 25px;">
                    <div>
                        <label style="display: block; color: #fff; margin-bottom: 10px; font-weight: 600;">Module Title</label>
                        <asp:TextBox ID="txtTitle" runat="server" style="width: 100%; padding: 14px; background: #1a1a1a; border: 1px solid #444; border-radius: 10px; color: #fff; font-size: 1rem;"></asp:TextBox>
                    </div>
                    <div>
                        <label style="display: block; color: #fff; margin-bottom: 10px; font-weight: 600;">Category</label>
                        <asp:TextBox ID="txtCategory" runat="server" style="width: 100%; padding: 14px; background: #1a1a1a; border: 1px solid #444; border-radius: 10px; color: #fff; font-size: 1rem;"></asp:TextBox>
                    </div>
                </div>

                <div style="margin-bottom: 25px;">
                    <label style="display: block; color: #fff; margin-bottom: 10px; font-weight: 600;">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" style="width: 100%; padding: 14px; background: #1a1a1a; border: 1px solid #444; border-radius: 10px; color: #fff; font-size: 1rem; resize: vertical;"></asp:TextBox>
                </div>

                <div style="margin-bottom: 30px;">
                    <label style="display: block; color: #fff; margin-bottom: 10px; font-weight: 600;">Content</label>
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" style="width: 100%; padding: 14px; background: #1a1a1a; border: 1px solid #444; border-radius: 10px; color: #fff; font-size: 1rem; resize: vertical;"></asp:TextBox>
                </div>

                <div style="display: flex; gap: 15px;">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Module" OnClick="btnAdd_Click" 
                        style="padding: 14px 35px; background: linear-gradient(135deg, #a51c30, #7a1524); color: #fff; border: none; border-radius: 10px; font-weight: 600; cursor: pointer; text-transform: uppercase; letter-spacing: 1px;" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Module" OnClick="btnUpdate_Click" Visible="false"
                        style="padding: 14px 35px; background: linear-gradient(135deg, #d4af37, #b8941f); color: #000; border: none; border-radius: 10px; font-weight: 600; cursor: pointer; text-transform: uppercase; letter-spacing: 1px;" />
                    <asp:HiddenField ID="hdnModuleID" runat="server" />
                </div>

                <asp:Label ID="lblMessage" runat="server" style="display: block; margin-top: 20px; padding: 15px; border-radius: 10px; text-align: center;"></asp:Label>
            </div>

            <%-- Existing Modules --%>
            <div style="background: linear-gradient(145deg, #252525, #1e1e1e); border: 1px solid #333; border-radius: 20px; padding: 40px;">
                <h3 style="color: #fff; margin-bottom: 30px; font-family: Georgia, serif; display: flex; align-items: center; gap: 10px;">
                    <span style="font-size: 1.5rem;">📚</span> Existing Modules
                </h3>

                <asp:GridView ID="GridViewModules" runat="server" AutoGenerateColumns="False"
    DataKeyNames="ModuleID" OnRowEditing="GridViewModules_RowEditing"
    OnRowDeleting="GridViewModules_RowDeleting" CssClass="gridview-header"
    style="width: 100%; border: none;" CellPadding="15" GridLines="None">
    <Columns>
        <asp:BoundField DataField="ModuleID" HeaderText="ID" ReadOnly="True" 
            HeaderStyle-ForeColor="#a51c30" ItemStyle-ForeColor="#a51c30" ItemStyle-Width="80px" />
        <asp:BoundField DataField="Title" HeaderText="Module Title" 
            HeaderStyle-ForeColor="#fff" ItemStyle-ForeColor="#a51c30" ItemStyle-Font-Bold="true" />
        <asp:BoundField DataField="Category" HeaderText="Category" 
            HeaderStyle-ForeColor="#fff" ItemStyle-ForeColor="#a51c30" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" 
            EditText="✏️ Edit" DeleteText="🗑️ Delete"
            ControlStyle-ForeColor="#a51c30" ControlStyle-Font-Bold="true" />
    </Columns>
    <HeaderStyle BackColor="#1a1a1a" Height="60px" Font-Size="14px" />
    <RowStyle BackColor="transparent" Height="70px" />
    <AlternatingRowStyle BackColor="#2a2a2a" />
</asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
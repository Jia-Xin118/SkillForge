<%@ Page Title="Admin - Manage Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminModules.aspx.cs" Inherits="Assignment.AdminModules" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Admin - Manage Learning Modules</h2>
    
    <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
    
    <h3>Add New Module</h3>
    <div>Title: <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox></div><br />
    <div>Category: <asp:TextBox ID="txtCategory" runat="server" Width="200px"></asp:TextBox></div><br />
    <div>Description: <asp:TextBox ID="txtDescription" runat="server" Width="400px" TextMode="MultiLine" Rows="3"></asp:TextBox></div><br />
    <div>Content: <asp:TextBox ID="txtContent" runat="server" Width="400px" TextMode="MultiLine" Rows="5"></asp:TextBox></div><br />
    
    <asp:Button ID="btnAdd" runat="server" Text="Add Module" OnClick="btnAdd_Click" />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
    <asp:HiddenField ID="hdnModuleID" runat="server" />
    
    <hr />
    
    <h3>Existing Modules</h3>
    <asp:GridView ID="GridViewModules" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ModuleID" OnRowEditing="GridViewModules_RowEditing"
        OnRowDeleting="GridViewModules_RowDeleting" CellPadding="10">
        <Columns>
            <asp:BoundField DataField="ModuleID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    
</asp:Content>
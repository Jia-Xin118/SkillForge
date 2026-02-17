<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assignment.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>My Learning Profile</h2>
    
    <%-- User Info --%>
    <div style="background-color:#f0f0f0; padding:20px; border-radius:8px; margin-bottom:20px;">
        <h3>Welcome, <asp:Label ID="lblName" runat="server"></asp:Label>!</h3>
        <p>Email: <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
        <p>Role: <asp:Label ID="lblRole" runat="server"></asp:Label></p>
    </div>
    
    <%-- Progress Overview --%>
    <div style="background-color:#e3f2fd; padding:20px; border-radius:8px; margin-bottom:20px;">
        <h3>Progress Overview</h3>
        <p>Completed: <asp:Label ID="lblCompleted" runat="server" Font-Bold="true"></asp:Label> / 
           Total: <asp:Label ID="lblTotal" runat="server"></asp:Label> modules</p>
        
        <%-- Progress Bar --%>
        <div style="width:100%; background-color:#ddd; height:25px; border-radius:12px;">
            <div id="pnlProgress" runat="server" 
                style="background-color:#4CAF50; height:25px; border-radius:12px; 
                       text-align:center; line-height:25px; color:white; width:0%">
                0%
            </div>
        </div>
    </div>
    
    <%-- Badges --%>
    <div style="margin-bottom:20px;">
        <h3>My Badges</h3>
        <asp:Repeater ID="RepeaterBadges" runat="server">
            <ItemTemplate>
                <div style='display:inline-block; background-color:Eval("BadgeColor"); 
                            color:#333; padding:15px 25px; margin:10px; border-radius:10px; 
                            text-align:center; font-weight:bold; box-shadow:0 2px 5px rgba(0,0,0,0.2);'>
                    <div style="font-size:30px; margin-bottom:5px;"><%# Eval("BadgeIcon") %></div>
                    <div><%# Eval("BadgeName") %></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="lblNoBadges" runat="server" Text="Complete 2 modules to earn your first badge!" 
            Visible="false" style="color:#666;"></asp:Label>
    </div>
    
    <%-- Completed Modules List --%>
    <div>
        <h3>Completed Modules</h3>
        <asp:GridView ID="GridViewCompleted" runat="server" AutoGenerateColumns="False" 
            CellPadding="10" BorderStyle="Solid" Width="100%" Visible="false">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Module" />
                <asp:BoundField DataField="Category" HeaderText="Category" />
                <asp:BoundField DataField="CompletionDate" HeaderText="Completed On" 
                    DataFormatString="{0:dd MMM yyyy}" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblNoModules" runat="server" Text="You haven't completed any modules yet." 
            Visible="false" style="color:#666;"></asp:Label>
    </div>
    
    <br /><br />
    <a href="Modules.aspx" style="background-color:#1976d2; color:white; padding:10px 20px; 
        text-decoration:none; border-radius:5px;">Browse More Modules</a>
    
</asp:Content>
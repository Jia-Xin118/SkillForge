<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assignment.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <style>
     .gridview-header {
         background: transparent !important;
         color: #888 !important;
         border-bottom: 2px solid #a51c30 !important;
         padding: 15px !important;
         font-size: 0.75rem !important;
         letter-spacing: 1px !important;
         text-transform: uppercase !important;
     }
     
     /* Optional: Add row styling too */
     .gridview-row {
         border-bottom: 1px solid #333 !important;
     }
     
     .gridview-row td {
         padding: 15px 0 !important;
     }
 </style>

    <!-- Profile Header -->
    <div style="background: linear-gradient(135deg, #000000 0%, #1a1a1a 100%); 
                color: #ffffff; padding: 80px 0 60px; border-bottom: 4px solid #a51c30;">
        <div class="container">
            <div style="display: flex; align-items: center; gap: 30px; flex-wrap: wrap;">
                
                <!-- Avatar -->
                <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #a51c30, #7a1524); 
                            border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                            font-size: 3rem; font-weight: 700; color: #fff; border: 4px solid #333;">
                    <asp:Label ID="lblInitials" runat="server">👤</asp:Label>
                </div>
                
                <!-- Info -->
                <div>
                    <h1 style="font-family: Georgia, serif; font-size: 2.5rem; margin-bottom: 10px;">
                        Welcome back, <asp:Label ID="lblName" runat="server"></asp:Label>! 👋
                    </h1>
                    <p style="color: #888; font-size: 1.1rem; margin: 0;">
                        <asp:Label ID="lblEmail" runat="server"></asp:Label> • 
                        <span style="background: rgba(165,28,48,0.2); color: #a51c30; padding: 4px 12px; 
                                     border-radius: 20px; font-size: 0.875rem; font-weight: 600;">
                            <asp:Label ID="lblRole" runat="server"></asp:Label>
                        </span>
                    </p>
                </div>
                
            </div>
        </div>
    </div>

    <!-- Stats -->
    <div style="background-color: #1a1a1a; padding: 60px 0;">
        <div class="container">
            <div class="row">
                
                <!-- Total Modules -->
                <div class="col-md-3 col-sm-6" style="margin-bottom: 30px;">
                    <div style="background: linear-gradient(145deg, #252525, #1e1e1e); 
                                border: 1px solid #333; padding: 30px; text-align: center;
                                border-left: 4px solid #3b82f6;">
                        <div style="font-size: 2.5rem; margin-bottom: 10px;">📚</div>
                        <div style="font-family: Georgia, serif; font-size: 2.5rem; color: #fff; 
                                    margin-bottom: 5px;">
                            <asp:Label ID="lblTotal" runat="server">0</asp:Label>
                        </div>
                        <div style="color: #666; text-transform: uppercase; letter-spacing: 2px; 
                                    font-size: 0.875rem;">
                            Total Modules
                        </div>
                    </div>
                </div>
                
                <!-- Completed -->
                <div class="col-md-3 col-sm-6" style="margin-bottom: 30px;">
                    <div style="background: linear-gradient(145deg, #252525, #1e1e1e); 
                                border: 1px solid #333; padding: 30px; text-align: center;
                                border-left: 4px solid #10b981;">
                        <div style="font-size: 2.5rem; margin-bottom: 10px;">✓</div>
                        <div style="font-family: Georgia, serif; font-size: 2.5rem; color: #fff; 
                                    margin-bottom: 5px;">
                            <asp:Label ID="lblCompleted" runat="server">0</asp:Label>
                        </div>
                        <div style="color: #666; text-transform: uppercase; letter-spacing: 2px; 
                                    font-size: 0.875rem;">
                            Completed
                        </div>
                    </div>
                </div>
                
                <!-- Certificates -->
                <div class="col-md-3 col-sm-6" style="margin-bottom: 30px;">
                    <div style="background: linear-gradient(145deg, #252525, #1e1e1e); 
                                border: 1px solid #333; padding: 30px; text-align: center;
                                border-left: 4px solid #d4af37;">
                        <div style="font-size: 2.5rem; margin-bottom: 10px;">🏆</div>
                        <div style="font-family: Georgia, serif; font-size: 2.5rem; color: #fff; 
                                    margin-bottom: 5px;">
                            <asp:Label ID="lblCertificates" runat="server">0</asp:Label>
                        </div>
                        <div style="color: #666; text-transform: uppercase; letter-spacing: 2px; 
                                    font-size: 0.875rem;">
                            Certificates
                        </div>
                    </div>
                </div>
                
                <!-- Level -->
                <div class="col-md-3 col-sm-6" style="margin-bottom: 30px;">
                    <div style="background: linear-gradient(145deg, #252525, #1e1e1e); 
                                border: 1px solid #333; padding: 30px; text-align: center;
                                border-left: 4px solid #a51c30;">
                        <div style="font-size: 2.5rem; margin-bottom: 10px;">⭐</div>
                        <div style="font-family: Georgia, serif; font-size: 2.5rem; color: #fff; 
                                    margin-bottom: 5px;">
                            <asp:Label ID="lblLevel" runat="server">1</asp:Label>
                        </div>
                        <div style="color: #666; text-transform: uppercase; letter-spacing: 2px; 
                                    font-size: 0.875rem;">
                            Current Level
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    <!-- Progress & Badges -->
    <div style="background-color: #111; padding: 60px 0; border-top: 1px solid #222;">
        <div class="container">
            <div class="row">
                
                <!-- Progress -->
                <div class="col-md-8" style="margin-bottom: 40px;">
                    <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #fff; 
                               margin-bottom: 30px;">
                        Your Progress
                    </h3>
                    
                    <div style="background: linear-gradient(145deg, #252525, #1e1e1e); 
                                border: 1px solid #333; padding: 40px; border-radius: 8px;">
                        
                        <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                            <span style="color: #888;">Level <asp:Label ID="lblCurrentLevel" runat="server">1</asp:Label></span>
                            <span style="color: #888;">
                                <asp:Label ID="lblProgressText" runat="server">0/5 XP</asp:Label>
                            </span>
                        </div>
                        
                        <div style="width: 100%; height: 12px; background: #1a1a1a; 
                                    border-radius: 6px; overflow: hidden; margin-bottom: 10px;">
                            <div id="pnlProgress" runat="server" 
                                 style="height: 100%; background: linear-gradient(90deg, #a51c30, #d4af37); 
                                        border-radius: 6px; width: 0%; transition: width 1s ease;">
                            </div>
                        </div>
                        
                        <p style="color: #666; margin: 0; font-size: 0.9rem;">
                            Keep learning to reach the next milestone!
                        </p>
                        
                    </div>
                </div>
                
                <!-- Badges -->
                <div class="col-md-4" style="margin-bottom: 40px;">
                    <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #fff; 
                               margin-bottom: 30px;">
                        🏅 My Badges
                    </h3>
                    
                    <asp:Panel ID="pnlBadges" runat="server">
                        <asp:Repeater ID="RepeaterBadges" runat="server">
                            <ItemTemplate>
                                <div style="background: linear-gradient(145deg, #252525, #1e1e1e); 
                                            border: 1px solid #333; padding: 20px; margin-bottom: 15px;
                                            display: flex; align-items: center; gap: 15px;
                                            border-radius: 8px;">
                                    <div style="font-size: 2rem;"><%# Eval("BadgeIcon") %></div>
                                    <div>
                                        <div style="color: #fff; font-weight: 600;">
                                            <%# Eval("BadgeName") %>
                                        </div>
                                        <div style="color: #666; font-size: 0.875rem;">Achieved</div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    
                    <asp:Label ID="lblNoBadges" runat="server" Visible="false"
                        style="display: block; padding: 30px; background: #1a1a1a; border: 2px dashed #333;
                               color: #666; text-align: center; border-radius: 8px;">
                        Complete 2 modules to earn your first badge!
                    </asp:Label>
                    
                </div>
                
            </div>
        </div>
    </div>

    <!-- Completed Modules - ENHANCED -->
<div style="background: linear-gradient(145deg, #252525, #1e1e1e);
border: 1px solid #333; border-radius: 16px; padding: 40px; margin-bottom: 30px;">
    
    <div style="display: flex; align-items: center; gap: 15px; margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid #333;">
        <div style="width: 50px; height: 50px; background: linear-gradient(135deg, #a51c30, #7a1524);
        border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 1.5rem;">
            📋
        </div>
        <div>
            <h3 style="margin: 0; color: #ffffff; font-family: Georgia, serif;">Completed Modules</h3>
            <p style="margin: 5px 0 0 0; color: #888; font-size: 0.9rem;">Your learning journey so far</p>
        </div>
    </div>
    
   <asp:GridView ID="GridViewCompleted" runat="server" AutoGenerateColumns="False"
    CssClass="table table-bordered" 
    style="width: 100%; background: white; border: 1px solid #dee2e6;"
    GridLines="Both"
    ShowHeader="true">
    
    <HeaderStyle 
        BackColor="#000000" 
        ForeColor="#ffffff" 
        Font-Bold="true"
        Height="50px"
        CssClass="text-uppercase" />
    
    <RowStyle 
        BackColor="#ffffff" 
        ForeColor="#5e5e5e"  
        Height="60px" />
    
    <AlternatingRowStyle BackColor="#f8f9fa" ForeColor="#5e5e5e" />
    
    <Columns>
        <asp:TemplateField HeaderText="MODULE">
            <HeaderStyle Width="300px" />
            <ItemTemplate>
                <div style="display: flex; align-items: center; gap: 12px;">
                    <div style="width: 40px; height: 40px; background: #f0f0f0; border-radius: 8px;
                    display: flex; align-items: center; justify-content: center; font-size: 1.2rem;">
                        📚
                    </div>
                    <span style="color: #5e5e5e; font-weight: 500;"><%# Eval("Title") %></span>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="CATEGORY">
            <HeaderStyle Width="200px" />
            <ItemTemplate>
                <span style="display: inline-block; padding: 6px 12px; background: rgba(165,28,48,0.1);
                color: #a51c30; border-radius: 20px; font-size: 12px; font-weight: 600; text-transform: uppercase;">
                    <%# Eval("Category") %>
                </span>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="COMPLETED ON">
            <HeaderStyle Width="200px" />
            <ItemTemplate>
                <div style="display: flex; align-items: center; gap: 8px; color: #5e5e5e;">
                    <span>📅</span>
                    <span><%# Convert.ToDateTime(Eval("CompletionDate")).ToString("dd MMM yyyy") %></span>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="">
            <HeaderStyle Width="150px" />
            <ItemTemplate>
                <a href='Certificate.aspx?moduleId=<%# Eval("ModuleID") %>' 
                style="display: inline-flex; align-items: center; gap: 6px;
                padding: 8px 16px; background: transparent; color: #a51c30; 
                border: 2px solid #a51c30; border-radius: 6px; text-decoration: none;
                font-size: 12px; font-weight: 600; transition: all 0.3s;"
                onmouseover="this.style.background='#a51c30'; this.style.color='#ffffff';"
                onmouseout="this.style.background='transparent'; this.style.color='#a51c30';">
                    <span>🏆</span> CERTIFICATE
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    
    <asp:Label ID="lblNoModules" runat="server"
        Text="You haven't completed any modules yet. Start learning today!"
        Visible="false"
        style="display: block; text-align: center; padding: 60px 20px; color: #666;">
    </asp:Label>
    
</div>
            
            <div style="text-align: center; margin-top: 40px;">
                <a href="Modules.aspx" class="btn btn-default"
                   style="background: #a51c30; color: #fff; border: none;
                          padding: 15px 40px; font-size: 1rem; font-weight: 600;
                          text-transform: uppercase; letter-spacing: 1px;
                          text-decoration: none; display: inline-block;">
                    🚀 Browse More Modules
                </a>
            </div>

</asp:Content>
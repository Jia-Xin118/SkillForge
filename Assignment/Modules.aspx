<%@ Page Title="Learning Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
CodeBehind="Modules.aspx.cs" Inherits="Assignment.Modules" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div style="background: #1a1a1a; min-height: 100vh; padding: 60px 0;">
    <div class="container">
        
        <!-- Header -->
        <div style="text-align: center; margin-bottom: 50px;">
            <h2 style="font-family: Georgia, serif; font-size: 3rem; color: #ffffff; margin-bottom: 15px;">
                Business Micro-Skills Modules
            </h2>
            <div style="display: inline-block; padding: 10px 25px; background: rgba(165,28,48,0.2);
            border: 1px solid #a51c30; border-radius: 30px;">
                <asp:Label ID="lblCategory" runat="server" 
                    style="color: #a51c30; font-weight: 600; text-transform: uppercase; letter-spacing: 2px; font-size: 0.9rem;">
                </asp:Label>
            </div>
        </div>
        
        <!-- Category Filter - WHITE TEXT -->
        <div style="text-align: center; margin-bottom: 40px;">
            <a href="Modules.aspx" style="display: inline-block; padding: 10px 20px; 
            color: #ffffff !important; text-decoration: none !important; 
            border-bottom: 2px solid #a51c30; margin: 0 10px; font-weight: 600;">
                All Modules
            </a>
            <a href="Modules.aspx?cat=Leadership" style="display: inline-block; padding: 10px 20px; 
            color: #888 !important; text-decoration: none !important; 
            border-bottom: 2px solid transparent; margin: 0 10px; transition: all 0.3s;"
            onmouseover="this.style.color='#ffffff !important'; this.style.borderColor='#a51c30';">
                Leadership
            </a>
            <a href="Modules.aspx?cat=Finance" style="display: inline-block; padding: 10px 20px; 
            color: #888 !important; text-decoration: none !important; 
            border-bottom: 2px solid transparent; margin: 0 10px; transition: all 0.3s;"
            onmouseover="this.style.color='#ffffff !important'; this.style.borderColor='#a51c30';">
                Finance
            </a>
            <a href="Modules.aspx?cat=Communication" style="display: inline-block; padding: 10px 20px; 
            color: #888 !important; text-decoration: none !important; 
            border-bottom: 2px solid transparent; margin: 0 10px; transition: all 0.3s;"
            onmouseover="this.style.color='#ffffff !important'; this.style.borderColor='#a51c30';">
                Communication
            </a>
        </div>
        
        <!-- Modules Grid -->
        <div class="row">
            <asp:Repeater ID="RepeaterModules" runat="server">
                <ItemTemplate>
                    <div class="col-md-6 col-lg-4" style="margin-bottom: 30px;">
                        <div onclick="location.href='ModuleDetail.aspx?id=<%# Eval("ModuleID") %>'"
                        style="background: linear-gradient(145deg, #252525, #1e1e1e);
                        border: 1px solid #333; border-radius: 16px; padding: 35px; height: 100%;
                        cursor: pointer; transition: all 0.3s; position: relative; overflow: hidden;"
                        onmouseover="this.style.borderColor='#a51c30'; this.style.transform='translateY(-8px)'; this.style.boxShadow='0 20px 40px rgba(0,0,0,0.4)';"
                        onmouseout="this.style.borderColor='#333'; this.style.transform='translateY(0)'; this.style.boxShadow='none';">
                            
                            <!-- Category Badge -->
                            <div style="display: inline-block; padding: 6px 14px; 
                            background: rgba(165,28,48,0.2); color: #a51c30;
                            border-radius: 20px; font-size: 0.7rem; font-weight: 700; 
                            text-transform: uppercase; letter-spacing: 1px; margin-bottom: 20px;">
                                <%# Eval("Category") %>
                            </div>
                            
                            <!-- Title -->
                            <h3 style="font-family: Georgia, serif; font-size: 1.5rem; 
                            color: #ffffff; margin-bottom: 15px; line-height: 1.3;">
                                <%# Eval("Title") %>
                            </h3>
                            
                            <!-- Description -->
                            <p style="color: #888; line-height: 1.7; font-size: 0.95rem; 
                            margin-bottom: 25px; flex: 1;">
                                <%# Eval("Description") %>
                            </p>
                            
                            <!-- Footer -->
                            <div style="display: flex; align-items: center; justify-content: space-between;
                            padding-top: 20px; border-top: 1px solid #333;">
                                <span style="color: #a51c30; font-weight: 600; font-size: 0.85rem;
                                text-transform: uppercase; letter-spacing: 1px;">
                                    Start Learning →
                                </span>
                                <div style="width: 40px; height: 40px; background: #a51c30;
                                border-radius: 50%; display: flex; align-items: center;
                                justify-content: center; color: #fff; font-size: 1rem;">
                                    ▶
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        
    </div>
</div>

</asp:Content>
<%@ Page Title="Create Account - SkillForge" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- Main Container with subtle background --%>
    <div style="background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ec 100%); min-height: 100vh; padding: 60px 20px;">
        <div style="max-width: 480px; margin: 0 auto;">
            
            <%-- Logo/Brand Header --%>
            <div style="text-align: center; margin-bottom: 30px;">
                <div style="font-size: 48px; margin-bottom: 10px;">🎓</div>
                <h1 style="color: #1e3a5f; margin: 0; font-size: 28px; font-weight: 700;">Join SkillForge</h1>
                <p style="color: #666; margin: 10px 0 0 0; font-size: 16px;">
                    Start your professional development journey today
                </p>
            </div>
            
            <%-- Registration Card --%>
            <div style="background: white; border-radius: 12px; padding: 40px; 
                        box-shadow: 0 10px 40px rgba(0,0,0,0.1);">
                
                <%-- Success/Error Message --%>
                <asp:Panel ID="pnlMessage" runat="server" Visible="false" 
                    style="background: #fee; border-left: 4px solid #c33; padding: 15px; margin-bottom: 25px; border-radius: 4px;">
                    <asp:Label ID="lblMessage" runat="server" style="color: #c33; font-size: 14px;"></asp:Label>
                </asp:Panel>
                
                <%-- Full Name Field --%>
                <div style="margin-bottom: 24px;">
                    <label style="display: block; margin-bottom: 8px; color: #333; font-weight: 600; font-size: 14px;">
                        Full Name <span style="color: #c9a227;">*</span>
                    </label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="e.g., John Smith"
                        style="width: 100%; padding: 14px 16px; border: 2px solid #e0e0e0; border-radius: 8px; 
                               font-size: 16px; transition: border-color 0.3s; box-sizing: border-box;"
                        onfocus="this.style.borderColor='#2d5a87';" 
                        onblur="this.style.borderColor='#e0e0e0';"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Please enter your full name" 
                        style="color: #c33; font-size: 13px; display: block; margin-top: 6px;"></asp:RequiredFieldValidator>
                </div>
                
                <%-- Email Field --%>
                <div style="margin-bottom: 24px;">
                    <label style="display: block; margin-bottom: 8px; color: #333; font-weight: 600; font-size: 14px;">
                        Email Address <span style="color: #c9a227;">*</span>
                    </label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="you@company.com"
                        style="width: 100%; padding: 14px 16px; border: 2px solid #e0e0e0; border-radius: 8px; 
                               font-size: 16px; transition: border-color 0.3s; box-sizing: border-box;"
                        onfocus="this.style.borderColor='#2d5a87';" 
                        onblur="this.style.borderColor='#e0e0e0';"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email is required" 
                        style="color: #c33; font-size: 13px; display: block; margin-top: 6px;"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        style="color: #c33; font-size: 13px; display: block; margin-top: 6px;"></asp:RegularExpressionValidator>
                </div>
                
                <%-- Password Field --%>
                <div style="margin-bottom: 24px;">
                    <label style="display: block; margin-bottom: 8px; color: #333; font-weight: 600; font-size: 14px;">
                        Password <span style="color: #c9a227;">*</span>
                    </label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Create a secure password"
                        style="width: 100%; padding: 14px 16px; border: 2px solid #e0e0e0; border-radius: 8px; 
                               font-size: 16px; transition: border-color 0.3s; box-sizing: border-box;"
                        onfocus="this.style.borderColor='#2d5a87';" 
                        onblur="this.style.borderColor='#e0e0e0';"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Password is required" 
                        style="color: #c33; font-size: 13px; display: block; margin-top: 6px;"></asp:RequiredFieldValidator>
                    
                    <%-- Password requirements hint --%>
                    <div style="margin-top: 8px; padding: 12px; background: #f8f9fa; border-radius: 6px;">
                        <p style="margin: 0 0 8px 0; font-size: 12px; color: #666; font-weight: 600;">Password must include:</p>
                        <ul style="margin: 0; padding-left: 18px; font-size: 12px; color: #888; line-height: 1.8;">
                            <li>At least 8 characters</li>
                            <li>One uppercase letter</li>
                            <li>One number</li>
                        </ul>
                    </div>
                </div>
                
                <%-- Terms Checkbox --%>
                <div style="margin-bottom: 30px;">
                    <label style="display: flex; align-items: flex-start; gap: 10px; cursor: pointer; font-size: 14px; color: #555;">
                        <input type="checkbox" style="margin-top: 3px;" required />
                        <span>
                            I agree to the <a href="#" style="color: #2d5a87; text-decoration: none;">Terms of Service</a> 
                            and <a href="#" style="color: #2d5a87; text-decoration: none;">Privacy Policy</a>
                        </span>
                    </label>
                </div>
                
                <%-- Submit Button --%>
                <asp:Button ID="btnRegister" runat="server" Text="Create Account" OnClick="btnRegister_Click"
                    style="width: 100%; padding: 16px; background: linear-gradient(135deg, #c9a227 0%, #d4af37 100%); 
                           color: #1e3a5f; border: none; border-radius: 8px; font-size: 16px; font-weight: 700; 
                           cursor: pointer; transition: transform 0.2s, box-shadow 0.2s;"
                    onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 4px 12px rgba(201,162,39,0.4)';"
                    onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='none';" />
                
                <%-- Login Link --%>
                <div style="text-align: center; margin-top: 25px; padding-top: 25px; border-top: 1px solid #eee;">
                    <p style="margin: 0; color: #666; font-size: 15px;">
                        Already have an account? 
                        <a href="Login.aspx" style="color: #2d5a87; text-decoration: none; font-weight: 600;">Sign in</a>
                    </p>
                </div>
                
            </div>
            
            <%-- Trust Badges --%>
            <div style="text-align: center; margin-top: 30px;">
                <p style="color: #888; font-size: 12px; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 1px;">
                    Trusted by professionals worldwide
                </p>
                <div style="display: flex; justify-content: center; gap: 20px; opacity: 0.6;">
                    <span style="font-size: 24px;" title="Secure">🔒</span>
                    <span style="font-size: 24px;" title="Verified">✓</span>
                    <span style="font-size: 24px;" title="Trusted">⭐</span>
                </div>
            </div>
            
        </div>
    </div>
    
</asp:Content>
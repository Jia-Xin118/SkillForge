<%@ Page Title="Contact Us - SkillForge" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Assignment.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero -->
    <div style="background: linear-gradient(135deg, #000000 0%, #1a1a1a 100%); 
                color: #ffffff; padding: 100px 0 60px; text-align: center; 
                border-bottom: 4px solid #a51c30;">
        <div class="container">
            <h1 style="font-family: Georgia, serif; font-size: 4rem; margin-bottom: 20px;">
                Contact Us
            </h1>
            <p style="font-size: 1.25rem; color: #888;">
                We're here to help you succeed
            </p>
        </div>
    </div>

    <!-- Contact Section -->
    <div style="background-color: #1a1a1a; padding: 100px 0;">
        <div class="container">
            <div class="row">
                
                <!-- Contact Info -->
                <div class="col-md-5" style="margin-bottom: 60px;">
                    <h2 style="font-family: Georgia, serif; font-size: 2rem; color: #ffffff; 
                               margin-bottom: 40px;">
                        Get in Touch
                    </h2>
                    
                    <!-- Email -->
                    <div style="display: flex; align-items: flex-start; margin-bottom: 30px;">
                        <div style="width: 50px; height: 50px; background: rgba(165,28,48,0.2); 
                                    border-radius: 12px; display: flex; align-items: center; 
                                    justify-content: center; font-size: 1.5rem; margin-right: 20px;">
                            ✉️
                        </div>
                        <div>
                            <h4 style="color: #ffffff; margin-bottom: 5px; font-size: 1.1rem;">Email</h4>
                            <p style="color: #888; margin: 0;">support@skillforge.edu</p>
                        </div>
                    </div>
                    
                    <!-- Phone -->
                    <div style="display: flex; align-items: flex-start; margin-bottom: 30px;">
                        <div style="width: 50px; height: 50px; background: rgba(165,28,48,0.2); 
                                    border-radius: 12px; display: flex; align-items: center; 
                                    justify-content: center; font-size: 1.5rem; margin-right: 20px;">
                            📞
                        </div>
                        <div>
                            <h4 style="color: #ffffff; margin-bottom: 5px; font-size: 1.1rem;">Phone</h4>
                            <p style="color: #888; margin: 0;">+1 (555) 123-4567</p>
                        </div>
                    </div>
                    
                    <!-- Address -->
                    <div style="display: flex; align-items: flex-start; margin-bottom: 30px;">
                        <div style="width: 50px; height: 50px; background: rgba(165,28,48,0.2); 
                                    border-radius: 12px; display: flex; align-items: center; 
                                    justify-content: center; font-size: 1.5rem; margin-right: 20px;">
                            📍
                        </div>
                        <div>
                            <h4 style="color: #ffffff; margin-bottom: 5px; font-size: 1.1rem;">Address</h4>
                            <p style="color: #888; margin: 0; line-height: 1.6;">
                                Asia Pacific University<br/>
                                Technology Park Malaysia<br/>
                                Bukit Jalil, Kuala Lumpur
                            </p>
                        </div>
                    </div>
                    
                    <!-- Hours -->
                    <div style="display: flex; align-items: flex-start;">
                        <div style="width: 50px; height: 50px; background: rgba(165,28,48,0.2); 
                                    border-radius: 12px; display: flex; align-items: center; 
                                    justify-content: center; font-size: 1.5rem; margin-right: 20px;">
                            🕐
                        </div>
                        <div>
                            <h4 style="color: #ffffff; margin-bottom: 5px; font-size: 1.1rem;">Hours</h4>
                            <p style="color: #888; margin: 0; line-height: 1.6;">
                                Mon - Fri: 9:00 AM - 6:00 PM<br/>
                                <span style="color: #666;">Sat - Sun: Closed</span>
                            </p>
                        </div>
                    </div>
                </div>
                
                <!-- Contact Form -->
                <div class="col-md-7">
                    <div style="background: linear-gradient(145deg, #252525, #1e1e1e); 
                                border: 1px solid #333; padding: 50px; border-radius: 8px;">
                        
                        <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #ffffff; 
                                   margin-bottom: 30px;">
                            Send Message
                        </h3>
                        
                        <div class="form-group" style="margin-bottom: 25px;">
                            <label style="display: block; color: #888; margin-bottom: 10px; 
                                          font-size: 0.875rem; text-transform: uppercase; 
                                          letter-spacing: 1px;">
                                Name
                            </label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                style="width: 100%; background: #1a1a1a; border: 1px solid #444; 
                                       color: #fff; padding: 15px; font-size: 1rem;
                                       transition: all 0.3s;"
                                onfocus="this.style.borderColor='#a51c30';"
                                onblur="this.style.borderColor='#444';" />
                        </div>
                        
                        <div class="form-group" style="margin-bottom: 25px;">
                            <label style="display: block; color: #888; margin-bottom: 10px; 
                                          font-size: 0.875rem; text-transform: uppercase; 
                                          letter-spacing: 1px;">
                                Email
                            </label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"
                                style="width: 100%; background: #1a1a1a; border: 1px solid #444; 
                                       color: #fff; padding: 15px; font-size: 1rem;
                                       transition: all 0.3s;"
                                onfocus="this.style.borderColor='#a51c30';"
                                onblur="this.style.borderColor='#444';" />
                        </div>
                        
                        <div class="form-group" style="margin-bottom: 30px;">
                            <label style="display: block; color: #888; margin-bottom: 10px; 
                                          font-size: 0.875rem; text-transform: uppercase; 
                                          letter-spacing: 1px;">
                                Message
                            </label>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" 
                                CssClass="form-control"
                                style="width: 100%; background: #1a1a1a; border: 1px solid #444; 
                                       color: #fff; padding: 15px; font-size: 1rem; resize: vertical;
                                       transition: all 0.3s;"
                                onfocus="this.style.borderColor='#a51c30';"
                                onblur="this.style.borderColor='#444';" />
                        </div>
                        
                        <asp:Button ID="BtnSend" runat="server" Text="Send Message →" 
                            OnClick="BtnSend_Click"
                            style="width: 100%; background: #a51c30; color: #fff; border: none;
                                   padding: 18px; font-size: 1rem; font-weight: 700; 
                                   text-transform: uppercase; letter-spacing: 1.5px;
                                   cursor: pointer; transition: all 0.3s;"
                            onmouseover="this.style.background='#7a1524';"
                            onmouseout="this.style.background='#a51c30';" />
                        
                        <asp:Label ID="lblStatus" runat="server" 
                            style="display: block; margin-top: 20px; color: #10b981; font-weight: 600;">
                        </asp:Label>
                        
                    </div>
                </div>
                
            </div>
        </div>
    </div>

</asp:Content>
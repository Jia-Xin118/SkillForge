<%@ Page Title="About Us - SkillForge" Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true" CodeBehind="About.aspx.cs"
Inherits="Assignment.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent"
runat="server">

<!-- Hero -->
<div style="background: linear-gradient(135deg, #000000 0%, #1a1a1a 100%);
color: #ffffff; padding: 100px 0 60px; text-align: center;
border-bottom: 4px solid #a51c30;">
    <div class="container">
        <h1 style="font-family: Georgia, serif; font-size: 4rem;
        margin-bottom: 20px;">
            About SkillForge
        </h1>
        <p style="font-size: 1.5rem; color: #888; max-width: 700px; margin: 0 auto;">
            Empowering professionals with world-class business education
        </p>
    </div>
</div>

<!-- Mission - FIXED CENTERING -->
<div style="background-color: #1a1a1a; padding: 100px 0;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <h2 style="font-family: Georgia, serif; font-size: 2.5rem; color: #ffffff;
                margin-bottom: 30px;">
                    Our Mission
                </h2>
                <p style="font-size: 1.25rem; color: #aaa; line-height: 1.8;">
                    SkillForge was founded with a simple belief: quality business education
                    should be accessible to everyone. We partner with industry experts and leading
                    academics to deliver practical, actionable insights that drive real career growth.
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Stats -->
<div style="background-color: #111; padding: 80px 0; border-top: 1px solid #222;
border-bottom: 1px solid #222;">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-4" style="margin-bottom: 40px;">
                <div style="font-family: Georgia, serif; font-size: 4rem; color: #d4af37;
                margin-bottom: 10px;">
                    50K+
                </div>
                <div style="font-size: 1rem; color: #666; text-transform: uppercase;
                letter-spacing: 3px;">
                    Active Learners
                </div>
            </div>
            <div class="col-md-4" style="margin-bottom: 40px;">
                <div style="font-family: Georgia, serif; font-size: 4rem; color: #d4af37;
                margin-bottom: 10px;">
                    120+
                </div>
                <div style="font-size: 1rem; color: #666; text-transform: uppercase;
                letter-spacing: 3px;">
                    Expert Modules
                </div>
            </div>
            <div class="col-md-4" style="margin-bottom: 40px;">
                <div style="font-family: Georgia, serif; font-size: 4rem; color: #d4af37;
                margin-bottom: 10px;">
                    95%
                </div>
                <div style="font-size: 1rem; color: #666; text-transform: uppercase;
                letter-spacing: 3px;">
                    Completion Rate
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Leadership Team -->
<div style="background-color: #1a1a1a; padding: 100px 0;">
    <div class="container">
        <h2 style="font-family: Georgia, serif; font-size: 3rem; color: #ffffff;
        text-align: center; margin-bottom: 60px;">
            Leadership Team
        </h2>
        
        <div class="row">
            <!-- Dr. Sarah Chen -->
            <div class="col-md-4 mb-4">
                <div style="background: linear-gradient(145deg, #252525, #1e1e1e);
                border: 1px solid #333; padding: 50px 40px; text-align: center;
                transition: all 0.3s; height: 100%; border-radius: 8px;"
                onmouseover="this.style.borderColor='#a51c30'; this.style.transform='translateY(-5px)';"
                onmouseout="this.style.borderColor='#333'; this.style.transform='translateY(0)';">
                    
                    <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #a51c30, #7a1524);
                    border-radius: 50%; margin: 0 auto 30px; display: flex;
                    align-items: center; justify-content: center; font-size: 3rem;">
                        👤
                    </div>
                    
                    <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #ffffff;
                    margin-bottom: 10px;">
                        Dr. Sarah Chen
                    </h3>
                    <p style="color: #a51c30; font-weight: 600; text-transform: uppercase;
                    letter-spacing: 2px; font-size: 0.875rem; margin-bottom: 20px;">
                        Founder & CEO
                    </p>
                    <p style="color: #888; line-height: 1.6;">
                        Former McKinsey consultant with 20+ years of executive leadership experience at Fortune 500 companies.
                    </p>
                </div>
            </div>
            
            <!-- Prof. Michael Torres -->
            <div class="col-md-4 mb-4">
                <div style="background: linear-gradient(145deg, #252525, #1e1e1e);
                border: 1px solid #333; padding: 50px 40px; text-align: center;
                transition: all 0.3s; height: 100%; border-radius: 8px;"
                onmouseover="this.style.borderColor='#a51c30'; this.style.transform='translateY(-5px)';"
                onmouseout="this.style.borderColor='#333'; this.style.transform='translateY(0)';">
                    
                    <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #1e3a5f, #0f172a);
                    border-radius: 50%; margin: 0 auto 30px; display: flex;
                    align-items: center; justify-content: center; font-size: 3rem;">
                        👤
                    </div>
                    
                    <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #ffffff;
                    margin-bottom: 10px;">
                        Prof. Michael Torres
                    </h3>
                    <p style="color: #a51c30; font-weight: 600; text-transform: uppercase;
                    letter-spacing: 2px; font-size: 0.875rem; margin-bottom: 20px;">
                        Chief Academic Officer
                    </p>
                    <p style="color: #888; line-height: 1.6;">
                        Harvard Business School professor emeritus specializing in organizational behavior and leadership development.
                    </p>
                </div>
            </div>
            
            <!-- Emily Watson -->
            <div class="col-md-4 mb-4">
                <div style="background: linear-gradient(145deg, #252525, #1e1e1e);
                border: 1px solid #333; padding: 50px 40px; text-align: center;
                transition: all 0.3s; height: 100%; border-radius: 8px;"
                onmouseover="this.style.borderColor='#a51c30'; this.style.transform='translateY(-5px)';"
                onmouseout="this.style.borderColor='#333'; this.style.transform='translateY(0)';">
                    
                    <div style="width: 120px; height: 120px; background: linear-gradient(135deg, #d4af37, #b8941f);
                    border-radius: 50%; margin: 0 auto 30px; display: flex;
                    align-items: center; justify-content: center; font-size: 3rem;">
                        👤
                    </div>
                    
                    <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #ffffff;
                    margin-bottom: 10px;">
                        Emily Watson
                    </h3>
                    <p style="color: #a51c30; font-weight: 600; text-transform: uppercase;
                    letter-spacing: 2px; font-size: 0.875rem; margin-bottom: 20px;">
                        Head of Content
                    </p>
                    <p style="color: #888; line-height: 1.6;">
                        Award-winning business journalist formerly with The Wall Street Journal and Bloomberg.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
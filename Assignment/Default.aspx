<%@ Page Title="SkillForge - Business Education & Professional Certifications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- HERO SECTION: More Impactful --%>
    <div style="background: linear-gradient(135deg, #1e3a5f 0%, #2d5a87 50%, #1e3a5f 100%); 
                color: white; padding: 80px 20px; position: relative; overflow: hidden;">
        <%-- Subtle pattern overlay --%>
        <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; 
            background-image: radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px); 
            background-size: 50px 50px; opacity: 0.3;"></div>
        
        <div style="max-width: 1200px; margin: 0 auto; position: relative; z-index: 1;">
            <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 20px;">
                <span style="background-color: #c9a227; color: #1e3a5f; padding: 6px 16px; 
                             font-size: 11px; font-weight: bold; text-transform: uppercase; letter-spacing: 1px;">
                    Featured Insight
                </span>
                <span style="color: rgba(255,255,255,0.7); font-size: 13px;">January 2026</span>
            </div>
            
            <h1 style="font-size: 48px; margin: 0 0 20px 0; max-width: 800px; line-height: 1.2; font-weight: 700;">
                The Future of Leadership in a Digital Age
            </h1>
            
            <p style="font-size: 20px; max-width: 650px; opacity: 0.9; line-height: 1.7; margin-bottom: 30px;">
                How top executives are adapting to AI-driven decision making and remote team management. 
                Learn the essential skills that separate successful leaders from the rest in today's 
                rapidly evolving business landscape.
            </p>
            
            <div style="display: flex; gap: 15px; flex-wrap: wrap; align-items: center;">
                <a href="Article.aspx?id=1" style="background-color: #c9a227; color: #1e3a5f; 
                    padding: 16px 32px; text-decoration: none; font-weight: bold; 
                    display: inline-block; border-radius: 4px; font-size: 16px; transition: all 0.3s;">
                    Read Full Article
                </a>
                <a href="#certifications" style="color: white; text-decoration: none; 
                    padding: 16px 32px; border: 2px solid rgba(255,255,255,0.5); border-radius: 4px;
                    font-weight: 500; transition: all 0.3s;">
                    View Certifications
                </a>
            </div>
            
            <%-- Stats bar --%>
            <div style="display: flex; gap: 40px; margin-top: 50px; padding-top: 30px; 
                        border-top: 1px solid rgba(255,255,255,0.2);">
                <div>
                    <div style="font-size: 32px; font-weight: bold; color: #c9a227;">50K+</div>
                    <div style="font-size: 13px; opacity: 0.8; text-transform: uppercase; letter-spacing: 1px;">Active Learners</div>
                </div>
                <div>
                    <div style="font-size: 32px; font-weight: bold; color: #c9a227;">120+</div>
                    <div style="font-size: 13px; opacity: 0.8; text-transform: uppercase; letter-spacing: 1px;">Business Modules</div>
                </div>
                <div>
                    <div style="font-size: 32px; font-weight: bold; color: #c9a227;">95%</div>
                    <div style="font-size: 13px; opacity: 0.8; text-transform: uppercase; letter-spacing: 1px;">Completion Rate</div>
                </div>
            </div>
        </div>
    </div>
    
    <%-- TRUSTED BY SECTION (HBSO Style) --%>
    <div style="background: #f8f9fa; padding: 30px 20px; border-bottom: 1px solid #e0e0e0;">
        <div style="max-width: 1200px; margin: 0 auto; text-align: center;">
            <p style="color: #666; font-size: 12px; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 20px;">
                Trusted by professionals from leading organizations
            </p>
            <div style="display: flex; justify-content: center; align-items: center; gap: 60px; 
                        flex-wrap: wrap; opacity: 0.6; font-weight: bold; color: #1e3a5f; font-size: 18px;">
                <span>McKinsey</span>
                <span>Deloitte</span>
                <span>Goldman Sachs</span>
                <span>Microsoft</span>
                <span>Unilever</span>
                <span>BCG</span>
            </div>
        </div>
    </div>
    
    <%-- LATEST INSIGHTS: Enhanced Grid --%>
    <div style="max-width: 1200px; margin: 60px auto; padding: 0 20px;">
        <div style="display: flex; justify-content: space-between; align-items: end; margin-bottom: 30px;">
            <div>
                <h2 style="color: #1e3a5f; margin: 0 0 10px 0; font-size: 32px;">Latest Business Insights</h2>
                <p style="color: #666; margin: 0; font-size: 16px;">Expert analysis and practical strategies from industry leaders</p>
            </div>
            <a href="Articles.aspx" style="color: #2d5a87; text-decoration: none; font-weight: 600; 
                border-bottom: 2px solid #c9a227; padding-bottom: 2px;">View All Articles</a>
        </div>
        
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 30px;">
            
            <%-- Article 1: Leadership --%>
            <div style="background: white; border-radius: 8px; overflow: hidden; 
                        box-shadow: 0 4px 6px rgba(0,0,0,0.07); transition: transform 0.3s, box-shadow 0.3s;"
                 onmouseover="this.style.transform='translateY(-5px)'; this.style.boxShadow='0 8px 25px rgba(0,0,0,0.15)';"
                 onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 6px rgba(0,0,0,0.07)';">
                <div style="background: linear-gradient(135deg, #2d5a87 0%, #1e3a5f 100%); height: 200px; 
                            display: flex; align-items: center; justify-content: center; position: relative;">
                    <div style="font-size: 64px; opacity: 0.9;">💼</div>
                    <span style="position: absolute; top: 15px; left: 15px; background: rgba(255,255,255,0.2); 
                                 color: white; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 600;">
                        8 min read
                    </span>
                </div>
                <div style="padding: 25px;">
                    <div style="display: flex; gap: 10px; margin-bottom: 12px;">
                        <span style="color: #c9a227; font-size: 11px; font-weight: bold; text-transform: uppercase; letter-spacing: 1px;">
                            Leadership
                        </span>
                        <span style="color: #999; font-size: 11px;">•</span>
                        <span style="color: #999; font-size: 11px;">Strategy</span>
                    </div>
                    <h3 style="color: #1e3a5f; margin: 0 0 12px 0; font-size: 22px; line-height: 1.3;">
                        Strategic Decision Making Under Uncertainty
                    </h3>
                    <p style="color: #555; line-height: 1.7; margin-bottom: 20px; font-size: 15px;">
                        Learn frameworks used by Fortune 500 CEOs to navigate volatile markets and make 
                        critical decisions with incomplete information. Master the art of balancing 
                        risk and opportunity in high-stakes environments.
                    </p>
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <a href="Article.aspx?id=1" style="color: #2d5a87; text-decoration: none; 
                            font-weight: 600; display: flex; align-items: center; gap: 5px;">
                            Read Article <span style="font-size: 18px;">→</span>
                        </a>
                        <span style="color: #999; font-size: 13px;">By Dr. Sarah Chen</span>
                    </div>
                </div>
            </div>
            
            <%-- Article 2: Finance --%>
            <div style="background: white; border-radius: 8px; overflow: hidden; 
                        box-shadow: 0 4px 6px rgba(0,0,0,0.07); transition: transform 0.3s, box-shadow 0.3s;"
                 onmouseover="this.style.transform='translateY(-5px)'; this.style.boxShadow='0 8px 25px rgba(0,0,0,0.15)';"
                 onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 6px rgba(0,0,0,0.07)';">
                <div style="background: linear-gradient(135deg, #1e3a5f 0%, #2d5a87 100%); height: 200px; 
                            display: flex; align-items: center; justify-content: center; position: relative;">
                    <div style="font-size: 64px; opacity: 0.9;">📊</div>
                    <span style="position: absolute; top: 15px; left: 15px; background: rgba(255,255,255,0.2); 
                                 color: white; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 600;">
                        12 min read
                    </span>
                </div>
                <div style="padding: 25px;">
                    <div style="display: flex; gap: 10px; margin-bottom: 12px;">
                        <span style="color: #c9a227; font-size: 11px; font-weight: bold; text-transform: uppercase; letter-spacing: 1px;">
                            Finance
                        </span>
                        <span style="color: #999; font-size: 11px;">•</span>
                        <span style="color: #999; font-size: 11px;">Accounting</span>
                    </div>
                    <h3 style="color: #1e3a5f; margin: 0 0 12px 0; font-size: 22px; line-height: 1.3;">
                        Financial Acumen for Non-Financial Managers
                    </h3>
                    <p style="color: #555; line-height: 1.7; margin-bottom: 20px; font-size: 15px;">
                        Essential financial concepts every business leader needs to understand. 
                        From reading balance sheets to making capital allocation decisions that 
                        drive shareholder value and sustainable growth.
                    </p>
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <a href="Article.aspx?id=2" style="color: #2d5a87; text-decoration: none; 
                            font-weight: 600; display: flex; align-items: center; gap: 5px;">
                            Read Article <span style="font-size: 18px;">→</span>
                        </a>
                        <span style="color: #999; font-size: 13px;">By Prof. Michael Torres</span>
                    </div>
                </div>
            </div>
            
            <%-- Article 3: Communication --%>
            <div style="background: white; border-radius: 8px; overflow: hidden; 
                        box-shadow: 0 4px 6px rgba(0,0,0,0.07); transition: transform 0.3s, box-shadow 0.3s;"
                 onmouseover="this.style.transform='translateY(-5px)'; this.style.boxShadow='0 8px 25px rgba(0,0,0,0.15)';"
                 onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 6px rgba(0,0,0,0.07)';">
                <div style="background: linear-gradient(135deg, #c9a227 0%, #d4af37 100%); height: 200px; 
                            display: flex; align-items: center; justify-content: center; position: relative;">
                    <div style="font-size: 64px; opacity: 0.9;">🎯</div>
                    <span style="position: absolute; top: 15px; left: 15px; background: rgba(255,255,255,0.3); 
                                 color: #1e3a5f; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 600;">
                        10 min read
                    </span>
                </div>
                <div style="padding: 25px;">
                    <div style="display: flex; gap: 10px; margin-bottom: 12px;">
                        <span style="color: #c9a227; font-size: 11px; font-weight: bold; text-transform: uppercase; letter-spacing: 1px;">
                            Communication
                        </span>
                        <span style="color: #999; font-size: 11px;">•</span>
                        <span style="color: #999; font-size: 11px;">Leadership</span>
                    </div>
                    <h3 style="color: #1e3a5f; margin: 0 0 12px 0; font-size: 22px; line-height: 1.3;">
                        Mastering Executive Communication
                    </h3>
                    <p style="color: #555; line-height: 1.7; margin-bottom: 20px; font-size: 15px;">
                        The art of persuasion, negotiation, and presentation at the executive level. 
                        Learn how top leaders inspire action and drive organizational change through 
                        powerful, authentic communication strategies.
                    </p>
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <a href="Article.aspx?id=3" style="color: #2d5a87; text-decoration: none; 
                            font-weight: 600; display: flex; align-items: center; gap: 5px;">
                            Read Article <span style="font-size: 18px;">→</span>
                        </a>
                        <span style="color: #999; font-size: 13px;">By Dr. Emily Watson</span>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
    <%-- WHY SKILLFORGE SECTION (Add credibility) --%>
    <div style="background: white; padding: 80px 20px; border-top: 1px solid #e0e0e0;">
        <div style="max-width: 1200px; margin: 0 auto;">
            <h2 style="color: #1e3a5f; text-align: center; margin-bottom: 50px; font-size: 32px;">
                Why Professionals Choose SkillForge
            </h2>
            
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 40px;">
                
                <div style="text-align: center; padding: 20px;">
                    <div style="width: 60px; height: 60px; background: linear-gradient(135deg, #2d5a87, #1e3a5f); 
                                border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                                margin: 0 auto 20px; color: white; font-size: 28px;">🎓</div>
                    <h3 style="color: #1e3a5f; margin-bottom: 10px;">Expert-Led Content</h3>
                    <p style="color: #666; line-height: 1.6;">Learn from Harvard, MIT, and Fortune 500 executives with real-world experience.</p>
                </div>
                
                <div style="text-align: center; padding: 20px;">
                    <div style="width: 60px; height: 60px; background: linear-gradient(135deg, #c9a227, #d4af37); 
                                border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                                margin: 0 auto 20px; color: white; font-size: 28px;">⏱️</div>
                    <h3 style="color: #1e3a5f; margin-bottom: 10px;">Learn at Your Pace</h3>
                    <p style="color: #666; line-height: 1.6;">Flexible modules designed for busy professionals. Access content 24/7 from any device.</p>
                </div>
                
                <div style="text-align: center; padding: 20px;">
                    <div style="width: 60px; height: 60px; background: linear-gradient(135deg, #2d5a87, #1e3a5f); 
                                border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                                margin: 0 auto 20px; color: white; font-size: 28px;">🏆</div>
                    <h3 style="color: #1e3a5f; margin-bottom: 10px;">Recognized Certificates</h3>
                    <p style="color: #666; line-height: 1.6;">Earn credentials that matter. Showcase your expertise to employers and clients.</p>
                </div>
                
                <div style="text-align: center; padding: 20px;">
                    <div style="width: 60px; height: 60px; background: linear-gradient(135deg, #c9a227, #d4af37); 
                                border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                                margin: 0 auto 20px; color: white; font-size: 28px;">👥</div>
                    <h3 style="color: #1e3a5f; margin-bottom: 10px;">Global Community</h3>
                    <p style="color: #666; line-height: 1.6;">Connect with 50,000+ professionals worldwide. Network and grow together.</p>
                </div>
                
            </div>
        </div>
    </div>
    
    <%-- CERTIFICATIONS SECTION (Your existing, enhanced) --%>
    <div id="certifications" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); 
                                    padding: 80px 20px; border-top: 1px solid #dee2e6;">
        <div style="max-width: 1200px; margin: 0 auto;">
            <div style="text-align: center; margin-bottom: 50px;">
                <h2 style="color: #1e3a5f; margin-bottom: 15px; font-size: 36px;">Professional Certifications</h2>
                <p style="color: #666; max-width: 600px; margin: 0 auto; line-height: 1.7; font-size: 17px;">
                    Earn recognized credentials in business essentials. Complete all modules to earn your 
                    certificate and demonstrate your expertise to employers.
                </p>
            </div>
            
            <div style="display: flex; gap: 30px; justify-content: center; flex-wrap: wrap;">
                
                <%-- Cert 1: Leadership --%>
                <div style="background: white; padding: 40px 30px; border-radius: 12px; 
                            box-shadow: 0 10px 40px rgba(0,0,0,0.08); text-align: center; width: 320px;
                            border: 2px solid transparent; transition: all 0.3s;"
                     onmouseover="this.style.borderColor='#c9a227'; this.style.transform='translateY(-10px)';"
                     onmouseout="this.style.borderColor='transparent'; this.style.transform='translateY(0)';">
                    <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #2d5a87, #1e3a5f); 
                                border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                                margin: 0 auto 20px; font-size: 36px;">🏆</div>
                    <h3 style="color: #1e3a5f; margin-bottom: 12px; font-size: 24px;">Leadership Certificate</h3>
                    <p style="color: #666; font-size: 15px; margin-bottom: 25px; line-height: 1.6;">
                        Master team management, strategic decision making, and organizational leadership
                    </p>
                    
                    <div style="border-top: 1px solid #eee; padding-top: 20px; margin-bottom: 20px;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14px;">
                            <span style="color: #666;">Duration:</span>
                            <span style="color: #1e3a5f; font-weight: 600;">8 weeks</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; font-size: 14px;">
                            <span style="color: #666;">Modules:</span>
                            <span style="color: #1e3a5f; font-weight: 600;">4 courses</span>
                        </div>
                    </div>
                    
                    <% if (Session["UserID"] != null) { %>
                        <a href="Modules.aspx?cat=Leadership" style="background-color: #2d5a87; color: white; 
                            padding: 14px 30px; text-decoration: none; border-radius: 6px; display: inline-block;
                            font-weight: 600; width: 100%; transition: background-color 0.3s;"
                         onmouseover="this.style.backgroundColor='#1e3a5f';"
                         onmouseout="this.style.backgroundColor='#2d5a87';">
                            Continue Learning
                        </a>
                    <% } else { %>
                        <div style="margin-bottom: 15px;">
                            <span style="color: #999; font-size: 13px; display: block; margin-bottom: 10px;">
                                🔒 Login to track progress
                            </span>
                        </div>
                        <a href="Register.aspx" style="background-color: #c9a227; color: #1e3a5f; 
                            padding: 14px 30px; text-decoration: none; border-radius: 6px; display: inline-block;
                            font-weight: 600; width: 100%;">
                            Get Started Free
                        </a>
                    <% } %>
                </div>
                
                <%-- Cert 2: Finance --%>
                <div style="background: white; padding: 40px 30px; border-radius: 12px; 
                            box-shadow: 0 10px 40px rgba(0,0,0,0.08); text-align: center; width: 320px;
                            border: 2px solid transparent; transition: all 0.3s;"
                     onmouseover="this.style.borderColor='#c9a227'; this.style.transform='translateY(-10px)';"
                     onmouseout="this.style.borderColor='transparent'; this.style.transform='translateY(0)';">
                    <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #1e3a5f, #2d5a87); 
                                border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                                margin: 0 auto 20px; font-size: 36px;">📈</div>
                    <h3 style="color: #1e3a5f; margin-bottom: 12px; font-size: 24px;">Finance Certificate</h3>
                    <p style="color: #666; font-size: 15px; margin-bottom: 25px; line-height: 1.6;">
                        Financial literacy for strategic business decisions and investment analysis
                    </p>
                    
                    <div style="border-top: 1px solid #eee; padding-top: 20px; margin-bottom: 20px;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14px;">
                            <span style="color: #666;">Duration:</span>
                            <span style="color: #1e3a5f; font-weight: 600;">8 weeks</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; font-size: 14px;">
                            <span style="color: #666;">Modules:</span>
                            <span style="color: #1e3a5f; font-weight: 600;">4 courses</span>
                        </div>
                    </div>
                    
                    <% if (Session["UserID"] != null) { %>
                        <a href="Modules.aspx?cat=Finance" style="background-color: #2d5a87; color: white; 
                            padding: 14px 30px; text-decoration: none; border-radius: 6px; display: inline-block;
                            font-weight: 600; width: 100%;">
                            Continue Learning
                        </a>
                    <% } else { %>
                        <div style="margin-bottom: 15px;">
                            <span style="color: #999; font-size: 13px; display: block; margin-bottom: 10px;">
                                🔒 Login to track progress
                            </span>
                        </div>
                        <a href="Register.aspx" style="background-color: #c9a227; color: #1e3a5f; 
                            padding: 14px 30px; text-decoration: none; border-radius: 6px; display: inline-block;
                            font-weight: 600; width: 100%;">
                            Get Started Free
                        </a>
                    <% } %>
                </div>
                
                <%-- Cert 3: Communication --%>
                <div style="background: white; padding: 40px 30px; border-radius: 12px; 
                            box-shadow: 0 10px 40px rgba(0,0,0,0.08); text-align: center; width: 320px;
                            border: 2px solid transparent; transition: all 0.3s;"
                     onmouseover="this.style.borderColor='#c9a227'; this.style.transform='translateY(-10px)';"
                     onmouseout="this.style.borderColor='transparent'; this.style.transform='translateY(0)';">
                    <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #c9a227, #d4af37); 
                                border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                                margin: 0 auto 20px; font-size: 36px;">💬</div>
                    <h3 style="color: #1e3a5f; margin-bottom: 12px; font-size: 24px;">Communication Certificate</h3>
                    <p style="color: #666; font-size: 15px; margin-bottom: 25px; line-height: 1.6;">
                        Executive presence, persuasive communication, and stakeholder management
                    </p>
                    
                    <div style="border-top: 1px solid #eee; padding-top: 20px; margin-bottom: 20px;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 14px;">
                            <span style="color: #666;">Duration:</span>
                            <span style="color: #1e3a5f; font-weight: 600;">6 weeks</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; font-size: 14px;">
                            <span style="color: #666;">Modules:</span>
                            <span style="color: #1e3a5f; font-weight: 600;">4 courses</span>
                        </div>
                    </div>
                    
                    <% if (Session["UserID"] != null) { %>
                        <a href="Modules.aspx?cat=Communication" style="background-color: #2d5a87; color: white; 
                            padding: 14px 30px; text-decoration: none; border-radius: 6px; display: inline-block;
                            font-weight: 600; width: 100%;">
                            Continue Learning
                        </a>
                    <% } else { %>
                        <div style="margin-bottom: 15px;">
                            <span style="color: #999; font-size: 13px; display: block; margin-bottom: 10px;">
                                🔒 Login to track progress
                            </span>
                        </div>
                        <a href="Register.aspx" style="background-color: #c9a227; color: #1e3a5f; 
                            padding: 14px 30px; text-decoration: none; border-radius: 6px; display: inline-block;
                            font-weight: 600; width: 100%;">
                            Get Started Free
                        </a>
                    <% } %>
                </div>
                
            </div>
        </div>
    </div>
    
    <%-- TESTIMONIAL SECTION (Add social proof) --%>
    <div style="background: #1e3a5f; color: white; padding: 80px 20px;">
        <div style="max-width: 1000px; margin: 0 auto; text-align: center;">
            <div style="font-size: 60px; margin-bottom: 20px; opacity: 0.3;">"</div>
            <p style="font-size: 28px; line-height: 1.5; margin-bottom: 30px; font-style: italic;">
                SkillForge transformed my approach to leadership. The strategic frameworks I learned 
                helped me secure a promotion to VP within 6 months of completing the certificate.
            </p>
            <div style="display: flex; align-items: center; justify-content: center; gap: 15px;">
                <div style="width: 60px; height: 60px; background: #c9a227; border-radius: 50%; 
                            display: flex; align-items: center; justify-content: center; font-weight: bold; font-size: 24px;">
                    JD
                </div>
                <div style="text-align: left;">
                    <div style="font-weight: bold; font-size: 18px;">James Davidson</div>
                    <div style="opacity: 0.8; font-size: 14px;">VP of Operations, TechCorp Inc.</div>
                </div>
            </div>
        </div>
    </div>
    
    <%-- CTA SECTION --%>
    <div style="background: white; padding: 60px 20px; text-align: center;">
        <h2 style="color: #1e3a5f; margin-bottom: 15px; font-size: 32px;">Ready to Advance Your Career?</h2>
        <p style="color: #666; margin-bottom: 30px; font-size: 18px;">
            Join 50,000+ professionals who are transforming their careers with SkillForge
        </p>
        <% if (Session["UserID"] == null) { %>
            <a href="Register.aspx" style="background-color: #c9a227; color: #1e3a5f; 
                padding: 18px 40px; text-decoration: none; border-radius: 6px; display: inline-block;
                font-weight: bold; font-size: 18px; margin-right: 15px;">
                Create Free Account
            </a>
            <a href="Modules.aspx" style="color: #2d5a87; text-decoration: none; 
                padding: 18px 40px; border: 2px solid #2d5a87; border-radius: 6px; display: inline-block;
                font-weight: 600; font-size: 18px;">
                Browse Courses
            </a>
        <% } else { %>
            <a href="Profile.aspx" style="background-color: #2d5a87; color: white; 
                padding: 18px 40px; text-decoration: none; border-radius: 6px; display: inline-block;
                font-weight: bold; font-size: 18px;">
                Continue Your Journey
            </a>
        <% } %>
    </div>
    
</asp:Content>
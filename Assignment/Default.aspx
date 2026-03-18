<%@ Page Title="SkillForge - Business Education" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HERO SECTION -->
    <div style="background: linear-gradient(135deg, #000000 0%, #1a1a1a 100%);
    color: #ffffff; padding: 100px 0 80px; border-bottom: 4px solid #a51c30;">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <!-- Badge -->
                    <div style="display: inline-block; border: 2px solid #a51c30;
                    color: #a51c30; padding: 8px 20px; font-size: 0.75rem;
                    font-weight: 700; text-transform: uppercase;
                    letter-spacing: 2px; margin-bottom: 30px;">
                        Featured Insight • January 2026
                    </div>
                    
                    <!-- Title -->
                    <h1 style="font-family: Georgia, serif; font-size: 4rem;
                    font-weight: 400; line-height: 1.1; margin-bottom: 30px;
                    color: #ffffff;">
                        The Future of Leadership<br/>
                        <span style="color: #a51c30;">in a Digital Age</span>
                    </h1>
                    
                    <!-- Subtitle -->
                    <p style="font-size: 1.25rem; color: #b0b0b0; max-width: 600px;
                    line-height: 1.7; margin-bottom: 40px;">
                        How top executives are adapting to AI-driven decision making and
                        remote team management. Master the essential skills that separate
                        successful leaders from the rest.
                    </p>
                    
                    <!-- BUTTONS -->
                    <div style="margin-bottom: 60px; display: flex; gap: 20px;">
                        <a href="Article.aspx?id=1"
                        style="display: inline-flex; align-items: center; gap: 10px; 
                        background-color: #a51c30; color: #ffffff; padding: 18px 40px; 
                        font-size: 0.875rem; font-weight: 700; text-transform: uppercase;
                        letter-spacing: 1.5px; text-decoration: none; border: 2px solid #a51c30;
                        transition: all 0.3s ease; border-radius: 4px;"
                        onmouseover="this.style.backgroundColor='transparent'; this.style.color='#a51c30';"
                        onmouseout="this.style.backgroundColor='#a51c30'; this.style.color='#ffffff';">
                            <span>📖</span> Read Full Article
                        </a>
                        
                        <a href="#certifications"
                        style="display: inline-flex; align-items: center; gap: 10px;
                        background-color: transparent; color: #ffffff; padding: 18px 40px; 
                        font-size: 0.875rem; font-weight: 700; text-transform: uppercase;
                        letter-spacing: 1.5px; text-decoration: none; border: 2px solid #a51c30;
                        transition: all 0.3s ease; border-radius: 4px;"
                        onmouseover="this.style.backgroundColor='#a51c30'; this.style.color='#ffffff';"
                        onmouseout="this.style.backgroundColor='transparent'; this.style.color='#ffffff';">
                            <span>🏆</span> View Certifications
                        </a>
                    </div>
                    
                    <!-- Stats -->
                    <div style="display: flex; gap: 80px; padding-top: 40px; border-top: 1px solid #333;">
                        <div>
                            <div style="font-family: Georgia, serif; font-size: 3.5rem;
                            color: #d4af37; font-weight: 400; line-height: 1;">
                                50K+
                            </div>
                            <div style="font-size: 0.8rem; color: #888; text-transform: uppercase;
                            letter-spacing: 2px; margin-top: 8px;">
                                Active Learners
                            </div>
                        </div>
                        <div>
                            <div style="font-family: Georgia, serif; font-size: 3.5rem;
                            color: #d4af37; font-weight: 400; line-height: 1;">
                                120+
                            </div>
                            <div style="font-size: 0.8rem; color: #888; text-transform: uppercase;
                            letter-spacing: 2px; margin-top: 8px;">
                                Business Modules
                            </div>
                        </div>
                        <div>
                            <div style="font-family: Georgia, serif; font-size: 3.5rem;
                            color: #d4af37; font-weight: 400; line-height: 1;">
                                95%
                            </div>
                            <div style="font-size: 0.8rem; color: #888; text-transform: uppercase;
                            letter-spacing: 2px; margin-top: 8px;">
                                Completion Rate
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Decorative -->
                <div class="col-md-4 hidden-sm hidden-xs"
                style="display: flex; align-items: center; justify-content: center;">
                    <div style="width: 350px; height: 350px;
                    background: radial-gradient(circle, rgba(165,28,48,0.2) 0%, transparent 60%);
                    border-radius: 50%; display: flex; align-items: center;
                    justify-content: center; font-size: 10rem; opacity: 0.4;">
                        💼
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- TRUSTED BY -->
    <div style="background-color: #111; padding: 50px 0; text-align: center;
    border-bottom: 1px solid #222;">
        <div class="container">
            <p style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 3px;
            color: #555; margin-bottom: 30px;">
                Trusted by professionals from leading organizations
            </p>
            <div style="display: flex; justify-content: center; align-items: center;
            gap: 80px; flex-wrap: wrap;">
                <span style="font-size: 1.5rem; color: #666; font-weight: 600; opacity: 0.7;">McKinsey</span>
                <span style="font-size: 1.5rem; color: #666; font-weight: 600; opacity: 0.7;">Deloitte</span>
                <span style="font-size: 1.5rem; color: #666; font-weight: 600; opacity: 0.7;">Goldman Sachs</span>
                <span style="font-size: 1.5rem; color: #666; font-weight: 600; opacity: 0.7;">Microsoft</span>
                <span style="font-size: 1.5rem; color: #666; font-weight: 600; opacity: 0.7;">BCG</span>
            </div>
        </div>
    </div>
    
    <!-- LATEST INSIGHTS -->
    <div style="background-color: #1a1a1a; padding: 100px 0;">
        <div class="container">
            <h2 style="font-family: Georgia, serif; font-size: 3rem; color: #ffffff;
            text-align: center; margin-bottom: 20px;">
                Latest Business Insights
            </h2>
            <p style="color: #888; text-align: center; margin-bottom: 60px; font-size: 1.1rem;">
                Expert analysis and practical strategies from industry leaders
            </p>
            <div class="row">
                <!-- Card 1 - Leadership -->
                <div class="col-md-4" style="margin-bottom: 30px;">
                    <a href="Article.aspx?id=1" style="text-decoration: none !important; display: block;">
                        <div style="background: linear-gradient(145deg, #252525, #1e1e1e);
                        border: 1px solid #333; padding: 40px; height: 100%;
                        transition: all 0.3s ease; cursor: pointer; border-radius: 8px;"
                        onmouseover="this.style.borderColor='#a51c30'; this.style.transform='translateY(-8px)'; this.style.boxShadow='0 20px 40px rgba(0,0,0,0.4)';"
                        onmouseout="this.style.borderColor='#333'; this.style.transform='translateY(0)'; this.style.boxShadow='none';">
                            <div style="font-size: 0.8rem; text-transform: uppercase;
                            letter-spacing: 3px; color: #a51c30;
                            margin-bottom: 20px; font-weight: 700;">
                                Leadership
                            </div>
                            <h3 style="font-family: Georgia, serif; font-size: 1.75rem;
                            color: #ffffff; margin-bottom: 20px; line-height: 1.3;">
                                Strategic Decision Making
                            </h3>
                            <p style="color: #999; line-height: 1.7; font-size: 1rem; margin-bottom: 30px;">
                                Learn frameworks used by Fortune 500 CEOs to navigate volatile markets and make critical decisions with incomplete information.
                            </p>
                            <div style="color: #a51c30; font-weight: 600; font-size: 0.9rem;
                            text-transform: uppercase; letter-spacing: 1px;">
                                Read Article →
                            </div>
                        </div>
                    </a>
                </div>
                
                <!-- Card 2 - Finance -->
                <div class="col-md-4" style="margin-bottom: 30px;">
                    <a href="Article.aspx?id=2" style="text-decoration: none !important; display: block;">
                        <div style="background: linear-gradient(145deg, #252525, #1e1e1e);
                        border: 1px solid #333; padding: 40px; height: 100%;
                        transition: all 0.3s ease; cursor: pointer; border-radius: 8px;"
                        onmouseover="this.style.borderColor='#a51c30'; this.style.transform='translateY(-8px)'; this.style.boxShadow='0 20px 40px rgba(0,0,0,0.4)';"
                        onmouseout="this.style.borderColor='#333'; this.style.transform='translateY(0)'; this.style.boxShadow='none';">
                            <div style="font-size: 0.8rem; text-transform: uppercase;
                            letter-spacing: 3px; color: #a51c30;
                            margin-bottom: 20px; font-weight: 700;">
                                Finance
                            </div>
                            <h3 style="font-family: Georgia, serif; font-size: 1.75rem;
                            color: #ffffff; margin-bottom: 20px; line-height: 1.3;">
                                Financial Acumen
                            </h3>
                            <p style="color: #999; line-height: 1.7; font-size: 1rem; margin-bottom: 30px;">
                                Essential financial concepts every business leader needs to understand for strategic decision making and capital allocation.
                            </p>
                            <div style="color: #a51c30; font-weight: 600; font-size: 0.9rem;
                            text-transform: uppercase; letter-spacing: 1px;">
                                Read Article →
                            </div>
                        </div>
                    </a>
                </div>
                
                <!-- Card 3 - Communication -->
                <div class="col-md-4" style="margin-bottom: 30px;">
                    <a href="Article.aspx?id=3" style="text-decoration: none !important; display: block;">
                        <div style="background: linear-gradient(145deg, #252525, #1e1e1e);
                        border: 1px solid #333; padding: 40px; height: 100%;
                        transition: all 0.3s ease; cursor: pointer; border-radius: 8px;"
                        onmouseover="this.style.borderColor='#a51c30'; this.style.transform='translateY(-8px)'; this.style.boxShadow='0 20px 40px rgba(0,0,0,0.4)';"
                        onmouseout="this.style.borderColor='#333'; this.style.transform='translateY(0)'; this.style.boxShadow='none';">
                            <div style="font-size: 0.8rem; text-transform: uppercase;
                            letter-spacing: 3px; color: #a51c30;
                            margin-bottom: 20px; font-weight: 700;">
                                Communication
                            </div>
                            <h3 style="font-family: Georgia, serif; font-size: 1.75rem;
                            color: #ffffff; margin-bottom: 20px; line-height: 1.3;">
                                Executive Communication
                            </h3>
                            <p style="color: #999; line-height: 1.7; font-size: 1rem; margin-bottom: 30px;">
                                Master the art of persuasion, negotiation, and presentation at the executive level with proven frameworks.
                            </p>
                            <div style="color: #a51c30; font-weight: 600; font-size: 0.9rem;
                            text-transform: uppercase; letter-spacing: 1px;">
                                Read Article →
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- CERTIFICATIONS SECTION -->
    <div id="certifications" style="background: #000000; padding: 100px 0; border-top: 1px solid #222;">
        <div class="container">
            <div style="text-align: center; margin-bottom: 60px;">
                <h2 style="font-family: Georgia, serif; font-size: 3rem; color: #ffffff; margin-bottom: 20px;">
                    Professional Certifications
                </h2>
                <p style="color: #888; max-width: 600px; margin: 0 auto; font-size: 1.1rem; line-height: 1.7;">
                    Earn recognized credentials in business essentials. Complete all modules to earn your certificate and demonstrate your expertise.
                </p>
            </div>
            
            <div class="row" style="display: flex; align-items: stretch;">
                <!-- Leadership Cert -->
                <div class="col-md-4" style="margin-bottom: 30px; display: flex;">
                    <div style="background: #1a1a1a; border: 2px solid #a51c30; 
                    padding: 50px 40px; text-align: center; transition: all 0.3s; 
                    flex: 1; display: flex; flex-direction: column; justify-content: space-between; border-radius: 8px;"
                    onmouseover="this.style.background='#a51c30'; this.style.transform='translateY(-10px)';"
                    onmouseout="this.style.background='#1a1a1a'; this.style.transform='translateY(0)';">
                        <div>
                            <div style="font-size: 4rem; margin-bottom: 20px;">🏆</div>
                            <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #ffffff; margin-bottom: 15px;">
                                Leadership Certificate
                            </h3>
                            <p style="color: #aaa; margin-bottom: 30px; line-height: 1.6;">
                                Master team management, strategic decision making, and organizational leadership.
                            </p>
                        </div>
                        <% if (Session["UserID"] != null) { %>
                            <a href="Modules.aspx?cat=Leadership" 
                            style="display: inline-block; background: transparent; color: #fff; border: 2px solid #fff;
                            padding: 12px 30px; font-weight: 600; text-transform: uppercase; text-decoration: none;
                            transition: all 0.3s; border-radius: 4px;"
                            onmouseover="this.style.background='#fff'; this.style.color='#a51c30';"
                            onmouseout="this.style.background='transparent'; this.style.color='#fff';">
                                Continue Learning
                            </a>
                        <% } else { %>
                            <a href="Register.aspx" 
                            style="display: inline-block; background: #ffffff; color: #a51c30; border: 2px solid #ffffff;
                            padding: 12px 30px; font-weight: 600; text-transform: uppercase; text-decoration: none;
                            transition: all 0.3s; border-radius: 4px;"
                            onmouseover="this.style.background='transparent'; this.style.color='#ffffff';"
                            onmouseout="this.style.background='#ffffff'; this.style.color='#a51c30';">
                                Get Started Free
                            </a>
                        <% } %>
                    </div>
                </div>
                
                <!-- Finance Cert -->
                <div class="col-md-4" style="margin-bottom: 30px; display: flex;">
                    <div style="background: #1a1a1a; border: 2px solid #a51c30; 
                    padding: 50px 40px; text-align: center; transition: all 0.3s;
                    flex: 1; display: flex; flex-direction: column; justify-content: space-between; border-radius: 8px;"
                    onmouseover="this.style.background='#a51c30'; this.style.transform='translateY(-10px)';"
                    onmouseout="this.style.background='#1a1a1a'; this.style.transform='translateY(0)';">
                        <div>
                            <div style="font-size: 4rem; margin-bottom: 20px;">📈</div>
                            <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #ffffff; margin-bottom: 15px;">
                                Finance Certificate
                            </h3>
                            <p style="color: #aaa; margin-bottom: 30px; line-height: 1.6;">
                                Financial literacy for strategic business decisions and investment analysis.
                            </p>
                        </div>
                        <% if (Session["UserID"] != null) { %>
                            <a href="Modules.aspx?cat=Finance" 
                            style="display: inline-block; background: transparent; color: #fff; border: 2px solid #fff;
                            padding: 12px 30px; font-weight: 600; text-transform: uppercase; text-decoration: none;
                            transition: all 0.3s; border-radius: 4px;"
                            onmouseover="this.style.background='#fff'; this.style.color='#a51c30';"
                            onmouseout="this.style.background='transparent'; this.style.color='#fff';">
                                Continue Learning
                            </a>
                        <% } else { %>
                            <a href="Register.aspx" 
                            style="display: inline-block; background: #ffffff; color: #a51c30; border: 2px solid #ffffff;
                            padding: 12px 30px; font-weight: 600; text-transform: uppercase; text-decoration: none;
                            transition: all 0.3s; border-radius: 4px;"
                            onmouseover="this.style.background='transparent'; this.style.color='#ffffff';"
                            onmouseout="this.style.background='#ffffff'; this.style.color='#a51c30';">
                                Get Started Free
                            </a>
                        <% } %>
                    </div>
                </div>
                
                <!-- Communication Cert -->
                <div class="col-md-4" style="margin-bottom: 30px; display: flex;">
                    <div style="background: #1a1a1a; border: 2px solid #a51c30; 
                    padding: 50px 40px; text-align: center; transition: all 0.3s;
                    flex: 1; display: flex; flex-direction: column; justify-content: space-between; border-radius: 8px;"
                    onmouseover="this.style.background='#a51c30'; this.style.transform='translateY(-10px)';"
                    onmouseout="this.style.background='#1a1a1a'; this.style.transform='translateY(0)';">
                        <div>
                            <div style="font-size: 4rem; margin-bottom: 20px;">💬</div>
                            <h3 style="font-family: Georgia, serif; font-size: 1.75rem; color: #ffffff; margin-bottom: 15px;">
                                Communication Certificate
                            </h3>
                            <p style="color: #aaa; margin-bottom: 30px; line-height: 1.6;">
                                Executive presence, persuasive communication, and stakeholder management.
                            </p>
                        </div>
                        <% if (Session["UserID"] != null) { %>
                            <a href="Modules.aspx?cat=Communication" 
                            style="display: inline-block; background: transparent; color: #fff; border: 2px solid #fff;
                            padding: 12px 30px; font-weight: 600; text-transform: uppercase; text-decoration: none;
                            transition: all 0.3s; border-radius: 4px;"
                            onmouseover="this.style.background='#fff'; this.style.color='#a51c30';"
                            onmouseout="this.style.background='transparent'; this.style.color='#fff';">
                                Continue Learning
                            </a>
                        <% } else { %>
                            <a href="Register.aspx" 
                            style="display: inline-block; background: #ffffff; color: #a51c30; border: 2px solid #ffffff;
                            padding: 12px 30px; font-weight: 600; text-transform: uppercase; text-decoration: none;
                            transition: all 0.3s; border-radius: 4px;"
                            onmouseover="this.style.background='transparent'; this.style.color='#ffffff';"
                            onmouseout="this.style.background='#ffffff'; this.style.color='#a51c30';">
                                Get Started Free
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <!-- CHATBOT - Only shows when user is NOT logged in -->
    <% if (Session["UserID"] == null) { %>

    <!-- Chat Button -->
    <div id="chatButton" onclick="toggleChat()" 
         style="position:fixed; bottom:20px; right:20px; background:#a51c30; color:white; width:60px; height:60px; border-radius:50%; display:flex; align-items:center; justify-content:center; cursor:pointer; font-size:24px; box-shadow:0 4px 15px rgba(165,28,48,0.3); z-index:1000;">
        💬
    </div>

    <!-- Chat Box -->
    <div id="chatBox" style="display:none; position:fixed; bottom:90px; right:20px; width:320px; background:#2d2d2d; border-radius:12px; padding:20px; box-shadow:0 10px 30px rgba(0,0,0,0.3); border:1px solid #444; z-index:1000;">
        
        <div style="display:flex; align-items:center; gap:10px; margin-bottom:15px; padding-bottom:10px; border-bottom:1px solid #444;">
            <div style="width:40px; height:40px; background:#a51c30; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:20px;">
                🤖
            </div>
            <div>
                <div style="font-weight:bold; color:#fff;">SkillForge Assistant</div>
                <div style="font-size:12px; color:#888;">Online • Ask me anything!</div>
            </div>
            <div onclick="toggleChat()" style="margin-left:auto; cursor:pointer; color:#888; font-size:20px;">&times;</div>
        </div>

        <div id="chatMessages" style="height:250px; overflow-y:auto; background:#1a1a1a; padding:15px; border-radius:8px; margin-bottom:15px; color:#fff; font-size:14px;">
            <div style="margin-bottom:10px;">
                <span style="background:#a51c30; padding:5px 10px; border-radius:15px; display:inline-block;">👋 Hi! How can I help you today?</span>
            </div>
        </div>

        <div style="display:flex; gap:10px;">
            <input type="text" id="userInput" placeholder="Type your message..." 
                   style="flex:1; padding:12px; background:#1a1a1a; border:1px solid #444; border-radius:8px; color:#fff; font-size:14px;"
                   onkeypress="if(event.keyCode==13) sendMessage()" />
            <button onclick="sendMessage()" 
                    style="padding:12px 20px; background:#a51c30; color:#fff; border:none; border-radius:8px; cursor:pointer; font-weight:600;">
                Send
            </button>
        </div>
    </div>

    <script>
    function toggleChat() {
        let box = document.getElementById("chatBox");
        let btn = document.getElementById("chatButton");
        if (box.style.display === "none" || box.style.display === "") {
            box.style.display = "block";
            btn.style.display = "none";
        } else {
            box.style.display = "none";
            btn.style.display = "flex";
        }
    }

    function sendMessage() {
        let input = document.getElementById("userInput");
        let message = input.value.trim();
        let chat = document.getElementById("chatMessages");

        if (message === "") return;

        // Add user message
        chat.innerHTML += `<div style="margin:10px 0; text-align:right;"><span style="background:#a51c30; padding:8px 15px; border-radius:18px; display:inline-block; max-width:80%;">${message}</span></div>`;

        // Get bot reply
        let reply = getBotReply(message.toLowerCase());

        // Add bot reply with delay
        setTimeout(() => {
            chat.innerHTML += `<div style="margin:10px 0;"><span style="background:#1e1e1e; padding:8px 15px; border-radius:18px; display:inline-block; max-width:80%;">${reply}</span></div>`;
            chat.scrollTop = chat.scrollHeight;
        }, 500);

        input.value = "";
        chat.scrollTop = chat.scrollHeight;
    }

    function getBotReply(msg) {
        if (msg.includes("course") || msg.includes("learn")) {
            return "We offer courses in Leadership, Finance, and Communication! Browse our modules to get started.";
        }
        if (msg.includes("register") || msg.includes("sign up")) {
            return "Click the 'Register' button in the top right to create your free account!";
        }
        if (msg.includes("certificate")) {
            return "Complete a module and pass the quiz (score 50%+) to earn your certificate!";
        }
        if (msg.includes("hello") || msg.includes("hi")) {
            return "Hello! 👋 How can I assist you with SkillForge today?";
        }
        if (msg.includes("price") || msg.includes("cost") || msg.includes("free")) {
            return "SkillForge is completely free! Start learning today.";
        }
        if (msg.includes("login") || msg.includes("sign in")) {
            return "Use the login form in the navigation bar to access your account.";
        }
        return "I'm here to help! You can ask me about courses, registration, certificates, or anything about SkillForge!";
    }
    </script>

    <% } %>

</asp:Content>
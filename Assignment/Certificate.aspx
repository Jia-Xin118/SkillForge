<%@ Page Title="Your Certificate - SkillForge" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="Assignment.Certificate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        /* Certificate Container */
        .cert-page {
            min-height: calc(100vh - 200px);
            padding: 3rem 1rem;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            position: relative;
            overflow: hidden;
        }
        
        .cert-page::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(201, 162, 39, 0.03) 0%, transparent 70%);
            pointer-events: none;
        }
        
        /* Main Certificate Card */
        .cert-card {
            position: relative;
            max-width: 900px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 16px;
            padding: 4rem 3rem;
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.4), 
                        0 0 0 1px rgba(201, 162, 39, 0.1);
            overflow: hidden;
        }
        
        /* Elegant Border Corners */
        .corner {
            position: absolute;
            width: 80px;
            height: 80px;
            border-color: #c9a227;
            border-style: solid;
            pointer-events: none;
        }
        .corner-tl { top: 30px; left: 30px; border-width: 4px 0 0 4px; }
        .corner-tr { top: 30px; right: 30px; border-width: 4px 4px 0 0; }
        .corner-bl { bottom: 30px; left: 30px; border-width: 0 0 4px 4px; }
        .corner-br { bottom: 30px; right: 30px; border-width: 0 4px 4px 0; }
        
        /* Certificate Content */
        .cert-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .cert-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            background: linear-gradient(135deg, #c9a227 0%, #d4af37 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            box-shadow: 0 8px 32px rgba(201, 162, 39, 0.3);
        }
        
        .cert-title {
            font-size: 2.25rem;
            font-weight: 700;
            color: #1e3a5f;
            margin: 0 0 0.5rem 0;
            letter-spacing: -0.02em;
        }
        
        .cert-subtitle {
            font-size: 1rem;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.15em;
            margin: 1.5rem 0 0.5rem 0;
        }
        
        /* FIXED - .cert-name with proper syntax */
        .cert-name {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1e293b;
            margin: 0.5rem 0;
            background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
            
            /* Text clipping properties - properly formatted */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            color: transparent;
            
            /* Ensure proper display */
            display: inline-block;
        }
        
        /* FIXED - .cert-module with proper margin shorthand */
        .cert-module {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1e3a5f;
            margin: 0.5rem 0 2rem 0;
            line-height: 1.4;
            padding: 0 2rem;
        }
        
        /* Grade Badge */
        .grade-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 2rem;
            background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
            border: 2px solid #c9a227;
            border-radius: 50px;
            margin: 1rem 0 2rem 0;
            box-shadow: 0 4px 12px rgba(201, 162, 39, 0.15);
        }
        
        .grade-label {
            font-size: 0.875rem;
            color: #92400e;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        .grade-value {
            font-size: 1.25rem;
            color: #78350f;
            font-weight: 700;
        }
        
        /* Certificate Footer Info */
        .cert-footer {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 3rem;
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid #e2e8f0;
        }
        
        .cert-info-item {
            text-align: center;
        }
        
        .cert-info-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: #94a3b8;
            margin-bottom: 0.25rem;
        }
        
        .cert-info-value {
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
            color: #475569;
            font-weight: 600;
        }
        
        /* Official Seal */
        .cert-seal {
            position: absolute;
            bottom: 50px;
            right: 60px;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #c9a227 0%, #d4af37 50%, #b8941f 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 32px rgba(201, 162, 39, 0.4),
                        inset 0 2px 4px rgba(255, 255, 255, 0.3);
            transform: rotate(-12deg);
            border: 3px solid rgba(255, 255, 255, 0.3);
        }
        
        .cert-seal::before {
            content: '';
            position: absolute;
            inset: 8px;
            border: 2px dashed rgba(255, 255, 255, 0.5);
            border-radius: 50%;
        }
        
        .cert-seal span {
            color: white;
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        
        /* Action Buttons */
        .cert-actions {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2.5rem;
            flex-wrap: wrap;
        }
        
        .btn-cert {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.875rem 1.75rem;
            border: none;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none;
        }
        
        .btn-download {
            background: linear-gradient(135deg, #c9a227 0%, #d4af37 100%);
            color: white;
            box-shadow: 0 4px 16px rgba(201, 162, 39, 0.3);
        }
        
        .btn-download:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(201, 162, 39, 0.4);
        }
        
        .btn-linkedin {
            background: #0077b5;
            color: white;
            box-shadow: 0 4px 16px rgba(0, 119, 181, 0.3);
        }
        
        .btn-linkedin:hover {
            background: #005885;
            transform: translateY(-2px);
        }
        
        /* Back Link */
        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 2rem;
            color: #94a3b8;
            text-decoration: none;
            font-size: 0.95rem;
            transition: color 0.2s;
        }
        
        .back-link:hover {
            color: #c9a227;
        }
        
        /* Error Panel */
        .error-card {
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 16px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
        }
        
        .error-icon {
            font-size: 4rem;
            margin-bottom: 1.5rem;
        }
        
        .error-title {
            color: #1e3a5f;
            margin-bottom: 1rem;
            font-size: 1.75rem;
        }
        
        .error-message {
            color: #64748b;
            margin-bottom: 2rem;
            line-height: 1.6;
        }
        
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .animate-in {
            animation: fadeIn 0.6s ease-out;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .cert-card {
                padding: 2.5rem 1.5rem;
                margin: 0 0.5rem;
            }
            
            .cert-title { font-size: 1.75rem; }
            .cert-name { font-size: 1.875rem; }
            .cert-module { font-size: 1.125rem; padding: 0; }
            
            .cert-footer {
                flex-direction: column;
                gap: 1.5rem;
            }
            
            .cert-seal {
                width: 70px;
                height: 70px;
                bottom: 30px;
                right: 30px;
            }
            
            .cert-seal span { font-size: 1.75rem; }
        }
    </style>

    <%-- Success Panel --%>
    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="cert-page">
        <div class="cert-card animate-in">
            <%-- Corner Decorations --%>
            <div class="corner corner-tl"></div>
            <div class="corner corner-tr"></div>
            <div class="corner corner-bl"></div>
            <div class="corner corner-br"></div>
            
            <%-- Header --%>
            <div class="cert-header">
                <div class="cert-icon">🏆</div>
                <h1 class="cert-title">Certificate of Completion</h1>
            </div>
            
            <%-- Main Content --%>
            <div style="text-align: center;">
                <p class="cert-subtitle">This certifies that</p>
                
                <h2 class="cert-name">
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                </h2>
                
                <p class="cert-subtitle">has successfully completed</p>
                
                <h3 class="cert-module">
                    <asp:Label ID="lblCertificateName" runat="server"></asp:Label>
                </h3>
                
                <%-- Grade Badge --%>
                <div class="grade-badge">
                    <span class="grade-label">Grade</span>
                    <span class="grade-value">
                        <asp:Label ID="lblGrade" runat="server"></asp:Label>
                    </span>
                </div>
            </div>
            
            <%-- Footer Info --%>
            <div class="cert-footer">
                <div class="cert-info-item">
                    <div class="cert-info-label">Certificate ID</div>
                    <div class="cert-info-value">
                        <asp:Label ID="lblCertNumber" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="cert-info-item">
                    <div class="cert-info-label">Issue Date</div>
                    <div class="cert-info-value">
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            
            <%-- Official Seal --%>
            <div class="cert-seal">
                <span>✓</span>
            </div>
        </div>
        
        <%-- Actions --%>
        <div class="cert-actions animate-in" style="animation-delay: 0.2s;">
            <asp:Button ID="BtnDownload" runat="server" Text="📄 Download PDF" 
                OnClick="BtnDownload_Click" CssClass="btn-cert btn-download" />
            
            <asp:Button ID="BtnLinkedIn" runat="server" Text="💼 Add to LinkedIn" 
                OnClick="BtnLinkedIn_Click" CssClass="btn-cert btn-linkedin" />
        </div>
        
        <div style="text-align: center;">
            <a href="Modules.aspx" class="back-link">
                ← Browse More Modules
            </a>
        </div>
    </asp:Panel>

    <%-- Error Panel --%>
    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="cert-page">
        <div class="error-card animate-in">
            <div class="error-icon">⚠️</div>
            <h2 class="error-title">Certificate Not Available</h2>
            <p class="error-message">
                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
            </p>
            <a href="Modules.aspx" class="btn-cert btn-download" style="display: inline-flex;">
                Browse Modules
            </a>
        </div>
    </asp:Panel>

</asp:Content>
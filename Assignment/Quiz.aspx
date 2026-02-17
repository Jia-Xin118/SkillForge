<%@ Page Title="Module Quiz - SkillForge" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="Assignment.Quiz" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="max-width: 800px; margin: 40px auto; padding: 0 20px;">
        
        <%-- Header --%>
        <div style="background: linear-gradient(135deg, #1e3a5f 0%, #2d5a87 100%); 
                    color: white; padding: 30px; border-radius: 8px; margin-bottom: 30px;">
            <h1 style="margin: 0;">Final Assessment</h1>
            <p style="margin: 10px 0 0 0; opacity: 0.9;">Score 70% or higher to earn your certificate</p>
        </div>

        <%-- Quiz Form --%>
        <asp:Panel ID="pnlQuiz" runat="server">
            <asp:Repeater ID="rptQuestions" runat="server">
                <ItemTemplate>
                    <div style="background: white; border: 1px solid #e0e0e0; border-radius: 8px; 
                                padding: 25px; margin-bottom: 20px;">
                        <h3 style="color: #1e3a5f; margin: 0 0 15px 0;">
                            <%# Container.ItemIndex + 1 %>. <%# Eval("QuestionText") %>
                        </h3>
                        
                        <div style="display: flex; flex-direction: column; gap: 10px;">
                            <label style="padding: 12px; background: #f5f5f5; border-radius: 4px; cursor: pointer;">
                                <asp:RadioButton ID="rbA" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="A" />
                                <%# Eval("OptionA") %>
                            </label>
                            <label style="padding: 12px; background: #f5f5f5; border-radius: 4px; cursor: pointer;">
                                <asp:RadioButton ID="rbB" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="B" />
                                <%# Eval("OptionB") %>
                            </label>
                            <label style="padding: 12px; background: #f5f5f5; border-radius: 4px; cursor: pointer;">
                                <asp:RadioButton ID="rbC" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="C" />
                                <%# Eval("OptionC") %>
                            </label>
                            <label style="padding: 12px; background: #f5f5f5; border-radius: 4px; cursor: pointer;">
                                <asp:RadioButton ID="rbD" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="D" />
                                <%# Eval("OptionD") %>
                            </label>
                        </div>
                        
                        <asp:HiddenField ID="hdnCorrect" runat="server" Value='<%# Eval("CorrectAnswer") %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Quit / Back button (client-side confirm, returns to module detail) -->
            <a href="ModuleDetail.aspx?id=<%= Request.QueryString["moduleId"] %>"
               onclick="return confirm('Are you sure you want to quit the quiz? Your progress will be lost.');"
               style="display:inline-block; width:100%; padding:16px; margin-bottom:10px;
                      background:#e0e0e0; color:#1e3a5f; text-align:center; text-decoration:none;
                      border-radius:8px; font-size:18px; font-weight:bold;">
                Quit Quiz
            </a>

            <!-- Submit button -->
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Quiz" OnClick="BtnSubmit_Click"
                style="width: 100%; padding: 16px; background-color: #c9a227; color: #1e3a5f; 
                       border: none; border-radius: 8px; font-size: 18px; font-weight: bold; cursor: pointer;" />
        </asp:Panel>

        <%-- Results --%>
        <asp:Panel ID="pnlResults" runat="server" Visible="false" 
            style="background: white; border: 2px solid #c9a227; border-radius: 8px; padding: 40px; text-align: center;">
            
            <div style="font-size: 64px; margin-bottom: 20px;">
                <asp:Label ID="lblIcon" runat="server"></asp:Label>
            </div>
            
            <h2 style="color: #1e3a5f; margin-bottom: 10px;">
                <asp:Label ID="lblResultTitle" runat="server"></asp:Label>
            </h2>
            
            <p style="font-size: 48px; font-weight: bold; color: #c9a227; margin: 20px 0;">
                <asp:Label ID="lblScore" runat="server"></asp:Label>%
            </p>
            
            <asp:Panel ID="pnlPass" runat="server" Visible="false">
                <p style="color: #2d5a87; font-weight: bold; margin-bottom: 20px;">
                    🎉 Congratulations! You've earned a certificate!
                </p>
                <a href="Certificate.aspx?moduleId=<%# Request.QueryString["moduleId"] %>" 
                   style="background-color: #1e3a5f; color: white; padding: 15px 30px; 
                          text-decoration: none; border-radius: 4px; display: inline-block;">
                    Download Certificate
                </a>
            </asp:Panel>
            
            <asp:Panel ID="pnlFail" runat="server" Visible="false">
                <p style="color: #666; margin-bottom: 20px;">
                    You didn't pass this time. Review the module and try again.
                </p>
                <a href="ModuleDetail.aspx?id=<%# Request.QueryString["moduleId"] %>" 
                   style="background-color: #2d5a87; color: white; padding: 15px 30px; 
                          text-decoration: none; border-radius: 4px; display: inline-block;">
                    Review Module
                </a>
            </asp:Panel>

            <%-- Back button for results too --%>
            <div style="margin-top: 30px;">
                <a href="Modules.aspx" 
                   style="color: #2d5a87; text-decoration: none; font-size: 16px;">
                    ← Browse More Modules
                </a>
            </div>
        </asp:Panel>

    </div>
</asp:Content>
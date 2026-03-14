<%@ Page Title="Module Quiz - SkillForge" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="Assignment.Quiz" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 60px 0; min-height: 100vh;">
        <div class="container" style="max-width: 800px;">
            
            <%-- Quiz Panel --%>
            <asp:Panel ID="pnlQuiz" runat="server">
                <%-- Header --%>
                <div style="text-align: center; margin-bottom: 50px;">
                    <div style="display: inline-block; background: rgba(165,28,48,0.2); color: #a51c30; padding: 10px 25px; border-radius: 50px; font-weight: 700; text-transform: uppercase; letter-spacing: 2px; font-size: 0.85rem; margin-bottom: 20px;">
                        Final Assessment
                    </div>
                    <h1 style="font-family: Georgia, serif; font-size: 2.5rem; color: #fff; margin-bottom: 15px;">Test Your Knowledge</h1>
                    <p style="color: #888; font-size: 1.1rem;">Score 70% or higher to earn your certificate</p>
                    
                    <%-- Progress dots --%>
                    <div style="display: flex; justify-content: center; gap: 10px; margin-top: 30px;">
                        <div style="width: 40px; height: 8px; background: #a51c30; border-radius: 4px;"></div>
                        <div style="width: 40px; height: 8px; background: #333; border-radius: 4px;"></div>
                        <div style="width: 40px; height: 8px; background: #333; border-radius: 4px;"></div>
                        <div style="width: 40px; height: 8px; background: #333; border-radius: 4px;"></div>
                    </div>
                </div>

                <%-- Questions --%>
                <asp:Repeater ID="rptQuestions" runat="server">
                    <ItemTemplate>
                        <div style="background: linear-gradient(145deg, #252525, #1e1e1e); border: 1px solid #333; border-radius: 20px; padding: 35px; margin-bottom: 30px;">
                            <div style="display: flex; align-items: flex-start; gap: 20px; margin-bottom: 25px;">
                                <div style="width: 45px; height: 45px; background: linear-gradient(135deg, #a51c30, #7a1524); border-radius: 12px; display: flex; align-items: center; justify-content: center; color: #fff; font-weight: 700; font-size: 1.2rem; flex-shrink: 0;">
                                    <%# Container.ItemIndex + 1 %>
                                </div>
                                <h3 style="color: #fff; font-size: 1.2rem; line-height: 1.5; margin: 0; font-weight: 600;"><%# Eval("QuestionText") %></h3>
                            </div>

                            <div style="display: flex; flex-direction: column; gap: 12px; padding-left: 65px;">
                                <label style="display: flex; align-items: center; gap: 12px; padding: 15px 20px; background: #1a1a1a; border: 2px solid #333; border-radius: 10px; cursor: pointer; transition: all 0.3s;" onmouseover="this.style.borderColor='#a51c30'" onmouseout="this.style.borderColor='#333'">
                                    <asp:RadioButton ID="rbA" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="A" />
                                    <span style="color: #ccc;"><%# Eval("OptionA") %></span>
                                </label>
                                <label style="display: flex; align-items: center; gap: 12px; padding: 15px 20px; background: #1a1a1a; border: 2px solid #333; border-radius: 10px; cursor: pointer; transition: all 0.3s;" onmouseover="this.style.borderColor='#a51c30'" onmouseout="this.style.borderColor='#333'">
                                    <asp:RadioButton ID="rbB" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="B" />
                                    <span style="color: #ccc;"><%# Eval("OptionB") %></span>
                                </label>
                                <label style="display: flex; align-items: center; gap: 12px; padding: 15px 20px; background: #1a1a1a; border: 2px solid #333; border-radius: 10px; cursor: pointer; transition: all 0.3s;" onmouseover="this.style.borderColor='#a51c30'" onmouseout="this.style.borderColor='#333'">
                                    <asp:RadioButton ID="rbC" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="C" />
                                    <span style="color: #ccc;"><%# Eval("OptionC") %></span>
                                </label>
                                <label style="display: flex; align-items: center; gap: 12px; padding: 15px 20px; background: #1a1a1a; border: 2px solid #333; border-radius: 10px; cursor: pointer; transition: all 0.3s;" onmouseover="this.style.borderColor='#a51c30'" onmouseout="this.style.borderColor='#333'">
                                    <asp:RadioButton ID="rbD" runat="server" GroupName='<%# "Q" + Eval("QuestionID") %>' Value="D" />
                                    <span style="color: #ccc;"><%# Eval("OptionD") %></span>
                                </label>
                            </div>
                            <asp:HiddenField ID="hdnCorrect" runat="server" Value='<%# Eval("CorrectAnswer") %>' />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <%-- Actions --%>
                <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 40px;">
                    <a href="ModuleDetail.aspx?id=<%= Request.QueryString["moduleId"] %>" 
                        style="color: #888; text-decoration: none; display: flex; align-items: center; gap: 8px; font-weight: 600;"
                        onclick="return confirm('Are you sure? Your progress will be lost.');">
                        ← Quit Quiz
                    </a>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Quiz →" OnClick="BtnSubmit_Click" 
                        style="padding: 16px 45px; background: linear-gradient(135deg, #a51c30, #7a1524); color: #fff; border: none; border-radius: 10px; font-weight: 700; font-size: 1.1rem; cursor: pointer; text-transform: uppercase; letter-spacing: 1px;" />
                </div>
            </asp:Panel>

            <%-- Results Panel --%>
            <asp:Panel ID="pnlResults" runat="server" Visible="false" style="text-align: center; padding: 60px 40px; background: linear-gradient(145deg, #252525, #1e1e1e); border: 1px solid #333; border-radius: 20px;">
                <div style="font-size: 5rem; margin-bottom: 20px;">
                    <asp:Label ID="lblIcon" runat="server">🏆</asp:Label>
                </div>
                <h2 style="color: #d4af37; margin-bottom: 10px; font-family: Georgia, serif; font-size: 2rem;">
                    <asp:Label ID="lblResultTitle" runat="server">Excellent Work!</asp:Label>
                </h2>
                <div style="font-size: 4rem; font-weight: 700; color: #fff; margin: 30px 0;">
                    <asp:Label ID="lblScore" runat="server">0</asp:Label>%
                </div>

                <asp:Panel ID="pnlPass" runat="server" Visible="false">
                    <p style="color: #4ade80; font-size: 1.2rem; margin-bottom: 30px;">🎉 Congratulations! You've earned a certificate!</p>
                    <a href="Certificate.aspx?moduleId=<%= Request.QueryString["moduleId"] %>" 
                        style="display: inline-block; padding: 16px 40px; background: linear-gradient(135deg, #d4af37, #b8941f); color: #000; border-radius: 10px; text-decoration: none; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;">
                        Download Certificate
                    </a>
                </asp:Panel>

                <asp:Panel ID="pnlFail" runat="server" Visible="false">
                    <p style="color: #f87171; font-size: 1.2rem; margin-bottom: 30px;">Keep learning! Review the module and try again.</p>
                    <a href="ModuleDetail.aspx?id=<%= Request.QueryString["moduleId"] %>" 
                        style="display: inline-block; padding: 16px 40px; background: #333; color: #fff; border-radius: 10px; text-decoration: none; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;">
                        Review Module
                    </a>
                </asp:Panel>

                <div style="margin-top: 40px;">
                    <a href="Modules.aspx" style="color: #888; text-decoration: none;">← Browse More Modules</a>
                </div>
            </asp:Panel>

        </div>
    </div>
</asp:Content>
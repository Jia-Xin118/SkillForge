using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Quiz : System.Web.UI.Page
    {

        private readonly string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";
        int moduleId;
        int userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Session["UserID"] == null || !int.TryParse(Request.QueryString["moduleId"], out moduleId))
            {
                Response.Redirect("Default.aspx");
                return;
            }
            userId = Convert.ToInt32(Session["UserID"]);

            if (!IsPostBack) LoadQuestions();
        }

        private void LoadQuestions()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM QuizQuestions WHERE ModuleID = @ModuleID", conn);
                da.SelectCommand.Parameters.AddWithValue("@ModuleID", moduleId);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptQuestions.DataSource = dt;
                rptQuestions.DataBind();
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            int total = 0, correct = 0;

            foreach (RepeaterItem item in rptQuestions.Items)
            {
                HiddenField hdnCorrect = (HiddenField)item.FindControl("hdnCorrect");
                RadioButton rbA = (RadioButton)item.FindControl("rbA");
                RadioButton rbB = (RadioButton)item.FindControl("rbB");
                RadioButton rbC = (RadioButton)item.FindControl("rbC");
                RadioButton rbD = (RadioButton)item.FindControl("rbD");

                string selected = rbA.Checked ? "A" : rbB.Checked ? "B" : rbC.Checked ? "C" : rbD.Checked ? "D" : "";

                if (selected == hdnCorrect.Value) correct++;
                total++;
            }

            decimal percentage = total > 0 ? (decimal)correct / total * 100 : 0;
            bool passed = percentage >= 70;

            // Save attempt
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO QuizAttempts (UserID, ModuleID, Score, TotalQuestions, Percentage, Passed) VALUES (@UserID, @ModuleID, @Score, @Total, @Percentage, @Passed)", conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@ModuleID", moduleId);
                cmd.Parameters.AddWithValue("@Score", correct);
                cmd.Parameters.AddWithValue("@Total", total);
                cmd.Parameters.AddWithValue("@Percentage", percentage);
                cmd.Parameters.AddWithValue("@Passed", passed);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Show results
            pnlQuiz.Visible = false;
            pnlResults.Visible = true;
            lblScore.Text = percentage.ToString("F0");

            if (passed)
            {
                lblIcon.Text = "🏆";
                lblResultTitle.Text = "Excellent Work!";
                pnlPass.Visible = true;
                GenerateCertificate();
            }
            else
            {
                lblIcon.Text = "📚";
                lblResultTitle.Text = "Keep Learning";
                pnlFail.Visible = true;
            }
        }

        private void GenerateCertificate()
        {
            // Certificate generation logic here (or in Certificate.aspx)
        }
    }
}
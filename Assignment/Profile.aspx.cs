using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Assignment
{
    public partial class Profile : System.Web.UI.Page
    {

        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadUserInfo();
                LoadProgress();
                LoadBadges();
                LoadCompletedModules();
            }
        }

        private void LoadUserInfo()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT FullName, Email, Role FROM Users WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblName.Text = reader["FullName"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                    lblRole.Text = reader["Role"].ToString();
                }
            }
        }

        private void LoadProgress()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Total modules
                string sqlTotal = "SELECT COUNT(*) FROM Modules";
                SqlCommand cmdTotal = new SqlCommand(sqlTotal, conn);
                conn.Open();
                int total = (int)cmdTotal.ExecuteScalar();
                lblTotal.Text = total.ToString();
                conn.Close();

                // Completed modules (XP)
                string sqlCompleted = "SELECT COUNT(*) FROM UserProgress WHERE UserID = @UserID AND IsCompleted = 1";
                SqlCommand cmdCompleted = new SqlCommand(sqlCompleted, conn);
                cmdCompleted.Parameters.AddWithValue("@UserID", Session["UserID"]);
                conn.Open();
                int xp = (int)cmdCompleted.ExecuteScalar();
                lblCompleted.Text = xp.ToString();
                conn.Close();

                // MILESTONE SYSTEM
                int level = xp + 1;
                int nextMilestone = ((xp / 5) + 1) * 5;
                int progressInMilestone = xp % 5;
                int progressPercent = (progressInMilestone * 20);

                // Update progress bar
                var pnlProgress = FindControl("pnlProgress") as System.Web.UI.HtmlControls.HtmlGenericControl;
                if (pnlProgress != null)
                {
                    pnlProgress.Style["width"] = progressPercent + "%";
                    pnlProgress.InnerText = progressPercent + "%";
                }
            }
        }

        private void LoadBadges()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT COUNT(*) FROM UserProgress WHERE UserID = @UserID AND IsCompleted = 1";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                conn.Open();
                int xp = (int)cmd.ExecuteScalar();

                DataTable dt = new DataTable();
                dt.Columns.Add("BadgeName");
                dt.Columns.Add("BadgeIcon");
                dt.Columns.Add("BadgeColor");

                // BADGE SYSTEM - Milestone based
                if (xp >= 15)
                {
                    dt.Rows.Add("Master", "🏆", "#FFD700");      // Gold
                }
                else if (xp >= 10)
                {
                    dt.Rows.Add("Expert", "🥇", "#C0C0C0");      // Silver
                }
                else if (xp >= 5)
                {
                    dt.Rows.Add("Advanced", "🥈", "#CD7F32");    // Bronze
                }
                else if (xp >= 2)
                {
                    dt.Rows.Add("Beginner", "🥉", "#4CAF50");    // Green
                }

                if (dt.Rows.Count > 0)
                {
                    RepeaterBadges.DataSource = dt;
                    RepeaterBadges.DataBind();
                }
                else
                {
                    lblNoBadges.Visible = true;
                }
            }
        }

        private void LoadCompletedModules()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"SELECT m.Title, m.Category, up.CompletionDate 
                    FROM Modules m
                    INNER JOIN UserProgress up ON m.ModuleID = up.ModuleID
                    WHERE up.UserID = @UserID AND up.IsCompleted = 1
                    ORDER BY up.CompletionDate DESC";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridViewCompleted.DataSource = dt;
                    GridViewCompleted.DataBind();
                    GridViewCompleted.Visible = true;
                }
                else
                {
                    lblNoModules.Visible = true;
                }
            }
        }
    }
}
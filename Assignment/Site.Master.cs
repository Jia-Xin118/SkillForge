using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Assignment
{
    public partial class SiteMaster : MasterPage
    {
        private readonly string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] != null)
            {
                LoadCategories();

                if (Session["UserID"] != null)
                {
                    LoadProgress();
                }
            }
        }

        // NAVIGATION LOGIN BUTTON CLICK
        // Rename method to follow PascalCase naming convention
        protected void BtnNavLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT UserID, Role FROM Users WHERE Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Email", txtNavEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtNavPassword.Text);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["UserID"] = reader["UserID"];
                    Session["Role"] = reader["Role"];
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    // Login failed - show error
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "alert('Invalid email or password');", true);
                }
            }
        }

        // Load categories from database
        private void LoadCategories()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT DISTINCT Category FROM Modules ORDER BY Category";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                RepeaterCategories.DataSource = dt;
                RepeaterCategories.DataBind();
            }
        }

        // Load progress bar
        private void LoadProgress()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT COUNT(*) FROM UserProgress WHERE UserID = @UserID AND IsCompleted = 1";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                conn.Open();
                int xp = (int)cmd.ExecuteScalar();

                // Milestone system
                int level = xp + 1;
                int nextMilestone = ((xp / 5) + 1) * 5;
                int progressInMilestone = xp % 5;
                int progressPercent = (progressInMilestone * 20);

                // BADGE SYSTEM (Backend logic)
                string badge = GetBadge(xp);

                // Find controls
                if (FindControl("lblLevel") is System.Web.UI.WebControls.Label lblLevel)
                    lblLevel.Text = level.ToString();

                if (FindControl("progressBarNav") is System.Web.UI.HtmlControls.HtmlGenericControl progressBarNav)
                    progressBarNav.Style["width"] = progressPercent + "%";

                // Show badge in progress text
                if (FindControl("lblProgressText") is System.Web.UI.WebControls.Label lblProgressText)
                    lblProgressText.Text = xp + "/" + nextMilestone + " XP " + badge;
            }
        }

        // BADGE SYSTEM - Backend logic
        private string GetBadge(int xp)
        {
            if (xp >= 15) return "🏆 Master";
            if (xp >= 10) return "🥇 Expert";
            if (xp >= 5) return "🥈 Advanced";
            if (xp >= 2) return "🥉 Beginner";
            return ""; // No badge yet
        }
    }
}

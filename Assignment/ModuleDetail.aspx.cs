using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Assignment
{
    public partial class ModuleDetail : System.Web.UI.Page
    {
       private const string V = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";
        private readonly string connStr = V;
        private int currentModuleID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                currentModuleID = Convert.ToInt32(Request.QueryString["id"]);

                if (!IsPostBack)
                {
                    LoadModule();
                    CheckCompletion();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        private void LoadModule()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Modules WHERE ModuleID = @ID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ID", currentModuleID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTitle.Text = reader["Title"].ToString();
                    lblCategory.Text = reader["Category"].ToString();
                    lblDescription.Text = reader["Description"].ToString();
                    lblContent.Text = reader["ContentText"].ToString().Replace("\n", "<br/><br/>");
                }
            }
        }

        private void CheckCompletion()
        {
            if (Session["UserID"] == null)
            {
                btnComplete.Visible = false;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT IsCompleted FROM UserProgress WHERE UserID = @UserID AND ModuleID = @ModuleID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@ModuleID", currentModuleID);

                conn.Open();
                var result = cmd.ExecuteScalar();

                if (result != null && Convert.ToBoolean(result))
                {
                    btnComplete.Visible = false;
                    lblCompleted.Style["display"] = "block";
                }
            }
        }

        protected void BtnComplete_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                // Show message and redirect to home
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Please login to track your progress');window.location='Default.aspx';", true);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"IF EXISTS (SELECT 1 FROM UserProgress WHERE UserID = @UserID AND ModuleID = @ModuleID)
                    UPDATE UserProgress SET IsCompleted = 1, CompletionDate = GETDATE() 
                    WHERE UserID = @UserID AND ModuleID = @ModuleID
                    ELSE
                    INSERT INTO UserProgress (UserID, ModuleID, IsCompleted, CompletionDate) 
                    VALUES (@UserID, @ModuleID, 1, GETDATE())";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@ModuleID", currentModuleID);

                conn.Open();
                cmd.ExecuteNonQuery();

                btnComplete.Visible = false;
                lblCompleted.Style["display"] = "block";
            }
        }
    }
}
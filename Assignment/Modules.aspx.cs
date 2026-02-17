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
    public partial class Modules : System.Web.UI.Page
    {
        private readonly string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

            // BLOCK GUESTS - Must login first
            if (Session["UserID"] == null)
            {
                Response.Write("<div style='text-align:center; padding:100px; font-family:Arial;'>");
                Response.Write("<h1 style='color:#d32f2f;'>🔒 Access Restricted</h1>");
                Response.Write("<p style='font-size:18px; margin:20px 0;'>You must login or register to view learning modules.</p>");
                Response.Write("<a href='Login.aspx' style='background-color:#1976d2; color:white; padding:12px 30px; text-decoration:none; border-radius:5px; margin:10px; display:inline-block;'>Login</a>");
                Response.Write("<a href='Register.aspx' style='background-color:#388e3c; color:white; padding:12px 30px; text-decoration:none; border-radius:5px; margin:10px; display:inline-block;'>Register</a>");
                Response.Write("</div>");
                Response.End(); // Stop here - don't show the rest of the page
                return;
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["cat"] != null)
                {
                    string category = Request.QueryString["cat"];
                    lblCategory.Text = "Category: " + category;
                    LoadModulesByCategory(category);
                }
                else
                {
                    lblCategory.Text = "All Modules";
                    LoadAllModules();
                }
            }
        }

        private void LoadModulesByCategory(string category)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT ModuleID, Title, Category, Description FROM Modules WHERE Category = @Category ORDER BY Title";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Category", category);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                RepeaterModules.DataSource = dt;
                RepeaterModules.DataBind();
            }
        }

        private void LoadAllModules()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT ModuleID, Title, Category, Description FROM Modules ORDER BY Category, Title";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                RepeaterModules.DataSource = dt;
                RepeaterModules.DataBind();
            }
        }
    }
}
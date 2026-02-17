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
    public partial class Article : System.Web.UI.Page
    {

        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int articleID = Convert.ToInt32(Request.QueryString["id"]);

                if (!IsPostBack)
                {
                    LoadArticle(articleID);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        private void LoadArticle(int articleID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Articles WHERE ArticleID = @ID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ID", articleID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTitle.Text = reader["Title"].ToString();
                    lblCategory.Text = reader["Category"].ToString();
                    lblAuthor.Text = reader["Author"].ToString();
                    lblDate.Text = Convert.ToDateTime(reader["PublishedDate"]).ToString("MMMM dd, yyyy");
                    lblReadTime.Text = reader["ReadTime"].ToString();
                    lblSummary.Text = reader["Summary"].ToString();
                    lblContent.Text = reader["ContentText"].ToString().Replace("\n", "<br/><br/>");
                    lblCertCategory.Text = reader["Category"].ToString();
                }
            }
        }
    }

}
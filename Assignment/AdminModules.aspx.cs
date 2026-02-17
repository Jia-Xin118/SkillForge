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
    public partial class AdminModules : System.Web.UI.Page
    {

        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if admin
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadModules();
            }

        }

        // CREATE
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO Modules (Title, Category, Description, ContentText, CreatedBy) VALUES (@Title, @Category, @Description, @Content, @CreatedBy)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Category", txtCategory.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Content", txtContent.Text);
                cmd.Parameters.AddWithValue("@CreatedBy", Session["UserID"]);

                conn.Open();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Module added successfully!";
                ClearForm();
                LoadModules();
            }
        }

        // READ
        private void LoadModules()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT ModuleID, Title, Category FROM Modules";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewModules.DataSource = dt;
                GridViewModules.DataBind();
            }
        }

        // EDIT (Load data into form)
        protected void GridViewModules_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int moduleID = Convert.ToInt32(GridViewModules.DataKeys[e.NewEditIndex].Value);
            hdnModuleID.Value = moduleID.ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Modules WHERE ModuleID=@ID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ID", moduleID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtTitle.Text = reader["Title"].ToString();
                    txtCategory.Text = reader["Category"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtContent.Text = reader["ContentText"].ToString();
                }
            }

            btnAdd.Visible = false;
            btnUpdate.Visible = true;
        }

        // UPDATE
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "UPDATE Modules SET Title=@Title, Category=@Category, Description=@Description, ContentText=@Content WHERE ModuleID=@ID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Category", txtCategory.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Content", txtContent.Text);
                cmd.Parameters.AddWithValue("@ID", hdnModuleID.Value);

                conn.Open();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Module updated!";
                ClearForm();
                LoadModules();
                btnAdd.Visible = true;
                btnUpdate.Visible = false;
            }
        }

        // DELETE
        protected void GridViewModules_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int moduleID = Convert.ToInt32(GridViewModules.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "DELETE FROM Modules WHERE ModuleID=@ID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ID", moduleID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Module deleted!";
            LoadModules();
        }

        private void ClearForm()
        {
            txtTitle.Text = "";
            txtCategory.Text = "";
            txtDescription.Text = "";
            txtContent.Text = "";
        }
    }

}
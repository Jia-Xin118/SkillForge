using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assignment
{
    public partial class Register : System.Web.UI.Page
    {

        private readonly string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // Validation
            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (password.Length < 8)
            {
                lblMessage.Text = "Password must be at least 8 characters.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // Check if email exists
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();

                    int exists = (int)checkCmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        lblMessage.Text = "Email already registered.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }

                    // Insert new user
                    string insertQuery = @"INSERT INTO Users (FullName, Email, Password, Role) 
                                         VALUES (@FullName, @Email, @Password, 'User')";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                    insertCmd.Parameters.AddWithValue("@FullName", fullName);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@Password", password); // TODO: Hash this!
                    insertCmd.ExecuteNonQuery();

                    lblMessage.Text = "✓ Registration successful! Please login.";
                    lblMessage.Style["color"] = "#4CAF50";
                    lblMessage.Style["background"] = "rgba(76, 175, 80, 0.1)";
                    lblMessage.Style["border"] = "1px solid #4CAF50";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "✗ Error: " + ex.Message;
                lblMessage.Style["color"] = "#f44336";
                lblMessage.Style["background"] = "rgba(244, 67, 54, 0.1)";
                lblMessage.Style["border"] = "1px solid #f44336";
            }
        }

    }
}
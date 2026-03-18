using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class Register : System.Web.UI.Page
    {
        // Use Web.config connection string
        private readonly string connStr = ConfigurationManager.ConnectionStrings["SkillForgeDB"].ConnectionString;

        // ✅ OTP EMAIL FUNCTION - ADD THIS WHOLE FUNCTION
        private void SendOTPEmail(string email, string otp)
        {
            try
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("kritichew118@gmail.com", "SkillForge");
                msg.To.Add(email);
                msg.Subject = "SkillForge OTP Verification";
                msg.Body = $"Your OTP is: {otp}\n\nThis OTP will expire in 5 minutes.";

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential("kritichew118@gmail.com", "xjft lyyy mmeu oajo"); // Your app password (no spaces)
                client.Send(msg);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Email failed: " + ex.Message;
            }
        }

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

                    // Insert user
                    string insertQuery = @"INSERT INTO Users (FullName, Email, Password, Role) 
                                           VALUES (@FullName, @Email, @Password, 'User')";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                    insertCmd.Parameters.AddWithValue("@FullName", fullName);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@Password", password);
                    insertCmd.ExecuteNonQuery();

                    // ✅ GENERATE OTP
                    Random rand = new Random();
                    string otp = rand.Next(100000, 999999).ToString();
                    DateTime expiry = DateTime.Now.AddMinutes(5);

                    // ✅ SAVE OTP
                    string updateQuery = "UPDATE Users SET OTP=@OTP, OTPExpiry=@Expiry WHERE Email=@Email";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, conn);
                    updateCmd.Parameters.AddWithValue("@OTP", otp);
                    updateCmd.Parameters.AddWithValue("@Expiry", expiry);
                    updateCmd.Parameters.AddWithValue("@Email", email);
                    updateCmd.ExecuteNonQuery();

                    // ✅ SEND EMAIL
                    SendOTPEmail(email, otp);

                    // ✅ STORE EMAIL FOR NEXT PAGE
                    Session["Email"] = email;

                    // ✅ REDIRECT TO OTP PAGE
                    Response.Redirect("VerifyOTP.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "✗ Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
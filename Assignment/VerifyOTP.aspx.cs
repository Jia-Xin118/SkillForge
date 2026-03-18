using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class VerifyOTP : System.Web.UI.Page
    {

        string connStr = ConfigurationManager.ConnectionStrings["SkillForgeDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if email is in session
            if (Session["Email"] == null)
            {
                Response.Redirect("Register.aspx");
            }
        }

        // Send email function
        private void SendOTPEmail(string email, string otp)
        {
            try
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("laashmita13@gmail.com", "SkillForge");
                msg.To.Add(email);
                msg.Subject = "SkillForge Email Verification";
                msg.Body = $@"
                    <h2>Welcome to SkillForge!</h2>
                    <p>Your verification code is:</p>
                    <h1 style='color: #a51c30; font-size: 32px;'>{otp}</h1>
                    <p>This code will expire in 5 minutes.</p>
                    <p>If you didn't request this, please ignore this email.</p>
                ";
                msg.IsBodyHtml = true;

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential("kritichew118@gmail.com", "xjft lyyy mmeu oajo");
                client.Send(msg);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Email error: " + ex.Message;
            }
        }

        protected void BtnVerify_Click(object sender, EventArgs e)
        {
            string otp = txtOTP.Text.Trim();
            string email = Session["Email"].ToString();

            if (string.IsNullOrEmpty(otp))
            {
                lblMessage.Text = "Please enter the OTP code.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT OTP, OTPExpiry, UserID FROM Users WHERE Email=@Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string dbOtp = reader["OTP"].ToString();
                    DateTime expiry = Convert.ToDateTime(reader["OTPExpiry"]);
                    int userId = Convert.ToInt32(reader["UserID"]);

                    if (otp == dbOtp && DateTime.Now <= expiry)
                    {
                        reader.Close();

                        // Clear OTP after successful verification
                        string clearOtp = "UPDATE Users SET OTP = NULL, OTPExpiry = NULL WHERE UserID = @UserID";
                        SqlCommand clearCmd = new SqlCommand(clearOtp, conn);
                        clearCmd.Parameters.AddWithValue("@UserID", userId);
                        clearCmd.ExecuteNonQuery();

                        Session["UserID"] = userId;
                        Session.Remove("Email"); // Clean up

                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "❌ Invalid or expired OTP. Please try again.";
                    }
                }
                else
                {
                    lblMessage.Text = "❌ User not found.";
                }
            }
        }

        protected void BtnResend_Click(object sender, EventArgs e)
        {
            string email = Session["Email"].ToString();

            // Generate new OTP
            Random rand = new Random();
            string otp = rand.Next(100000, 999999).ToString();
            DateTime expiry = DateTime.Now.AddMinutes(5);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Users SET OTP=@OTP, OTPExpiry=@Expiry WHERE Email=@Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@OTP", otp);
                cmd.Parameters.AddWithValue("@Expiry", expiry);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Send new OTP
            SendOTPEmail(email, otp);

            lblMessage.Text = "✅ New verification code sent!";
        }
    }
}
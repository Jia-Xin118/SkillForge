using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Certificate : System.Web.UI.Page
    {

        private readonly string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadCertificate();
            }
        }

        private void LoadCertificate()
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            string category = Request.QueryString["category"]; // "Leadership", "Finance", "Communication"

            if (string.IsNullOrEmpty(category))
            {
                ShowError("No certificate category specified.");
                return;
            }

            // Check if all modules in category are passed
            if (!AllModulesPassed(userId, category))
            {
                ShowError("Complete all modules and quizzes in this category to earn your certificate.");
                return;
            }

            // Get user info
            string userName = GetUserName(userId);
            string certNumber = GenerateCertificateNumber(userId, category);
            string grade = CalculateGrade(userId, category);

            // Display certificate
            lblUserName.Text = userName;
            lblCertificateName.Text = category + " Certificate";
            lblGrade.Text = grade;
            lblCertNumber.Text = certNumber;
            lblDate.Text = DateTime.Now.ToString("MMMM dd, yyyy");

            // Save to database
            SaveCertificate(userId, category, certNumber, grade);

            pnlSuccess.Visible = true;
            pnlError.Visible = false;
        }

        private bool AllModulesPassed(int userId, string category)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Check if user has passed quizzes for all modules in this category
                string query = @"
                    SELECT COUNT(DISTINCT m.ModuleID) as TotalModules,
                           COUNT(DISTINCT CASE WHEN qa.Passed = 1 THEN m.ModuleID END) as PassedModules
                    FROM Modules m
                    LEFT JOIN QuizAttempts qa ON m.ModuleID = qa.ModuleID AND qa.UserID = @UserID
                    WHERE m.Category = @Category";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Category", category);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        int total = Convert.ToInt32(reader["TotalModules"]);
                        int passed = Convert.ToInt32(reader["PassedModules"]);
                        return total > 0 && total == passed;
                    }
                }
            }
            return false;
        }

        private string GetUserName(int userId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT FullName FROM Users WHERE UserID = @UserID", conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                conn.Open();
                return cmd.ExecuteScalar()?.ToString() ?? "Unknown";
            }
        }

        private string GenerateCertificateNumber(int userId, string category)
        {
            return $"SF-{category.Substring(0, 3).ToUpper()}-{userId}-{DateTime.Now:yyyyMMdd}";
        }

        private string CalculateGrade(int userId, string category)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT AVG(qa.Percentage) as AvgScore
                    FROM QuizAttempts qa
                    JOIN Modules m ON qa.ModuleID = m.ModuleID
                    WHERE qa.UserID = @UserID AND m.Category = @Category";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Category", category);
                conn.Open();

                var result = cmd.ExecuteScalar();
                if (result != DBNull.Value)
                {
                    decimal avg = Convert.ToDecimal(result);
                    if (avg >= 90) return "Distinction";
                    if (avg >= 80) return "Merit";
                    return "Pass";
                }
            }
            return "Pass";
        }

        private void SaveCertificate(int userId, string category, string certNumber, string grade)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Check if already exists
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Certificates WHERE UserID = @UserID AND Category = @Category", conn);
                checkCmd.Parameters.AddWithValue("@UserID", userId);
                checkCmd.Parameters.AddWithValue("@Category", category);
                conn.Open();

                if ((int)checkCmd.ExecuteScalar() == 0)
                {
                    SqlCommand insertCmd = new SqlCommand(@"
                        INSERT INTO Certificates (UserID, Category, CertificateNumber, Grade) 
                        VALUES (@UserID, @Category, @CertNumber, @Grade)", conn);
                    insertCmd.Parameters.AddWithValue("@UserID", userId);
                    insertCmd.Parameters.AddWithValue("@Category", category);
                    insertCmd.Parameters.AddWithValue("@CertNumber", certNumber);
                    insertCmd.Parameters.AddWithValue("@Grade", grade);
                    insertCmd.ExecuteNonQuery();
                }
            }
        }

        private void ShowError(string message)
        {
            lblErrorMessage.Text = message;
            pnlError.Visible = true;
            pnlSuccess.Visible = false;
        }

        protected void BtnDownload_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            string category = Request.QueryString["category"];

            string userName = lblUserName.Text;
            string certName = lblCertificateName.Text;
            string grade = lblGrade.Text;
            string certNumber = lblCertNumber.Text;
            string issueDate = lblDate.Text;

            // Create PDF
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", $"attachment;filename=Certificate_{category}_{userId}.pdf");

            using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
            {
                // Create document (landscape A4)
                iTextSharp.text.Document document = new iTextSharp.text.Document(iTextSharp.text.PageSize.A4.Rotate(), 50, 50, 50, 50);
                iTextSharp.text.pdf.PdfWriter writer = iTextSharp.text.pdf.PdfWriter.GetInstance(document, ms);

                document.Open();

                // Add border
                iTextSharp.text.pdf.PdfContentByte cb = writer.DirectContent;
                cb.SetLineWidth(3f);
                cb.SetColorStroke(new iTextSharp.text.BaseColor(30, 58, 95)); // #1e3a5f
                cb.Rectangle(30, 30, document.PageSize.Width - 60, document.PageSize.Height - 60);
                cb.Stroke();

                // Inner gold border
                cb.SetLineWidth(1f);
                cb.SetColorStroke(new iTextSharp.text.BaseColor(201, 162, 39)); // #c9a227
                cb.Rectangle(40, 40, document.PageSize.Width - 80, document.PageSize.Height - 80);
                cb.Stroke();

                // Title
                iTextSharp.text.Font titleFont = iTextSharp.text.FontFactory.GetFont(iTextSharp.text.FontFactory.HELVETICA_BOLD, 48, new iTextSharp.text.BaseColor(30, 58, 95));
                iTextSharp.text.Paragraph title = new iTextSharp.text.Paragraph("CERTIFICATE", titleFont);
                title.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
                title.SpacingAfter = 10f;
                document.Add(title);

                // Subtitle
                iTextSharp.text.Font subFont = iTextSharp.text.FontFactory.GetFont(iTextSharp.text.FontFactory.HELVETICA, 24, new iTextSharp.text.BaseColor(201, 162, 39));
                iTextSharp.text.Paragraph subtitle = new iTextSharp.text.Paragraph("OF COMPLETION", subFont);
                subtitle.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
                subtitle.SpacingAfter = 40f;
                document.Add(subtitle);

                // Body text
                iTextSharp.text.Font bodyFont = iTextSharp.text.FontFactory.GetFont(iTextSharp.text.FontFactory.HELVETICA, 18);
                iTextSharp.text.Paragraph body = new iTextSharp.text.Paragraph("This is to certify that", bodyFont);
                body.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
                body.SpacingAfter = 20f;
                document.Add(body);

                // Name
                iTextSharp.text.Font nameFont = iTextSharp.text.FontFactory.GetFont(iTextSharp.text.FontFactory.HELVETICA_BOLD, 36, new iTextSharp.text.BaseColor(30, 58, 95));
                iTextSharp.text.Paragraph namePara = new iTextSharp.text.Paragraph(userName.ToUpper(), nameFont);
                namePara.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
                namePara.SpacingAfter = 20f;
                document.Add(namePara);

                // Certificate name
                iTextSharp.text.Paragraph certPara = new iTextSharp.text.Paragraph($"has successfully completed the\n{certName}", bodyFont);
                certPara.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
                certPara.SpacingAfter = 30f;
                document.Add(certPara);

                // Grade
                iTextSharp.text.Font gradeFont = iTextSharp.text.FontFactory.GetFont(iTextSharp.text.FontFactory.HELVETICA_BOLD, 20, new iTextSharp.text.BaseColor(201, 162, 39));
                iTextSharp.text.Paragraph gradePara = new iTextSharp.text.Paragraph($"Grade: {grade}", gradeFont);
                gradePara.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
                gradePara.SpacingAfter = 50f;
                document.Add(gradePara);

                // Footer info
                iTextSharp.text.Font footerFont = iTextSharp.text.FontFactory.GetFont(iTextSharp.text.FontFactory.HELVETICA, 12);
                iTextSharp.text.pdf.PdfPTable table = new iTextSharp.text.pdf.PdfPTable(2);
                table.WidthPercentage = 80;
                table.HorizontalAlignment = iTextSharp.text.Element.ALIGN_CENTER;

                iTextSharp.text.pdf.PdfPCell cell1 = new iTextSharp.text.pdf.PdfPCell(new iTextSharp.text.Phrase($"Certificate ID: {certNumber}", footerFont))
                {
                    Border = iTextSharp.text.Rectangle.NO_BORDER,
                    HorizontalAlignment = iTextSharp.text.Element.ALIGN_LEFT
                };

                iTextSharp.text.pdf.PdfPCell cell2 = new iTextSharp.text.pdf.PdfPCell(new iTextSharp.text.Phrase($"Date: {issueDate}", footerFont))
                {
                    Border = iTextSharp.text.Rectangle.NO_BORDER,
                    HorizontalAlignment = iTextSharp.text.Element.ALIGN_RIGHT
                };

                table.AddCell(cell1);
                table.AddCell(cell2);
                document.Add(table);

                document.Close();

                Response.BinaryWrite(ms.ToArray());
                Response.End();
            }
        }

        protected void BtnLinkedIn_Click(object sender, EventArgs e)
        {
            string linkedInUrl = "https://www.linkedin.com/profile/add?startTask=CERTIFICATION_NAME";
            Response.Redirect(linkedInUrl);
        }
    }
}
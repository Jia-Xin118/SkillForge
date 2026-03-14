using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{ 
    public partial class Certificate : System.Web.UI.Page
    {
        public string CertificatePdfUrl { get; set; }
        private readonly string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jikk1\source\repos\Assignment\Assignment\App_Data\SkillForgeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Default.aspx");
                    return;
                }

                // Safe moduleId retrieval
                if (!int.TryParse(Request.QueryString["moduleId"], out int moduleId))
                {
                    ShowError("Invalid module selected.");
                    return;
                }

                int userId = Convert.ToInt32(Session["UserID"]);

                if (UserPassedQuiz(userId, moduleId, out decimal score))
                {
                    // Calculate grade based on score
                    string grade = CalculateGrade(score);
                    string certNumber = GenerateCertNumber(userId, moduleId);

                    SaveCertificate(userId, moduleId, certNumber, grade);
                    CertificatePdfUrl = GeneratePDF(userId, moduleId, certNumber, grade);

                    // Update labels on the page
                    lblUserName.Text = GetUserName(userId);
                    lblCertificateName.Text = GetModuleName(moduleId) + " Certificate";
                    lblGrade.Text = grade;
                    lblCertNumber.Text = certNumber;
                    lblDate.Text = DateTime.Now.ToString("MMMM dd, yyyy");

                    pnlSuccess.Visible = true;
                    pnlError.Visible = false;
                }
                else
                {
                    ShowError("You must pass the quiz (score ≥ 50%) to receive a certificate.");
                }
            }
        }

        private bool UserPassedQuiz(int userId, int moduleId, out decimal score)
        {
            score = 0;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // FIXED: Use QuizAttempts table with Percentage column
                string query = @"SELECT MAX(Percentage) FROM QuizAttempts 
                                WHERE UserID=@UserID AND ModuleID=@ModuleID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@ModuleID", moduleId);

                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != DBNull.Value && result != null)
                {
                    score = Convert.ToDecimal(result);
                    return score >= 50; // 50% passing threshold
                }
                return false;
            }
        }

        private string CalculateGrade(decimal score)
        {
            if (score >= 90) return "Distinction";
            if (score >= 80) return "Merit";
            return "Pass";
        }

        private string GenerateCertNumber(int userId, int moduleId)
        {
            string moduleCategory = GetModuleCategory(moduleId);
            string prefix = Sanitize(moduleCategory);
            return $"SF-{prefix}-M{moduleId}-{userId}-{DateTime.Now:yyyyMMdd}";
        }

        private string Sanitize(string input)
        {
            if (string.IsNullOrEmpty(input)) return "XXX";
            string cleaned = Regex.Replace(input, @"[^a-zA-Z]", "").ToUpper();
            return cleaned.Length >= 3 ? cleaned.Substring(0, 3) : cleaned.PadRight(3, 'X');
        }

        private void SaveCertificate(int userId, int moduleId, string certNumber, string grade)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // FIXED: Use UserCertificates table (not Certificates)
                string checkQuery = @"SELECT COUNT(*) FROM UserCertificates 
                                    WHERE UserID=@UserID AND ModuleID=@ModuleID";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@UserID", userId);
                checkCmd.Parameters.AddWithValue("@ModuleID", moduleId);

                conn.Open();
                int count = (int)checkCmd.ExecuteScalar();

                if (count == 0)
                {
                    string category = GetModuleCategory(moduleId);
                    string insertQuery = @"INSERT INTO UserCertificates 
                        (UserID, ModuleID, Category, CertificateNumber, Grade, IssueDate)
                        VALUES (@UserID, @ModuleID, @Category, @CertNumber, @Grade, GETDATE())";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                    insertCmd.Parameters.AddWithValue("@UserID", userId);
                    insertCmd.Parameters.AddWithValue("@ModuleID", moduleId);
                    insertCmd.Parameters.AddWithValue("@Category", category);
                    insertCmd.Parameters.AddWithValue("@CertNumber", certNumber);
                    insertCmd.Parameters.AddWithValue("@Grade", grade);
                    insertCmd.ExecuteNonQuery();
                }
            }
        }

        private string GeneratePDF(int userId, int moduleId, string certNumber, string grade)
        {
            string username = GetUserName(userId);
            string moduleName = GetModuleName(moduleId);

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4.Rotate(), 50, 50, 50, 50);
                PdfWriter writer = PdfWriter.GetInstance(doc, ms);
                doc.Open();

                // Add border
                PdfContentByte cb = writer.DirectContent;
                cb.SetLineWidth(3f);
                cb.SetColorStroke(new BaseColor(30, 58, 95));
                cb.Rectangle(30, 30, doc.PageSize.Width - 60, doc.PageSize.Height - 60);
                cb.Stroke();

                // Inner gold border
                cb.SetLineWidth(1f);
                cb.SetColorStroke(new BaseColor(201, 162, 39));
                cb.Rectangle(40, 40, doc.PageSize.Width - 80, doc.PageSize.Height - 80);
                cb.Stroke();

                // Title
                Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 48, new BaseColor(30, 58, 95));
                Paragraph title = new Paragraph("CERTIFICATE", titleFont);
                title.Alignment = Element.ALIGN_CENTER;
                title.SpacingAfter = 10f;
                doc.Add(title);

                Font subFont = FontFactory.GetFont(FontFactory.HELVETICA, 24, new BaseColor(201, 162, 39));
                Paragraph subtitle = new Paragraph("OF COMPLETION", subFont);
                subtitle.Alignment = Element.ALIGN_CENTER;
                subtitle.SpacingAfter = 40f;
                doc.Add(subtitle);

                Font bodyFont = FontFactory.GetFont(FontFactory.HELVETICA, 18);
                Paragraph body = new Paragraph("This is to certify that", bodyFont);
                body.Alignment = Element.ALIGN_CENTER;
                body.SpacingAfter = 20f;
                doc.Add(body);

                Font nameFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 36, new BaseColor(30, 58, 95));
                Paragraph namePara = new Paragraph(username.ToUpper(), nameFont);
                namePara.Alignment = Element.ALIGN_CENTER;
                namePara.SpacingAfter = 20f;
                doc.Add(namePara);

                Paragraph certPara = new Paragraph($"has successfully completed the\n{moduleName} Module", bodyFont);
                certPara.Alignment = Element.ALIGN_CENTER;
                certPara.SpacingAfter = 30f;
                doc.Add(certPara);

                Font gradeFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 20, new BaseColor(201, 162, 39));
                Paragraph gradePara = new Paragraph($"Grade: {grade}", gradeFont);
                gradePara.Alignment = Element.ALIGN_CENTER;
                gradePara.SpacingAfter = 50f;
                doc.Add(gradePara);

                // Footer
                Font footerFont = FontFactory.GetFont(FontFactory.HELVETICA, 12);
                PdfPTable table = new PdfPTable(2);
                table.WidthPercentage = 80;
                table.HorizontalAlignment = Element.ALIGN_CENTER;

                PdfPCell cell1 = new PdfPCell(new Phrase($"Certificate ID: {certNumber}", footerFont))
                {
                    Border = Rectangle.NO_BORDER,
                    HorizontalAlignment = Element.ALIGN_LEFT
                };

                PdfPCell cell2 = new PdfPCell(new Phrase($"Date: {DateTime.Now.ToString("MMMM dd, yyyy")}", footerFont))
                {
                    Border = Rectangle.NO_BORDER,
                    HorizontalAlignment = Element.ALIGN_RIGHT
                };

                table.AddCell(cell1);
                table.AddCell(cell2);
                doc.Add(table);

                doc.Close();

                // Save to file
                string folderPath = Server.MapPath("~/Certificates/");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                string fileName = $"{certNumber}.pdf";
                string filePath = Path.Combine(folderPath, fileName);
                File.WriteAllBytes(filePath, ms.ToArray());

                return "/Certificates/" + fileName;
            }
        }

        private string GetUserName(int userId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // FIXED: Use FullName not Username
                string query = "SELECT FullName FROM Users WHERE UserID=@UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                conn.Open();
                return cmd.ExecuteScalar()?.ToString() ?? "Unknown User";
            }
        }

        private string GetModuleName(int moduleId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // FIXED: Use Title not ModuleName
                string query = "SELECT Title FROM Modules WHERE ModuleID=@ModuleID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ModuleID", moduleId);
                conn.Open();
                return cmd.ExecuteScalar()?.ToString() ?? "Unknown Module";
            }
        }

        private string GetModuleCategory(int moduleId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Category FROM Modules WHERE ModuleID=@ModuleID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ModuleID", moduleId);
                conn.Open();
                return cmd.ExecuteScalar()?.ToString() ?? "General";
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
            if (!string.IsNullOrEmpty(CertificatePdfUrl))
            {
                string filePath = Server.MapPath(CertificatePdfUrl);
                if (File.Exists(filePath))
                {
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", $"attachment; filename={Path.GetFileName(filePath)}");
                    Response.WriteFile(filePath);
                    Response.End();
                }
                else
                {
                    ShowError("Certificate file not found.");
                }
            }
        }

        protected void BtnLinkedIn_Click(object sender, EventArgs e)
        {
            // Build LinkedIn URL
            string linkedInUrl = "https://www.linkedin.com/profile/add?startTask=CERTIFICATION_NAME";
            linkedInUrl += "&name=" + Server.UrlEncode(lblCertificateName.Text);
            linkedInUrl += "&organizationName=SkillForge";
            linkedInUrl += "&issueYear=" + DateTime.Now.Year;
            linkedInUrl += "&issueMonth=" + DateTime.Now.Month;

            Response.Redirect(linkedInUrl);
        }
    }
}
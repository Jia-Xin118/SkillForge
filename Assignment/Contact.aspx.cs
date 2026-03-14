using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            // Your email sending logic here
            // Example:
            //string name = txtName.Text;
            //string message = txtMessage.Text;

            // TODO: Add email sending code that uses the collected values

            // Show success message
            lblStatus.Text = "Thank you! Your message has been sent.";
            lblStatus.CssClass = "alert alert-success";
        }
    }

}
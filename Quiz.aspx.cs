protected void BtnQuit_Click(object sender, EventArgs e)
{
    // optional: record that user abandoned the quiz, clear temp state, etc.
    Response.Redirect($"ModuleDetail.aspx?id={Request.QueryString["moduleId"]}");
}
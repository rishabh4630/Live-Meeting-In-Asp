using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Registration_RegisterUser_frmSendmailMessagePage : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            lblName.Text = Session["To"].ToString();
           
        }
    }
   
    protected void ImgReturnToInbox_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmUserInbox.aspx");
    }
    
}

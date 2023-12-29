using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Web.Security;
using System.Net;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OpenIdConnect;

namespace UWS_Boiler_Plate
{
    public partial class Login : Page
    {
        private static System.Web.UI.HtmlControls.HtmlGenericControl logOutControl;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Hiding Logout Control until Okta Logout function is fixed - currently error response
            logOutControl = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("LogOut");
            if (logOutControl != null) logOutControl.Visible = false;
            if (Request.IsAuthenticated)
            {
                Session["Username"] = HttpContext.Current.GetOwinContext().Request.User.Identity.Name;
                Session["logInStatus"] = true;
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                Session["logInStatus"] = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                HttpContext.Current.GetOwinContext().Authentication.Challenge(new AuthenticationProperties { RedirectUri = "/" }, OpenIdConnectAuthenticationDefaults.AuthenticationType);
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {

        }

        protected void btnResendVerify_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}
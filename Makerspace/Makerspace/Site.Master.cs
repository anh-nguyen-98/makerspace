using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Makerspace
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Resource.aspx");

        }
        protected void LogIn(object sender, EventArgs e)
        {
            EmailLabel.CssClass = "input-label";
            Email.CssClass = "input-box";

            EmailErrorMessage.Text = "";
            PasswordErrorMessage.Text = "";

            if (hasEmptyFields()) return;
            if (!validateEmail()) return;

            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("select * from Account where email = @email and password = @password", con);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                cmd.Parameters.AddWithValue("@password", Password.Text);
                con.Open();
                DataTable db = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(db);
                if (db.Rows.Count > 0)
                {
                    Session.RemoveAll();
                    Session["role"] = db.Rows[0]["role"];
                    Session["level"] = db.Rows[0]["level"];
                    Response.Redirect("~/Resource.aspx");
                }
                else
                {
                    PasswordLabel.CssClass = "input-label-danger";
                    Password.CssClass = "input-box-danger";
                    PasswordErrorMessage.Text = "Your password is incorrect.";
                }
            }

        }
        protected bool validateEmail()
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("select * from Account where email = @email", con);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                con.Open();
                DataTable db = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(db);
                if (db.Rows.Count == 0)
                {
                    EmailLabel.CssClass = "input-label-danger";
                    Email.CssClass = "input-box-danger";
                    EmailErrorMessage.Text = "This email is invalid.";
                    return false;
                }
                return true;
            }
        }

        protected bool hasEmptyFields()
        {
            bool flag = false;
            if (Email.Text.Length == 0)
            {
                EmailLabel.CssClass = "input-label-danger";
                Email.CssClass = "input-box-danger";
                EmailErrorMessage.Text = "Email cannot be empty.";
                flag = true;
            }
            if (Password.Text.Length == 0)
            {
                PasswordLabel.CssClass = "input-label-danger";
                Password.CssClass = "input-box-danger";
                PasswordErrorMessage.Text = "Password cannot be empty.";
                flag = true;
            }
            return flag;
        }

    }

}
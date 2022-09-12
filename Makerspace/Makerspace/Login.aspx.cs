using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class Login : Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected bool hasEmptyFields ()
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
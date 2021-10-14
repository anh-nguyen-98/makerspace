using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Makerspace
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearTextBoxes(AddUserForm);
            }
            else
            {

                ClearTextBoxes(AddUserForm);

            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("uspAddUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userCode", Code.Text);
                cmd.Parameters.AddWithValue("@userEmail", Email.Text);
                cmd.Parameters.AddWithValue("@userFirstName", FirstName.Text);
                cmd.Parameters.AddWithValue("@userLastName", LastName.Text);
                cmd.Parameters.AddWithValue("@userMiddleName", MiddleName.Text);
                cmd.Parameters.AddWithValue("@userPhone", Phone.Text);
                cmd.Parameters.AddWithValue("@userDept", Dept.Text);
                cmd.Parameters.AddWithValue("@userJob", Job.Text);
                cmd.Parameters.AddWithValue("@userDOB", DOB.SelectedDate.ToString());
                cmd.ExecuteNonQuery();
                
            }      

        }

        private void ClearTextBoxes(Control parent)
        {
            foreach (Control c in parent.Controls)
            {
                if (c.GetType() == typeof(TextBox))
                {
                    ((TextBox)c).Text = "";
                }
                if (c.HasControls()) ClearTextBoxes(c);

            }
        }
    }
}
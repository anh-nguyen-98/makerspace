using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class EngineeringSkillsManagement : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void InsertBtn_Click(object sender, EventArgs e)
        {
            string sql = "insert into students (full_name, first_name, email) values(@full_name,@first_name, @email)";
            Button addButton = (Button)sender;
            TextBox box1 = addButton.NamingContainer.FindControl("FullNameInsertTextBox") as TextBox;
            TextBox box2 = addButton.NamingContainer.FindControl("FirstNameInsertTextBox") as TextBox;
            TextBox box3 = addButton.NamingContainer.FindControl("EmailInsertTextBox") as TextBox;
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    com.Parameters.AddWithValue("@full_name", box1.Text);
                    com.Parameters.AddWithValue("@first_name", box2.Text);
                    com.Parameters.AddWithValue("@email", box3.Text);
                    con.Open();
                    com.ExecuteNonQuery();
                }
            }
            GridView1.DataBind();
        }
    }
}
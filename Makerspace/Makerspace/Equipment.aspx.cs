using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Makerspace
{
    public partial class Equipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (RadioButton4.Checked)
            {
                String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                String sp = "uspReadEquipLoc@eName";
                SqlCommand cmd = new SqlCommand(sp, con);
                cmd.Parameters.AddWithValue("@eName", string.Format("%{0}%", TextBox1.Text));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                con.Close();
            }
            if (RadioButton3.Checked)
            {
                String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                String sp = "uspReadEquipmentInfo@eName";
                SqlCommand cmd = new SqlCommand(sp, con);
                cmd.Parameters.AddWithValue("@eName", string.Format("%{0}%", TextBox1.Text));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                con.Close();
            }

            if (RadioButton2.Checked)
            {
                String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                String sp = "uspReadEquipmentInfo@eFunction";
                SqlCommand cmd = new SqlCommand(sp, con);
                cmd.Parameters.AddWithValue("@eFunction", string.Format("%{0}%", TextBox1.Text));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                con.Close();

            }
        }
    }
}
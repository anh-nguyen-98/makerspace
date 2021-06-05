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
            String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String sp = "";
            String param = "";
            if (RadioButton4.Checked)
            {

                sp = "uspReadEquipInfo@eLocation";
                param = "@eLocation";

            }
            if (RadioButton3.Checked)
            {
                sp = "uspReadEquipInfo@eName";
                param = "@eName";
            }

            if (RadioButton2.Checked) 
            {
                sp = "uspReadEquipInfo@eFunction";
                param = "@eFunction";
            }
            if (!RadioButton2.Checked && !RadioButton3.Checked && !RadioButton4.Checked)
            {
                sp = "uspReadEquip";
            }
            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (param.Length != 0)
            {
                cmd.Parameters.AddWithValue(param, string.Format("%{0}%", TextBox1.Text));
            }
            SqlDataReader reader = cmd.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            con.Close();
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //BUG HERE - OUT OF INDEX
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            //int index = GridView1.SelectedIndex;
            //int id = Convert.ToInt32(GridView1.DataKeys[index].Value);
            SqlCommand cmd = new SqlCommand("DELETE FROM Equipment WHERE eID =" + id + "", con);


            cmd.ExecuteNonQuery();
            SqlCommand select = new SqlCommand("uspReadEquipInfo@eName", con);
            select.CommandType = CommandType.StoredProcedure;

            select.Parameters.AddWithValue("@eName", string.Format("%{0}%", TextBox1.Text));
            SqlDataAdapter adapter = new SqlDataAdapter(select);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();


        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            String sp = "uspInsertEquip";
            SqlCommand insert = new SqlCommand(sp, con);
            insert.CommandType = CommandType.StoredProcedure;
            int eTraining = 0;

            insert.Parameters.AddWithValue("eCode", TextBox2.Text);
            insert.Parameters.AddWithValue("eName", TextBox3.Text);
            insert.Parameters.AddWithValue("eDesc", TextBox4.Text);
            insert.Parameters.AddWithValue("eFunction", TextBox5.Text);
            insert.Parameters.AddWithValue("eManual", TextBox6.Text);
            insert.Parameters.AddWithValue("eSafety", TextBox7.Text);

            if (CheckBox1.Checked)
            {
                eTraining = 1;
            }
            
            insert.Parameters.AddWithValue("eTraining", eTraining);


            insert.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Added');", true);
            TextBox2.Text = TextBox3.Text = TextBox4.Text = TextBox5.Text = TextBox6.Text = TextBox7.Text = string.Empty;
            CheckBox1.Checked = false;
            LoadNewInsert();
            con.Close();

        }



        protected void LoadNewInsert()
        {
            String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            SqlCommand newUpdated = new SqlCommand("SELECT * FROM Equipment", con);
            SqlDataAdapter adapter = new SqlDataAdapter(newUpdated);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}
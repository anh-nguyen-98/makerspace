using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Makerspace
{
    public partial class DeleteEquipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DeleteItem(String @eCode) 
        {
            String connString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();
            String sp = "uspDeleteEquipment";
            SqlCommand cmd = new SqlCommand(sp, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@eCode", SqlDbType.NChar);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connection.Close();


        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows) {
                CheckBox CheckBox1 = (CheckBox)row.FindControl("CheckBox1");
                if (CheckBox1.Checked)
                {
                   String @ecode = row.Cells[2].Text;
                   DeleteItem(@ecode);
                }

            }
        }
    }
}
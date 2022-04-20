using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class EquipmentDetail : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void code_Load(object sender, EventArgs e)
        {
            eid.Text = Request.QueryString["id"];
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                //string command = "SELECT * FROM Equipment WHERE id = " + eid.Text;
                //SqlCommand cmd = new SqlCommand(command);
                //cmd.CommandType = CommandType.StoredProcedure;
                //con.Open();
                //cmd.Connection = con;
                //cmd.ExecuteNonQuery();
                //DataTable db = new DataTable();
                //SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                //adapter.Fill(db);



            }
        }
    }
}
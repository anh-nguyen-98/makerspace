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
            //SqlConnection con = new SqlConnection(CONSTRING);
            //string command = "SELECT name FROM EQUIPMENT WHERE id = " + eid;
            //SqlCommand cmd = new SqlCommand(command, con);
            //con.Open();
            //SqlDataReader reader = cmd.ExecuteReader();
            //name.Text = reader.GetValue(0).ToString();
        }
    }
}
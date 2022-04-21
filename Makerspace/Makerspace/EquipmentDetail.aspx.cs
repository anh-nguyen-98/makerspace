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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(CONSTRING))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    
                    SqlCommand cmd = new SqlCommand("SELECT * FROM EquipmentItemLocation_View WHERE id = @id;", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();

                    DataTable db = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(db);
                    Subitem_Listview.DataSource = db;
                    Subitem_Listview.DataBind();
                }
            }
            else
            {

            }

        }

        protected void Description_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(CONSTRING))
            {


            }

            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlCommand cmd = new SqlCommand("SELECT description FROM EquipmentItemLocation_View WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            conn.Open();

            var link = cmd.ExecuteScalar();

            System.Diagnostics.Debug.WriteLine(link.ToString());
        }
    }
}
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class Equipment : System.Web.UI.Page
    {
        protected static int LEN_LOC_CODE = 4;
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadAllData();
            }
            else
            {

            }

        }

        protected void loadAllData()
        {
            using (SqlConnection con = new SqlConnection(CONSTRING)) 
            {
                SqlCommand cmd = new SqlCommand("uspReadAllEquipment");
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipGV.DataSource = dt;
                EquipGV.DataBind();
            }
        }

        protected void CategoryDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedId = Convert.ToInt32(CategoryDdl.SelectedValue);
            if (selectedId == 0)
            {
                loadAllData();
                return;
            }
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadEquipmentByCategory");
                cmd.Parameters.AddWithValue("@category_id", selectedId);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipGV.DataSource = dt;
                EquipGV.DataBind();
            }

        }


        protected void searchBtn_Click(object sender, EventArgs e)
        {
            string searchTerm = string.Format("%{0}%", searchBox.Text.Trim().ToLower());
            System.Diagnostics.Debug.WriteLine(searchTerm);
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadEquipmentBySearchTerm");
                cmd.Parameters.AddWithValue("@name", searchTerm);
                cmd.Parameters.AddWithValue("@code", searchTerm);
                cmd.Parameters.AddWithValue("@purpose", searchTerm);
                cmd.Parameters.AddWithValue("@category_name", searchTerm);
                cmd.Parameters.AddWithValue("@room_space_name", searchTerm);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipGV.DataSource = dt;
                EquipGV.DataBind();
            }
        }
    }

}

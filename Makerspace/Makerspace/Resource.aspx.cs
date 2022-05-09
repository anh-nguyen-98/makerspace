using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Makerspace
{
    public partial class Resource : System.Web.UI.Page
    {
        protected static int ItemsCount = 0;
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
            }
            else
            {

            }

        }

        //Post back data
        //Bind ListView
        protected void load()
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadAllEquipment");
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable db = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(db);
                EquipLV.DataSource = db;
                EquipLV.DataBind();
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            string searchTerm = string.Format("%{0}%", searchBox.Text.Trim().ToLower());
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadEquipmentBySearchTerm");
                cmd.Parameters.AddWithValue("@name", searchTerm);
                cmd.Parameters.AddWithValue("@name_vie", searchTerm);
                cmd.Parameters.AddWithValue("@code", searchTerm);
                cmd.Parameters.AddWithValue("@category_name", searchTerm);
                cmd.Parameters.AddWithValue("@room_space_name", searchTerm);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipLV.DataSource = dt;
                EquipLV.DataBind();
            }
            
        }



        protected void Category_ListView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selected_category = Category_ListView.SelectedValue.ToString();
            System.Diagnostics.Debug.WriteLine(selected_category);

            if (selected_category == "All")
            {
                load();
                return;
            }

            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
               
                SqlCommand cmd = new SqlCommand("uspReadEquipmentByCategory");
                cmd.Parameters.AddWithValue("@category_name", selected_category);
                   
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipLV.DataSource = dt;
                EquipLV.DataBind();
            }        
        }

        //protected void Direct_EquipmentDetail(object sender, EventArgs e)
        //{
        //    string id = "1";
        //    if (id == null)
        //    {
        //        Response.Redirect("~/Resource.aspx");
        //    }
        //    string url = "~/EquipmentDetail.aspx?id=" + id;
        //    Response.Redirect(url);
        //}

        protected void EquipLV_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            System.Diagnostics.Debug.WriteLine(EquipLV.SelectedValue.ToString());
            string id = EquipLV.SelectedValue.ToString();
            if (id == null)
            {
                Response.Redirect("~/Resource.aspx");
            }
            string url = "~/EquipmentDetail.aspx?id=" + id;
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void EquipLV_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            this.EquipLV.SelectedIndex = e.NewSelectedIndex;
            //load();

        }
    }

}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Makerspace
{
    public partial class GetUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllUsers();
                DataTable dt = CreateDataSource();
                RoleList.DataSource = dt;
                RoleList.DataTextField = "roleName";
                RoleList.DataValueField = "roleID";
                RoleList.DataBind();
                RoleList.Items.Insert(0, new ListItem("Role", "-1"));
            
            } else
            {

            }
            
        }

       
        protected DataTable CreateDataSource()
        {
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Role", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;

            
            
        }
        protected void SearchBtnClick(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("uspReadUser@userID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                int id = Int32.Parse(UserID.Text);
                cmd.Parameters.AddWithValue("@userID", id);
                SqlDataReader reader = cmd.ExecuteReader();
                RetGridView.DataSource = reader;
                RetGridView.DataBind();
                count.Text = RetGridView.Rows.Count.ToString();
                
            }
        }

        protected void GetAllUsers ()
        {
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("uspReadAllUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                RetGridView.DataSource = reader;
                RetGridView.DataBind();
                count.Text = RetGridView.Rows.Count.ToString();
        


            }
        }

        protected void RoleList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = RoleList.SelectedItem.Value;
            System.Diagnostics.Debug.WriteLine(value);
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("uspReadUser@roleID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                
                Int32.TryParse(value, out int id);
                cmd.Parameters.AddWithValue("@roleID", id);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                RetGridView.DataSource = dt;
                RetGridView.DataBind();
                count.Text = RetGridView.Rows.Count.ToString();
            }
            
        }
    }
}
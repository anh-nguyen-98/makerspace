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
        private static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllUsers();
                DataTable dt = CreateDataSource("Role");
                RoleList.DataSource = dt;
                RoleList.DataTextField = "roleName";
                RoleList.DataValueField = "roleID";
                RoleList.DataBind();
                RoleList.Items.Insert(0, new ListItem("Role", "-1"));
            
            } else
            {

            }
            
        }

       
        protected DataTable CreateDataSource(string entity)
        {
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM " + entity, con);
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
                UserGV.DataSource = reader;
                UserGV.DataBind();
                count.Text = UserGV.Rows.Count.ToString();
                
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
                UserGV.DataSource = reader;
                UserGV.DataBind();
                count.Text = UserGV.Rows.Count.ToString();
        


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
                UserGV.DataSource = dt;
                UserGV.DataBind();
                count.Text = UserGV.Rows.Count.ToString();
            }
            
        }

        protected void UserGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idString = UserGV.SelectedRow.Cells[1].Text;
            Int32.TryParse(idString, out int id);
            BindFV(UserFV, "uspReadUser@userID", "@userID", id);

        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            UserFV.ChangeMode(FormViewMode.Insert);
       
        }
        protected void BindFV(FormView fv, string usp, string param, int id)
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand(usp, con))
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(param, id);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                fv.DataSource = dt;
                fv.DataBind();
            }
        }

        protected void UserFV_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            UserFV.ChangeMode(e.NewMode);

        }

        protected void UserFV_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
                using (SqlCommand cmd = new SqlCommand("uspAddUser", con))
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userCode", ((TextBox)UserFV.FindControl("CodeTextBox")).Text);
                cmd.Parameters.AddWithValue("@userEmail", ((TextBox)UserFV.FindControl("EmailTextBox")).Text);
                cmd.Parameters.AddWithValue("@userFirstName", ((TextBox)UserFV.FindControl("FirstNameTextBox")).Text);
                cmd.Parameters.AddWithValue("@userLastName", ((TextBox)UserFV.FindControl("LastNameTextBox")).Text);
                cmd.Parameters.AddWithValue("@userMiddleName", ((TextBox)UserFV.FindControl("MiddleNameTextBox")).Text);
                cmd.Parameters.AddWithValue("@userPhone", ((TextBox)UserFV.FindControl("PhoneTextBox")).Text);
                cmd.Parameters.AddWithValue("@userDept", ((TextBox)UserFV.FindControl("DeptTextBox")).Text);
                cmd.Parameters.AddWithValue("@userJob", ((TextBox)UserFV.FindControl("JobTextBox")).Text);
                cmd.Parameters.AddWithValue("@userDOB", ((Calendar)UserFV.FindControl("DOBCalendar")).SelectedDate.ToString());
                //cmd.Parameters.AddWithValue("@userRole", ((TextBox)UserFV.FindControl("RoleTextBox")).Text);
                cmd.ExecuteNonQuery();

            }

            UserFV.ChangeMode(FormViewMode.ReadOnly);
            System.Diagnostics.Debug.WriteLine(UserFV.CurrentMode);
            GetAllUsers();
            int id = Convert.ToInt32(UserGV.DataKeys[UserGV.Rows.Count - 1].Value.ToString());
            System.Diagnostics.Debug.WriteLine(id);
            BindFV(UserFV, "uspReadUser@userID", "@userID", id);
            System.Diagnostics.Debug.WriteLine("Success");

            UserFV.Visible = true;

        }
    }
}
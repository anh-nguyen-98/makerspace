using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Makerspace
{
    public partial class ProjectContent : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // if not postBack, then load for the first time
            {
                this.load();
            }
            else
            {

            }
        }

        protected void load()
        {
            string sort_type = "aToZ";

            if (sortOption.SelectedValue != null) // user already changed sorting order
            {
                sort_type = sortOption.SelectedValue.ToString(); // get the chosen sorting option
            }
            // for now, there is only 1 way to get the data: get all and sort by begin_date, asc
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadAllEngineeringProject");
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
        }

        protected void ListView1_Selected_Project_Changed(object sender, EventArgs e)
        {

        }

        protected void view_project(object sender, EventArgs e)
        {

        }

        protected void edit_project(object sender, EventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Makerspace
{
    public partial class EngineeringProjectView : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;

        int projectID; // current project's id
        String projectName; // currnet project's name
        List<String> imagePathList = new List<String>(); // store image paths from the query
        String imagePathRoot = "Images/engineering_project/";

        public String ProjectName { get { return projectName; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            // cannot access this page directly, must be from EngineeringProjectMain.aspx
            try
            {
                int count = Request.QueryString["projectID"].Count();
            } catch (ArgumentNullException noProjectID)
            {
                Server.Transfer("EngineeringProjectMain.aspx");
            }

            projectID = int.Parse(Request.QueryString["projectID"]);

            projectName = Request.QueryString["projectName"];
            project_title.Text = projectName;

            debug_label.Text = "DEBUG: " + Request.QueryString["projectName"];
            load();

        }

        protected void load()
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                // set up sql commands
                //SqlCommand getProjectProgressCmd = new SqlCommand("uspGetEngineeringProjectProgress");
                //SqlCommand getProjectDepartmentCmd = new SqlCommand("uspGetEngineeringProjectDepartment");
                SqlCommand getProjectImageCmd = new SqlCommand("uspReadEngineeringProjectImage");
                //getProjectProgressCmd.CommandType = CommandType.StoredProcedure;
                //getProjectDepartmentCmd.CommandType = CommandType.StoredProcedure;
                getProjectImageCmd.CommandType = CommandType.StoredProcedure;

                // fill commands with parameters
                //getProjectProgressCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;
                //getProjectDepartmentCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;
                getProjectImageCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;

                // set up DataTables
                DataTable projectProgressTable = new DataTable();
                DataTable projectProgressDepartment = new DataTable();
                DataTable projectImages = new DataTable();

                // open connections
                con.Open();

                // get progress
                //getProjectProgressCmd.Connection = con;
                //SqlDataAdapter adapter = new SqlDataAdapter(getProjectProgressCmd);
                //adapter.Fill(projectProgressTable);

                // get department
                //getProjectDepartmentCmd.Connection = con;
                //adapter = new SqlDataAdapter(getProjectDepartmentCmd);
                //adapter.Fill(projectProgressDepartment);

                // get image
                SqlDataAdapter adapter = new SqlDataAdapter(getProjectImageCmd);
                getProjectImageCmd.Connection = con;
                adapter = new SqlDataAdapter(getProjectImageCmd);
                adapter.Fill(projectImages);
                // fill the image_path into the imagePathList
                foreach (DataRow row in projectImages.Rows)
                {
                    String path = row["image_path"].ToString();
                    Console.WriteLine("image path:" + path);
                    imagePathList.Add(imagePathRoot + path + ".jpg");
                }
                // set image path for all asp:Image elements
                coverImage.ImageUrl = imagePathList[0];
                image1.ImageUrl = imagePathList[1];

                debug_label.Text = "DEBUG: " + imagePathList[0];

                // bind the tables to the datasource of Views
                //ListView1.DataSource = dt;
                //ListView1.DataBind();
            }
        }
    }
}
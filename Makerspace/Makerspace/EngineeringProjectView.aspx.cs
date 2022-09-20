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
        String fallBackImageUrl = "Images/engineering_project/fallback.jpg";
        bool Ongoing;

        public String ProjectName { get { return projectName; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            // cannot access this page directly, must be from EngineeringProjectMain.aspx
            try
            {
                int count = Request.QueryString["projectID"].Count();
            }
            catch (ArgumentNullException noProjectID)
            {
                Server.Transfer("EngineeringProjectMain.aspx");
            }

            projectID = int.Parse(Request.QueryString["projectID"]);

            projectName = Request.QueryString["projectName"];
            project_title.Text = projectName;
            Page.Title = projectName;
            load();

        }

        protected void load()
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                // set up sql commands
                SqlCommand getProjectCmd = new SqlCommand("uspReadEngineeringProject");
                SqlCommand getProjectProgressCmd = new SqlCommand("uspReadEngineeringProjectProgress");
                SqlCommand getProjectDepartmentCmd = new SqlCommand("uspReadEngineeringProjectDepartment");
                SqlCommand getProjectImageCmd = new SqlCommand("uspReadEngineeringProjectImage");
                SqlCommand getProjectPositionCmd = new SqlCommand("uspReadEngineeringProjectPosition");

                getProjectCmd.CommandType = CommandType.StoredProcedure;
                getProjectProgressCmd.CommandType = CommandType.StoredProcedure;
                getProjectDepartmentCmd.CommandType = CommandType.StoredProcedure;
                getProjectImageCmd.CommandType = CommandType.StoredProcedure;
                getProjectPositionCmd.CommandType = CommandType.StoredProcedure;

                // fill commands with parameters
                getProjectCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;
                getProjectProgressCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;
                getProjectDepartmentCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;
                getProjectImageCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;
                getProjectPositionCmd.Parameters.Add("@projectID", SqlDbType.VarChar).Value = projectID;

                // set up DataTables
                DataTable projectInfoTable = new DataTable();
                DataTable projectProgressTable = new DataTable();
                DataTable projectDepartmentTable = new DataTable();
                DataTable projectImages = new DataTable();
                DataTable projectPositionTable = new DataTable();

                // open connections
                con.Open();

                // get project info
                getProjectCmd.Connection = con;
                SqlDataAdapter adapter = new SqlDataAdapter(getProjectCmd);
                adapter.Fill(projectInfoTable);

                // set data for about project section
                aboutProjectFormView.DataSource = projectInfoTable;
                aboutProjectFormView.DataBind();
                // set visibility of Ongoing chip
                Ongoing = (1 == Int32.Parse("" + projectInfoTable.Rows[0]["ongoing"]));
                statusChip.Visible = Ongoing;
                // set links at the end of the page
                youtubeLink.HRef = "" + projectInfoTable.Rows[0]["youtube_link"];
                facebookLink.HRef = "" + projectInfoTable.Rows[0]["facebook_link"];
                emailLink.HRef = "mailto:" + projectInfoTable.Rows[0]["email_link"];


                // get progress
                getProjectProgressCmd.Connection = con;
                adapter = new SqlDataAdapter(getProjectProgressCmd);
                adapter.Fill(projectProgressTable);
                projectProgressListview.DataSource = projectProgressTable;
                projectProgressListview.DataBind();

                // get department
                getProjectDepartmentCmd.Connection = con;
                adapter = new SqlDataAdapter(getProjectDepartmentCmd);
                adapter.Fill(projectDepartmentTable);
                projectDepartmentListview.DataSource = projectDepartmentTable;
                projectDepartmentListview.DataBind();

                // get image
                adapter = new SqlDataAdapter(getProjectImageCmd);
                getProjectImageCmd.Connection = con;
                adapter = new SqlDataAdapter(getProjectImageCmd);
                adapter.Fill(projectImages);

                // get position
                adapter = new SqlDataAdapter(getProjectPositionCmd);
                getProjectPositionCmd.Connection = con;
                adapter = new SqlDataAdapter(getProjectPositionCmd);
                adapter.Fill(projectPositionTable);
                projectPositionListview.DataSource = projectPositionTable;
                projectPositionListview.DataBind();

                // fill the image_path into the imagePathList
                foreach (DataRow row in projectImages.Rows)
                {
                    String path = row["image_path"].ToString();
                    Console.WriteLine("image path:" + path);
                    imagePathList.Add(imagePathRoot + path + ".jpg");
                }

                // at least 3 images must be available, otherwise stock image will be used
                if (imagePathList.Count() > 2)
                {
                    setImage();
                }
                else
                {
                    setImageDefault();
                }

                // if project is ongoing
                if (Ongoing)
                {
                    join_us.Attributes.Add("style", "display: flex; flex-direction: column; align-items: center; padding: 40px 50px; gap: 30px; width: 100%; background: #FFFFFF; flex: none; order: 4; align-self: stretch; flex-grow: 0;");
                    project_contact.Attributes.Add("style", "display: flex;\r\n            flex-direction: column;\r\n            align-items: center;\r\n            padding: 40px 50px;\r\n            gap: 30px;\r\n\r\n            width: 100%;\r\n\r\n            /* Neutral/B75 */\r\n\r\n            background: #F1F3F6;\r\n\r\n            /* Inside auto layout */\r\n\r\n            flex: none;\r\n            order: 5;\r\n            align-self: stretch;\r\n            flex-grow: 0;");
                }
                else // project is not ongoing anymore
                {
                    join_us.Attributes.Add("style", "display: none; flex-direction: column;  align-items: center;  padding: 40px 50px;   gap: 30px;  width: 100%; background: #F1F3F6;   flex: none;\r\n            order: 5;\r\n            align-self: stretch;\r\n            flex-grow: 0;");
                    project_contact.Attributes.Add("style", "display: flex;  flex-direction: column;  align-items: center;  padding: 40px 50px; gap: 30px;  width: 100%; background: #FFFFFF;\r\n\r\n            /* Inside auto layout */\r\n\r\n            flex: none;\r\n            order: 4;\r\n            align-self: stretch;\r\n            flex-grow: 0;");
                }
            }
        }

        protected void setImage()
        {
            // set image path for all asp:Image elements
            coverImage.ImageUrl = imagePathList[3];
            image1.ImageUrl = imagePathList[1];
            image2.ImageUrl = imagePathList[2];
        }

        protected void setImageDefault()
        {
            coverImage.ImageUrl = fallBackImageUrl;
            image1.ImageUrl = fallBackImageUrl;
            image2.ImageUrl = fallBackImageUrl;
        }
    }
}
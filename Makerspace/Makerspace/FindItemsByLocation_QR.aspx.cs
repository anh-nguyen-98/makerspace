using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class FindItemsByLocation_QR : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        { 
            int room_space_id = Convert.ToInt32(Request.QueryString["room_space_id"]);
            int object_id = Convert.ToInt32(Request.QueryString["object_id"]);
            int object_num = Convert.ToInt32(Request.QueryString["object_num"]);
            //System.Diagnostics.Debug.WriteLine(room_space_id);
        


            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand sqlCommand = new SqlCommand();
                String cmdString = "";
                if (room_space_id == 0)
                {
                    cmdString = "SELECT code, name, image, object_name, object_num FROM EquipmentItemLocation_View";
                    
                }

                else
                {
                    cmdString = "SELECT code, name, image, object_name,  object_num FROM EquipmentItemLocation_View where room_space_id= @room_space_id";
                    sqlCommand.Parameters.AddWithValue("@room_space_id", room_space_id);
                }

                if (object_id > 0)
                {
                    cmdString += " and object_id = @object_id";
                    sqlCommand.Parameters.AddWithValue("@object_id", object_id);
                }
                if (object_num > 0)
                {
                    cmdString += " and object_num = @object_num";
                    sqlCommand.Parameters.AddWithValue("@object_num", object_num);
                }
               
                sqlCommand.CommandText = cmdString;
                sqlCommand.Connection = con;
                con.Open();

                DataTable db = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                adapter.Fill(db);
                GridView1.DataSource = db;
                GridView1.DataBind();
            }
        }
    }
}
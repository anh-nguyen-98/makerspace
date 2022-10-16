using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class Management : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["level"] == null || Convert.ToInt16(Session["level"].ToString()) > 1)
            //{
            //    GridView1.Columns[0].Visible = false;

            Page.MaintainScrollPositionOnPostBack = true;
            
        }

        protected void InsertBtn_Click(object sender, EventArgs e)
        {
            string sql = "insert into equipment (code, name, fixed_asset) values(@code,@name, @fixed_asset)";
            Button addButton = (Button)sender;
            TextBox box1 = addButton.NamingContainer.FindControl("CodeInsertTextBox") as TextBox;
            TextBox box2 = addButton.NamingContainer.FindControl("NameInsertTextBox") as TextBox;
            TextBox box3 = addButton.NamingContainer.FindControl("FixedAssetInsertTextBox") as TextBox;
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                using (SqlCommand com = new SqlCommand(sql, con))
                {
                    com.Parameters.AddWithValue("@code", box1.Text);
                    com.Parameters.AddWithValue("@name", box2.Text);
                    try
                    {
                        com.Parameters.AddWithValue("@fixed_asset", Convert.ToInt64(box3.Text.ToString()));
                    }
                    catch (Exception ex)
                    {
                        if (ex.Source != null)
                        {
                            com.Parameters.AddWithValue("@fixed_asset", 0);
                        }
                        else
                        {
                            throw new Exception(ex.Message);
                        }
                    }
                    finally
                    {

                    }
                    

                    con.Open();
                    com.ExecuteNonQuery();
                }
            }
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    TableCell cell = e.Row.Cells[0];
            //    LinkButton l = (LinkButton)cell.Controls[1];
            //    l.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this record')");
            //}
        }
    }
}
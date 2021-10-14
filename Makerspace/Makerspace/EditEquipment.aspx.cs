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
	public partial class EditEquipment : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		
		}

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
			string idString = Input.Text;
			int id = Convert.ToInt32(idString);
			string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
			SqlConnection con = new SqlConnection(conString);
			SqlCommand cmd = new SqlCommand("uspReadEquip@eID", con);
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.AddWithValue("@eID", id);
			SqlDataAdapter adapter = new SqlDataAdapter(cmd);
			DataTable dt = new DataTable();
			adapter.Fill(dt);
            dvShippers.DataSource = dt;
            dvShippers.DataBind();
		

		}

        protected void dvShippers_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            dvShippers.ChangeMode(e.NewMode);
            Int32.TryParse(dvShippers.DataKey.Value.ToString(), out int id);
            System.Diagnostics.Debug.WriteLine("Success read id: mode changing: " + id);
            string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("uspReadEquip@eID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@eID", id);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dvShippers.DataSource = dt;
            dvShippers.DataBind();
        }

        //protected void dvShippers_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        //{
        //    if ((e.Exception == null) && e.AffectedRows.Equals(1))
        //    {
        //        lblMessage.Text = String.Format(
        //            "Equipment '{0}' successfully updated.",
        //            e.Keys["eID"]);
        //    }
        //    else
        //    {
        //        lblMessage.Text = "Unable to successfully update shipper.";
        //        e.ExceptionHandled = true;
        //    }
        //}
        protected void dvShippers_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            TextBox txtCompanyName = dvShippers.Rows[1].Cells[1].Controls[0] as TextBox;
          

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("uspUpdateEquipTest@eID", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eID", dvShippers.DataKey["eID"]);
                cmd.Parameters.AddWithValue("@eName", txtCompanyName.Text);


        
                conn.Open();

                cmd.ExecuteNonQuery();
                lblMessage.Text = String.Format(
                    "Equipment '{0}' successfully updated",
                    cmd.Parameters["@eID"].Value);

                dvShippers.ChangeMode(DetailsViewMode.ReadOnly);

                string conString = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd1 = new SqlCommand("uspReadEquip@eID", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                Int32.TryParse(dvShippers.DataKey.Value.ToString(), out int id);
                System.Diagnostics.Debug.WriteLine("Success read id: " + id);
                cmd1.Parameters.AddWithValue("@eID", id);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dvShippers.DataSource = dt;
                dvShippers.DataBind();
                
          
            }
        }


    }
}
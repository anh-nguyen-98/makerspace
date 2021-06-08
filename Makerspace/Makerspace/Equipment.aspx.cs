using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Makerspace
{
    public partial class Equipment : System.Web.UI.Page
    {   
        protected static string CONNSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CONNSTRING);
            con.Open();
            String sp = "";
            String param = "";
            if (RadioButton4.Checked)
            {

                sp = "uspReadEquipInfo@eLocation";
                param = "@eLocation";

            }
            if (RadioButton3.Checked)
            {
                sp = "uspReadEquipInfo@eName";
                param = "@eName";
            }

            if (RadioButton2.Checked)
            {
                sp = "uspReadEquipInfo@eFunction";
                param = "@eFunction";
            }
            if (!RadioButton2.Checked && !RadioButton3.Checked && !RadioButton4.Checked)
            {
                sp = "uspReadEquip";
            }
            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (param.Length != 0)
            {
                cmd.Parameters.AddWithValue(param, string.Format("%{0}%", TextBox1.Text));
            }
            SqlDataReader reader = cmd.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            con.Close();
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(CONNSTRING);
            con.Open();
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("DELETE FROM Equipment WHERE eID =" + id + "", con);


            cmd.ExecuteNonQuery();
            SqlCommand select = new SqlCommand("uspReadEquipInfo@eName", con);
            select.CommandType = CommandType.StoredProcedure;

            select.Parameters.AddWithValue("@eName", string.Format("%{0}%", TextBox1.Text));
            SqlDataAdapter adapter = new SqlDataAdapter(select);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();


        }
        protected void AddEquipBtn_Click(object sender, EventArgs e)
        {
            FormView1.Visible = true;
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            String eCode = ((TextBox)FormView1.FindControl("eCode")).Text;
            String eName = ((TextBox)FormView1.FindControl("eName")).Text;
            String eDesc = ((TextBox)FormView1.FindControl("eDesc")).Text;
            String eFunction = ((TextBox)FormView1.FindControl("eFunction")).Text;
            String eManual = ((TextBox)FormView1.FindControl("eManual")).Text;
            String eSafety = ((TextBox)FormView1.FindControl("eSafety")).Text;
            Boolean Training = ((CheckBox)FormView1.FindControl("Training")).Checked;
            int eTraining = 0;
            if (Training == true)
            {
                eTraining = 1;
            }

            SqlConnection con = new SqlConnection(CONNSTRING);
            SqlCommand insert = new SqlCommand("uspInsertEquip", con);
            
            insert.CommandType = CommandType.StoredProcedure;
            insert.Parameters.AddWithValue("eCode", eCode);
            insert.Parameters.AddWithValue("eName", eName);
            insert.Parameters.AddWithValue("eDesc", eDesc);
            insert.Parameters.AddWithValue("eFunction", eFunction);
            insert.Parameters.AddWithValue("eManual", eManual);
            insert.Parameters.AddWithValue("eSafety", eSafety);
            insert.Parameters.AddWithValue("eTraining", eTraining);

            con.Open();
            insert.ExecuteNonQuery();

            //Response.Write("Successfully added new euipment");

            BindGrid();
            con.Close();
           

        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    FormView1.ChangeMode(FormViewMode.ReadOnly);
                    Response.Write("Successfully added new equipment");
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Added');", true);
                    ResetInsertFormView();
                }
                else
                {   //If what exception is caught --> response according to exception. Below is the general response
                    Response.Write("An error occured during insert process.");
                    e.ExceptionHandled = true;
                    e.KeepInInsertMode = true;
                }
            }
            

            
        }

        protected void BindGrid()
        {
            SqlConnection con = new SqlConnection(CONNSTRING);
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Equipment", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void ResetInsertFormView()
        {
            ((TextBox)FormView1.FindControl("eCode")).Text = "";
            ((TextBox)FormView1.FindControl("eName")).Text = "";
            ((TextBox)FormView1.FindControl("eDesc")).Text = "";
            ((TextBox)FormView1.FindControl("eFunction")).Text = "";
            ((TextBox)FormView1.FindControl("eManual")).Text = "";
            ((TextBox)FormView1.FindControl("eSafety")).Text = "";
            ((TextBox)FormView1.FindControl("eTraining")).Text = "";
            FormView1.Visible = false;
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            FormView1.ChangeMode(e.NewMode);

        }


        protected void InsertItem_Click(object sender, FormViewInsertedEventArgs f)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void categoryList_Search(object sender, ListViewCommandEventArgs e)
        {
            String item = e.CommandName;
            if (item.Equals("Small Tools"))
            {
                //Sql undefined
            }
        }

        protected void CatBtn_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}
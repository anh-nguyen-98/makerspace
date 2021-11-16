using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class Equipment : System.Web.UI.Page
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

        protected void load()
        {
            using (SqlConnection con = new SqlConnection(CONSTRING)) 
            {
                SqlCommand cmd = new SqlCommand("uspReadAllEquipment");
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipGV.DataSource = dt;
                EquipGV.DataBind();
            }
        }

        private void loadDataFormViews (string equipment_code)
        {
            SqlConnection con = new SqlConnection(CONSTRING);
            SqlCommand selectItem = new SqlCommand("uspReadEquipmentItemsByEquipmentCode");
            selectItem.CommandType = CommandType.StoredProcedure;
            selectItem.Parameters.AddWithValue("@equipment_code", equipment_code);
            selectItem.Connection = con;
            con.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(selectItem);
            adapter.Fill(dt);
            ItemsCount = dt.Rows.Count;
            EquipmentFormView.DataSource = dt;
            EquipmentFormView.DataBind();
            ItemsFormView.DataSource = dt;
            ItemsFormView.DataBind();

        }
        protected void CategoryDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedId = Convert.ToInt32(CategoryDdl.SelectedValue);
            if (selectedId == 0)
            {
                load();
                return;
            }
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadEquipmentByCategory");
                cmd.Parameters.AddWithValue("@category_id", selectedId);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipGV.DataSource = dt;
                EquipGV.DataBind();
            }

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            string searchTerm = string.Format("%{0}%", searchBox.Text.Trim().ToLower());
            System.Diagnostics.Debug.WriteLine(searchTerm);
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadEquipmentBySearchTerm");
                cmd.Parameters.AddWithValue("@name", searchTerm);
                cmd.Parameters.AddWithValue("@code", searchTerm);
                cmd.Parameters.AddWithValue("@purpose", searchTerm);
                cmd.Parameters.AddWithValue("@category_name", searchTerm);
                cmd.Parameters.AddWithValue("@room_space_name", searchTerm);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipGV.DataSource = dt;
                EquipGV.DataBind();
            }
            
        }


        protected void EquipGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string code = EquipGV.DataKeys[rowIndex].Value.ToString();
                loadDataFormViews(code);
                EquipmentModalPopup.Show();
            }
        }
        protected void ClosePopupModalBtn_Click(object sender, EventArgs e)
        {
            EquipmentModalPopup.Hide();
        }

        protected void ItemsFormView_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            EquipmentModalPopup.Show();
            ItemsFormView.PageIndex = e.NewPageIndex;
            string code = EquipmentFormView.DataKey.Value.ToString();
            System.Diagnostics.Debug.WriteLine(code);
            loadDataFormViews(code);
        }

        protected void EquipmentFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            // Minh fills in code
            EquipmentFormView.ChangeMode(e.NewMode);
            if (e.NewMode.Equals(FormViewMode.Edit))
            {
                string code = EquipmentFormView.DataKey.Value.ToString();
                System.Diagnostics.Debug.WriteLine("edit", code);
                loadDataFormViews(code);

            }

        }
        protected void EquipmentFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            // Minh fills in code
            if (e.CommandName.ToString() == "New")
            {
                ItemsFormView.Visible = false;
            }
            else
            {
                ItemsFormView.Visible = true;
            }
            if (e.CommandName.ToString() == "Cancel")
            {
                EquipmentModalPopup.Hide();
            } else {
                EquipmentModalPopup.Show();
            }  
        }

        protected void EquipmentFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            // Minh fills in code
            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
        }

        protected void EquipmentFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            // Minh fills in code
        }



        protected void AddNewEquipment_Click(object sender, EventArgs e)
        {
            // Minh fills in code
            EquipmentFormView.ChangeMode(FormViewMode.Insert);
            ItemsFormView.Visible = false;
            EquipmentModalPopup.Show();
        }

        protected void EquipmentFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            // Minh fills in code
        }
        protected void EquipmentFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            // Minh fills in code
        }



        protected void EquipmentFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            // Minh fills in code
        }

        protected void EquipmentFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            // Minh fills in code
        }

        protected void ItemsFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            // Minh fills in code
            ItemsFormView.ChangeMode(e.NewMode);
        }
    }

}

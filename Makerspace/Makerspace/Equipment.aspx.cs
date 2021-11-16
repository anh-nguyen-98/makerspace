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

        //Post back data
        //Bind GridView
        protected void load()
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd = new SqlCommand("uspReadAllEquipment");
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable db = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(db);
                EquipGV.DataSource = db;
                EquipGV.DataBind();
            }
        }
        


        protected void EquipGV_PageIndexChanging(object sender, GridViewPageEventArgs e, Label MessageLabel)
        {
            if (AddItemFV.CurrentMode == FormViewMode.Edit)
            {
                e.Cancel = true;
                MessageLabel.Text = "Please finish the form before move to new page.";
            }
            EquipGV.PageIndex = e.NewPageIndex;

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


        //Bind Form View results
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


      // START: MINH CAN REUSE THESE METHODS BELOW FOR FILLING THE LOGIC METHODS ABOVE
        //Update equipment info 
        protected void EquipmentFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {

            Int32.TryParse(EquipmentFormView.DataKey.Value.ToString(), out int eID);
            string eCode = ((TextBox)EquipmentFormView.FindControl("eCodeUpdateTextBox")).Text;
            string eName = ((TextBox)EquipmentFormView.FindControl("eNameUpdateTextBox")).Text;
            string eDesc = ((TextBox)EquipmentFormView.FindControl("eDescUpdateTextBox")).Text;
            string eFunction = ((TextBox)EquipmentFormView.FindControl("eFunctionUpdateTextBox")).Text;
            string eManual = ((TextBox)EquipmentFormView.FindControl("eManualUpdateTextBox")).Text;
            string eSafety = ((TextBox)EquipmentFormView.FindControl("eSafetyUpdateTextBox")).Text;
            int eTraining = Convert.ToInt32(((CheckBox)EquipmentFormView.FindControl("eTrainingCheckBox")).Checked ? 1 : 0);

            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("uspUpdateEquip@eID", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eID", eID);
                cmd.Parameters.AddWithValue("@eName", eName);
                cmd.Parameters.AddWithValue("@eCode", eCode);
                cmd.Parameters.AddWithValue("@eDesc", eDesc);
                cmd.Parameters.AddWithValue("@eFunction", eFunction);
                cmd.Parameters.AddWithValue("@eManual", eManual);
                cmd.Parameters.AddWithValue("@eSafety", eSafety);
                cmd.Parameters.AddWithValue("@eTraining", eTraining);
                con.Open();
                cmd.ExecuteNonQuery();

            }

            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
            BindFV(EquipmentFormView, "uspReadEquip@eID", "@eID", eID);

        }

        //Verify Equip Info Updates
        protected void EquipmentFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e, Label MessageLabel)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    String keyFieldValue = e.Keys["eName"].ToString();
                    MessageLabel.Text = keyFieldValue + "has been updated successfully";
                }
                else
                {
                    MessageLabel.Text = "An errror occured during the update process";
                    e.ExceptionHandled = true;
                    e.KeepInEditMode = true;
                }
            }
        }
        //Delete equipment on form view
        protected void EquipmentFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(EquipmentFormView.DataKey.Value);
            int eID = Convert.ToInt32(((Label)EquipmentFormView.FindControl("eIDLabel")).Text);

            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM EquipmentItem WHERE itemID = " + id + "", con))
            {
                con.Open();
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();

            }
            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);

            BindFV(EquipmentFormView, "uspReadEquipItem@itemID", "@itemID", 0);
            SqlCommand selectCmd = new SqlCommand("uspReadEquipItem@eID", new SqlConnection(CONSTRING));
            selectCmd.CommandType = CommandType.StoredProcedure;
            selectCmd.Parameters.AddWithValue("@eID", eID);
            BindGV(EquipGV, selectCmd, ItemCount);
        }


        //Verify deleting equipment process
        protected void EquipmentFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e, Label MessageLabel)
        {
            if (e.Exception == null)
            {
                MessageLabel.Text = "Equipment Deleted";
            }
            else
            {
                MessageLabel.Text = "Could not delete equipment";
                e.ExceptionHandled = true;
            }
        }


        // add Equipment Sub-item
        protected void AddItemFV_ItemInserting(object sender, EventArgs e)
        {
            int eID = Convert.ToInt32(((TextBox)AddItemFV.FindControl("eIDTextBox")).Text);
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("uspInsertEquipItem", con))
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@eID", eID);

                cmd.Parameters.AddWithValue("@itemStatus", Convert.ToInt32(((TextBox)AddItemFV.FindControl("itemStatusTextBox")).Text));
                cmd.Parameters.AddWithValue("@locID", Convert.ToInt32(((TextBox)AddItemFV.FindControl("locIDTextBox")).Text));
                cmd.Parameters.AddWithValue("@itemDeliveryDate", ((Calendar)AddItemFV.FindControl("DeliveryDateCalendar"))
                    .SelectedDate.ToString());
                cmd.Parameters.AddWithValue("@itemRemovalDate", ((Calendar)AddItemFV.FindControl("RemovalDateCalendar"))
                    .SelectedDate.ToString());
                cmd.ExecuteNonQuery();

            }
            AddItemFV.ChangeMode(FormViewMode.ReadOnly);

            SqlCommand selectCmd = new SqlCommand("uspReadEquipItem@eID", new SqlConnection(CONSTRING));
            selectCmd.CommandType = CommandType.StoredProcedure;
            selectCmd.Parameters.AddWithValue("@eID", eID);

            BindGV(ItemGV, selectCmd, ItemCount);
            int itemId = Convert.ToInt32(ItemGV.DataKeys[ItemGV.Rows.Count - 1].Value.ToString());
            BindFV(AddItemFV, "uspReadEquipItem@itemID", "@itemID", itemId);
        }

        ////Verify inserting process
        //protected void AddItemFV_ItemInserted(object sender, FormViewInsertedEventArgs e, Label MessageLabel)
        //{
        //    if (e.Exception == null)
        //    {
        //        if (e.AffectedRows == 1)
        //        {
        //            MessageLabel.Text = "New equipment added successfully";
        //            e.KeepInInsertMode = true;
        //        }
        //        else
        //        {
        //            MessageLabel.Text = e.Exception.Message;
        //            e.ExceptionHandled = true;
        //            e.KeepInInsertMode = true;
        //        }
        //    }
        //}

        // Delete Equipment Sub Item
        protected void ItemGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(ItemGV.Rows[e.RowIndex].FindControl("itemID").ToString());
            int eID = Convert.ToInt32(((Label)EquipmentFormView.FindControl("eIDLabel")).Text);
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM EquipmentItem WHERE itemID = " + id + "", con))
            {
                con.Open();
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();

            }
            
            SqlCommand selectCmd = new SqlCommand("uspReadAllEquipment");
            selectCmd.CommandType = CommandType.StoredProcedure;
            BindGV(EquipGV, selectCmd, ItemCount);
        }

        // Verify deleting Equipment Sub Item
        protected void ItemGV_RowDeleted(object sender, GridViewDeletedEventArgs e, Label Message)
        {
            if (e.Exception == null)
            {
                Message.Text = "Row deleted successfully.";
            }
            else
            {
                Message.Text = "An error occurred while attempting to delete the row.";
                e.ExceptionHandled = true;
            }

        }
      //END
    }

}

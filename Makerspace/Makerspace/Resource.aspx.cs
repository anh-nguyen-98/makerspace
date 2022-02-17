using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Makerspace
{
    public partial class Resource : System.Web.UI.Page
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
                EquipLV.DataSource = db;
                EquipLV.DataBind();
            }
        }

        private void loadDataFormViews (int equipment_id)
        {
            SqlConnection con = new SqlConnection(CONSTRING);
            SqlCommand selectItem = new SqlCommand("uspReadEquipmentItemsByEquipmentId");
            selectItem.CommandType = CommandType.StoredProcedure;
            selectItem.Parameters.AddWithValue("@equipment_id", equipment_id);
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
                int equipment_id = Convert.ToInt32(EquipGV.DataKeys[rowIndex].Value.ToString());
                loadDataFormViews(equipment_id);
                EquipmentFormView.Visible = true;
                ItemsFormView.Visible = true;
                EquipmentModalPopup.Show();
            }
        }
        protected void ClosePopupModalBtn_Click(object sender, EventArgs e)
        {
            EquipmentFormView.Visible = true;
            ItemsFormView.Visible = true;
            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
            ItemsFormView.ChangeMode(FormViewMode.ReadOnly);
            EquipmentModalPopup.Hide();
        }

        protected void ItemsFormView_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            EquipmentModalPopup.Show();
            ItemsFormView.PageIndex = e.NewPageIndex;
            int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value.ToString());
            loadDataFormViews(equipment_id);
        }

        protected void EquipmentFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            // Minh fills in code
            EquipmentFormView.ChangeMode(e.NewMode);
            if (e.NewMode.Equals(FormViewMode.Edit))
            {
                int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value.ToString());
                loadDataFormViews(equipment_id);

            }

        }
        protected void EquipmentFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            // Minh fills in code
            if (e.CommandName.ToString() == "New")
            {
                ItemsFormView.Visible = false;
                EquipmentFormView.Visible = true;
            }
            else if (e.CommandName.ToString() == "Edit")
            {
                ItemsFormView.Visible = false;
            }
            else if (e.CommandName.ToString() == "New Item")
            {
                EquipmentFormView.Visible = false;
                ItemsFormView.ChangeMode(FormViewMode.Insert); 
            }
            else
            {
                EquipmentFormView.Visible = true;
                ItemsFormView.Visible = true;
            }
            if (e.CommandName.ToString() == "Cancel")
            {
                EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                ItemsFormView.ChangeMode(FormViewMode.ReadOnly);
                if (EquipmentFormView.DataKey.Value == null) return;
                int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value.ToString());
                loadDataFormViews(equipment_id);
                EquipmentFormView.Visible = true;
                ItemsFormView.Visible = true;
                EquipmentModalPopup.Hide();
            } 
            else {
                EquipmentModalPopup.Show();
            }
        }

        protected void EquipmentFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            // more validation needed for equipment code format
            string code = ((TextBox)EquipmentFormView.FindControl("CodeTextBox")).Text;
            string name = ((TextBox)EquipmentFormView.FindControl("NameTextBox")).Text;
            string description = ((TextBox)EquipmentFormView.FindControl("DescriptionTextBox")).Text;
            string function = ((TextBox)EquipmentFormView.FindControl("FunctionTextBox")).Text;
            string instruction = ((TextBox)EquipmentFormView.FindControl("InstructionTextBox")).Text;
            CheckBox training = (CheckBox)EquipmentFormView.FindControl("Trainingcheckbox");
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("uspInsertEquipment", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@code", code);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@purpose", function);
                cmd.Parameters.AddWithValue("@instruction", instruction);
                if (training.Checked)
                {
                    cmd.Parameters.AddWithValue("@training", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@training", 0);
                }
                con.Open();
                int affectedRows = 0;
                try
                {
                    affectedRows = cmd.ExecuteNonQuery();
                    EquipmentFormView_ItemInserted(sender, new FormViewInsertedEventArgs(affectedRows, null));
                    EquipmentModalPopup.Hide();
                    EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                    load();
                }
                catch (Exception exception)
                {
                    EquipmentFormView_ItemInserted(sender, new FormViewInsertedEventArgs(affectedRows, exception));
                }
            }
        }

        protected void EquipmentFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1 || e.AffectedRows == 2)
                {
                    string message = "New equipment added successfully";
                    string script = "window.onload = function(){ alert('" + message + "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
                //else
                //{
                //    string message = e.exception.message; ==>  try getting message from null object reference is invalid (e.exception = null)
                //    string script = "window.onload = function(){ alert('" + message + "')};";
                //    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                //    e.ExceptionHandled = true;
                //    e.KeepInInsertMode = false;
                //}
            }
            else
            {
                //string message = e.Exception.Message; ==> accessing e.Exception.Message throws error for unknown reason
                // the message is hardcoded temporarily, for duplicate key might be the only error from user in this case. More check is required.
                string message = "Equipment code already exists";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }

        protected void AddNewEquipment_Click(object sender, EventArgs e)
        {
            //target control id to add new equipment button
            EquipmentFormView.ChangeMode(FormViewMode.Insert);
            ItemsFormView.Visible = false;
            EquipmentModalPopup.Show();
        }

        protected void EquipmentFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Int32.TryParse(EquipmentFormView.DataKey.Value.ToString(), out int id);
            // equipment code is uneditable
            //string code = ((TextBox)EquipmentFormView.FindControl("eCodeUpdateTextBox")).Text;
            string name = ((TextBox)EquipmentFormView.FindControl("eNameUpdateTextBox")).Text;
            string description = ((TextBox)EquipmentFormView.FindControl("eDescUpdateTextBox")).Text;
            string purpose = ((TextBox)EquipmentFormView.FindControl("eFunctionUpdateTextBox")).Text;
            string instruction = ((TextBox)EquipmentFormView.FindControl("eInstructionUpdateTextBox")).Text;
            //string eSafety = ((TextBox)EquipmentFormView.FindControl("eSafetyUpdateTextBox")).Text;
            int training = Convert.ToInt32(((CheckBox)EquipmentFormView.FindControl("eTrainingUpdateCheckBox")).Checked ? 1 : 0);

            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("uspUpdateEquip@eID", con))
            {
                int affectedRows = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eID", id);
                cmd.Parameters.AddWithValue("@eName", name);
                //cmd.Parameters.AddWithValue("@eCode", code);
                cmd.Parameters.AddWithValue("@eDesc", description);
                cmd.Parameters.AddWithValue("@eFunction", purpose);
                cmd.Parameters.AddWithValue("@eInstruction", instruction);
                //cmd.Parameters.AddWithValue("@eSafety", eSafety);
                cmd.Parameters.AddWithValue("@eTraining", training);
                con.Open();
                try
                {
                    affectedRows = cmd.ExecuteNonQuery();
                    EquipmentFormView_ItemUpdated(sender, new FormViewUpdatedEventArgs(affectedRows, null));
                    EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                    //BindFV(EquipmentFormView, "uspReadEquipment@id", "@id", id);
                    // EquipmentFormview and ItemsFormView use the same SQL source for databinding ==> loadDataFormViews(id) helps rebind both FVs with same SQL resource
                    loadDataFormViews(id);
                    load(); // gridview reloading needed
                    EquipmentModalPopup.Show();
                }
                catch (Exception exception)
                {
                    EquipmentFormView_ItemUpdated(sender, new FormViewUpdatedEventArgs(affectedRows, exception));
                }

            }

        }
        protected void EquipmentFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    // String keyFieldValue = e.Keys["eName"].ToString(); ==> e.keys["eName"] not existed
                    String keyFieldValue = EquipGV.SelectedRow.Cells[0].Text.Trim(); // get equipment code of EquipmentFormview via the code of selected row Gridview
                    string message = "Equipment " + keyFieldValue + " has been updated successfully";
                    string script = "window.onload = function(){ alert('" + message + "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
                //else
                //{
                //    string message = e.Exception.Message; ==>  try getting message from null object reference is invalid (e.exception = null)
                //    string script = "window.onload = function(){ alert('" + message + "')};";
                //    ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                //    e.ExceptionHandled = true;
                //    e.KeepInEditMode = true;
                //}
            }
            else
            {
                string message = e.Exception.Message;
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }



        protected void EquipmentFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(EquipmentFormView.DataKey.Value);

            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Equipment WHERE id = " + id + "", con))
            {
                con.Open();
                cmd.CommandType = CommandType.Text;
                int affectedRows = 0;
                try
                {
                    affectedRows = cmd.ExecuteNonQuery();
                    EquipmentFormView_ItemDeleted(sender, new FormViewDeletedEventArgs(affectedRows, null));
                } catch (Exception exception)
                {
                    EquipmentFormView_ItemDeleted(sender, new FormViewDeletedEventArgs(affectedRows, exception));
                }
                

            }
            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
            SqlCommand selectCmd = new SqlCommand("uspReadAllEquipment", new SqlConnection(CONSTRING));
            selectCmd.CommandType = CommandType.StoredProcedure;
            selectCmd.Connection = new SqlConnection(CONSTRING);

            EquipmentModalPopup.Hide();

            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(selectCmd);
            adapter.Fill(dt);
            EquipGV.DataSource = dt;
            EquipGV.DataBind();


        }

        protected void EquipmentFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    string message = "Equipment deleted";
                    string script = "window.onload = function(){ alert('" + message + "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
                //else
                //{
                //    string message = e.Exception.Message;
                //    string script = "window.onload = function(){ alert('" + message + "')};";
                //    ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                //    e.ExceptionHandled = true;
                //}
            }
            else
            {
                string message = e.Exception.Message;
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
            }
        }

        protected void ItemsFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            ItemsFormView.ChangeMode(e.NewMode);
            //Int32.TryParse(ItemsFormView.DataKey.Value.ToString(), out int id);
            //BindFV(ItemsFormView, "uspReadEquipmentItemsByEquipmentId", "@equipmentId", id);
            if (e.NewMode.Equals(FormViewMode.Edit))
            {
                int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value.ToString());
                loadDataFormViews(equipment_id);

            }
        }

        //---------------SAMPLE------------------------------------------------------------------------//
        // START: MINH CAN REUSE THESE METHODS BELOW FOR FILLING THE LOGIC METHODS ABOVE
        //Update equipment info 
        //protected void EquipmentFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        //{
        //    if (e.NewMode.Equals(FormViewMode.Edit))
                     
        //                 int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value.ToString());
        //        loadDataFormViews(equipment_id);
        //        { }

        //}


    protected void DeliveryDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            EquipmentModalPopup.Show();
        }

        protected void ItemsFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            // Minh fills in code
            if (e.CommandName.ToString() == "Edit")
            {
                EquipmentFormView.Visible = false;
                ItemsFormView.Visible = true;
            }
            else if (e.CommandName.ToString() == "Cancel")
            {
                EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                ItemsFormView.ChangeMode(FormViewMode.ReadOnly);
                int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value.ToString());
                loadDataFormViews(equipment_id);
                EquipmentFormView.Visible = true;
                ItemsFormView.Visible = true;
            }
            EquipmentModalPopup.Show();
        }
        //---------------------------------------------------------------------------------------------------------//

        protected void ItemsFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            // Minh fills in code
        }

        protected void ItemsFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            // Minh fills in code
        }

        protected void ItemsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            // Minh fills in code
        }

        protected void ItemsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            // Minh fills in code
        }

        protected void ItemsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            // Minh fills in code
        }

        protected void ItemsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            // Minh fills in code
        }

//--------------------------------------------------------------------------------------------------------//
        // START: MINH CAN REUSE THESE METHODS BELOW FOR FILLING THE LOGIC METHODS ABOVE
        // Update equipment info 
//         protected void EquipmentFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
//         {

//            Int32.TryParse(EquipmentFormView.DataKey.Value.ToString(), out int eID);
//            string eCode = ((TextBox)EquipmentFormView.FindControl("eCodeUpdateTextBox")).Text;
//            string eName = ((TextBox)EquipmentFormView.FindControl("eNameUpdateTextBox")).Text;
//            string eDesc = ((TextBox)EquipmentFormView.FindControl("eDescUpdateTextBox")).Text;
//            string eFunction = ((TextBox)EquipmentFormView.FindControl("eFunctionUpdateTextBox")).Text;
//            string eManual = ((TextBox)EquipmentFormView.FindControl("eManualUpdateTextBox")).Text;
//            string eSafety = ((TextBox)EquipmentFormView.FindControl("eSafetyUpdateTextBox")).Text;
//            int eTraining = Convert.ToInt32(((CheckBox)EquipmentFormView.FindControl("eTrainingCheckBox")).Checked ? 1 : 0);

//            using (SqlConnection con = new SqlConnection(CONSTRING))
//            using (SqlCommand cmd = new SqlCommand("uspUpdateEquip@eID", con))
//            {
//                cmd.CommandType = CommandType.StoredProcedure;
//                cmd.Parameters.AddWithValue("@eID", eID);
//                cmd.Parameters.AddWithValue("@eName", eName);
//                cmd.Parameters.AddWithValue("@eCode", eCode);
//                cmd.Parameters.AddWithValue("@eDesc", eDesc);
//                cmd.Parameters.AddWithValue("@eFunction", eFunction);
//                cmd.Parameters.AddWithValue("@eManual", eManual);
//                cmd.Parameters.AddWithValue("@eSafety", eSafety);
//                cmd.Parameters.AddWithValue("@eTraining", eTraining);
//                con.Open();
//                cmd.ExecuteNonQuery();

//            }

//            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
//            BindFV(EquipmentFormView, "uspReadEquip@eID", "@eID", eID);

//         }

        //Verify Equip Info Updates
//         protected void EquipmentFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e, Label MessageLabel)
//         {
//            if (e.Exception == null)
//            {
//                if (e.AffectedRows == 1)
//                {
//                    String keyFieldValue = e.Keys["eName"].ToString();
//                    MessageLabel.Text = keyFieldValue + "has been updated successfully";
//                }
//                else
//                {
//                    MessageLabel.Text = "An errror occured during the update process";
//                    e.ExceptionHandled = true;
//                    e.KeepInEditMode = true;
//                }
//            }
//         }
//         //Delete equipment on form view
//         protected void EquipmentFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
//         {
//            int id = Convert.ToInt32(EquipmentFormView.DataKey.Value);
//            int eID = Convert.ToInt32(((Label)EquipmentFormView.FindControl("eIDLabel")).Text);

//            using (SqlConnection con = new SqlConnection(CONSTRING))
//            using (SqlCommand cmd = new SqlCommand("DELETE FROM EquipmentItem WHERE itemID = " + id + "", con))
//            {
//                con.Open();
//                cmd.CommandType = CommandType.Text;
//                cmd.ExecuteNonQuery();

//            }
//            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);

//            BindFV(EquipmentFormView, "uspReadEquipItem@itemID", "@itemID", 0);
//            SqlCommand selectCmd = new SqlCommand("uspReadEquipItem@eID", new SqlConnection(CONSTRING));
//            selectCmd.CommandType = CommandType.StoredProcedure;
//            selectCmd.Parameters.AddWithValue("@eID", eID);
//            BindGV(EquipGV, selectCmd, ItemCount);
//         }


//         //Verify deleting equipment process
//         protected void EquipmentFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e, Label MessageLabel)
//         {
//            if (e.Exception == null)
//            {
//                MessageLabel.Text = "Equipment Deleted";
//            }
//            else
//            {
//                MessageLabel.Text = "Could not delete equipment";
//                e.ExceptionHandled = true;
//            }
//         }


//         // add Equipment Sub-item
//         protected void AddItemFV_ItemInserting(object sender, EventArgs e)
//         {
//            int eID = Convert.ToInt32(((TextBox)AddItemFV.FindControl("eIDTextBox")).Text);
//            using (SqlConnection con = new SqlConnection(CONSTRING))
//            using (SqlCommand cmd = new SqlCommand("uspInsertEquipItem", con))
//            {
//                con.Open();
//                cmd.CommandType = CommandType.StoredProcedure;

//                cmd.Parameters.AddWithValue("@eID", eID);

//                cmd.Parameters.AddWithValue("@itemStatus", Convert.ToInt32(((TextBox)AddItemFV.FindControl("itemStatusTextBox")).Text));
//                cmd.Parameters.AddWithValue("@locID", Convert.ToInt32(((TextBox)AddItemFV.FindControl("locIDTextBox")).Text));
//                cmd.Parameters.AddWithValue("@itemDeliveryDate", ((Calendar)AddItemFV.FindControl("DeliveryDateCalendar"))
//                    .SelectedDate.ToString());
//                cmd.Parameters.AddWithValue("@itemRemovalDate", ((Calendar)AddItemFV.FindControl("RemovalDateCalendar"))
//                    .SelectedDate.ToString());
//                cmd.ExecuteNonQuery();

//            }
//            AddItemFV.ChangeMode(FormViewMode.ReadOnly);

//            SqlCommand selectCmd = new SqlCommand("uspReadEquipItem@eID", new SqlConnection(CONSTRING));
//            selectCmd.CommandType = CommandType.StoredProcedure;
//            selectCmd.Parameters.AddWithValue("@eID", eID);

//            BindGV(ItemGV, selectCmd, ItemCount);
//            int itemId = Convert.ToInt32(ItemGV.DataKeys[ItemGV.Rows.Count - 1].Value.ToString());
//            BindFV(AddItemFV, "uspReadEquipItem@itemID", "@itemID", itemId);
//         }

//         ////Verify inserting process
//         //protected void AddItemFV_ItemInserted(object sender, FormViewInsertedEventArgs e, Label MessageLabel)
//         //{
//         //    if (e.Exception == null)
//         //    {
//         //        if (e.AffectedRows == 1)
//         //        {
//         //            MessageLabel.Text = "New equipment added successfully";
//         //            e.KeepInInsertMode = true;
//         //        }
//         //        else
//         //        {
//         //            MessageLabel.Text = e.Exception.Message;
//         //            e.ExceptionHandled = true;
//         //            e.KeepInInsertMode = true;
//         //        }
//         //    }
//         //}

//         // Delete Equipment Sub Item
//         protected void ItemGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
//         {
//            int id = Convert.ToInt32(ItemGV.Rows[e.RowIndex].FindControl("itemID").ToString());
//            int eID = Convert.ToInt32(((Label)EquipmentFormView.FindControl("eIDLabel")).Text);
//            using (SqlConnection con = new SqlConnection(CONSTRING))
//            using (SqlCommand cmd = new SqlCommand("DELETE FROM EquipmentItem WHERE itemID = " + id + "", con))
//            {
//                con.Open();
//                cmd.CommandType = CommandType.Text;
//                cmd.ExecuteNonQuery();

//            }

//            SqlCommand selectCmd = new SqlCommand("uspReadAllEquipment");
//            selectCmd.CommandType = CommandType.StoredProcedure;
//            BindGV(EquipGV, selectCmd, ItemCount);
//         }

//         // Verify deleting Equipment Sub Item
//         protected void ItemGV_RowDeleted(object sender, GridViewDeletedEventArgs e, Label Message)
//         {
//            if (e.Exception == null)
//            {
//                Message.Text = "Row deleted successfully.";
//            }
//            else
//            {
//                Message.Text = "An error occurred while attempting to delete the row.";
//                e.ExceptionHandled = true;
//            }

//         }
        //END
    }

}

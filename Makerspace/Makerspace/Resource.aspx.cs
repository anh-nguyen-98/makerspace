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
        //Bind ListView
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

            //if there is no subitem for an equipment
            if (ItemsFormView.DataItemCount == 0)
            {
                //temporary solution, a text box at forms view is preffered
                string message = "There is no available item for this equipment.";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                SqlCommand sqlCommand = new SqlCommand("SELECT id as equipment_id, name, code, description, purpose, instruction, training FROM Equipment WHERE id=" + equipment_id);
                sqlCommand.Connection = con;
                dt = new DataTable();
                adapter = new SqlDataAdapter(sqlCommand);
                adapter.Fill(dt);
                EquipmentFormView.DataSource = dt;
                EquipmentFormView.DataBind();
        }
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
            else if (e.CommandName.ToString() == "Delete")
            {
   
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
                    if (code.Length > 0) //equipment code must not be null
                    {
                    affectedRows = cmd.ExecuteNonQuery();
                    EquipmentFormView_ItemInserted(sender, new FormViewInsertedEventArgs(affectedRows, null));
                    EquipmentModalPopup.Hide();
                    EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                    load();
                }
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
                string message = "An error has occured. Please try again.";
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
                con.Open();
                try
                {
                    affectedRows = cmd.ExecuteNonQuery();
                    EquipmentFormView_ItemUpdated(sender, new FormViewUpdatedEventArgs(affectedRows, null));
                    EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                    //BindFV(EquipmentFormView, "uspReadEquipment@id", "@id", id);
                    // EquipmentFormview and ItemsFormView use the same SQL source for databinding ==> loadDataFormViews(id) helps rebind both FVs with same SQL resource
                    loadDataFormViews(id);
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
                    String keyFieldValue = EquipGV.SelectedRow.Cells[1].Text.Trim(); 
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
                string message = "An error has occured. Please check your input";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }



        protected void EquipmentFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(EquipmentFormView.DataKey.Value);

            //Since EquipmentItem has foreign key constraint from Equipment table,
            //we have to delete records in EquipmentItem first then delete record in Equipment
            //but MSSQL allows to delete directly in Equipment -> is this be concerned?
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Equipment WHERE id = " + id + "", con))
            {
                con.Open();
                cmd.CommandType = CommandType.Text;
                int affectedRows = 0;
                using (SqlCommand deleteCmd = new SqlCommand("DELETE FROM Equipment WHERE id = " + id + "", con))
                {
                try
                {
                        affectedRows = deleteCmd.ExecuteNonQuery();
                    EquipmentFormView_ItemDeleted(sender, new FormViewDeletedEventArgs(affectedRows, null));
                    }
                    catch (Exception exception)
                {
                    EquipmentFormView_ItemDeleted(sender, new FormViewDeletedEventArgs(affectedRows, exception));
                }
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
                string message = "An error has occured. Please check your input";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
            }
        }

        protected void ItemsFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            ItemsFormView.ChangeMode(e.NewMode);
            if (e.NewMode.Equals(FormViewMode.Edit))
            {
                int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value.ToString());
                loadDataFormViews(equipment_id);

            }
        }

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
            if (e.CommandName.ToString() == "Update")
            {
                EquipmentFormView.Visible = true;
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
            int equipment_id = Convert.ToInt32(EquipmentFormView.DataKey.Value);
            int location_id = Convert.ToInt32(((TextBox)ItemsFormView.FindControl("locIDTextBox")).Text);
            string itemDeliveryDate = ((TextBox)ItemsFormView.FindControl("DeliveryDateTextbox")).Text;
            string itemRemovalDate = ((TextBox)ItemsFormView.FindControl("RemovalDateTextbox")).Text;
            int itemStatus = ((CheckBox)ItemsFormView.FindControl("statusCheckBox")).Checked ? 1 : 0;
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("uspInsertEquipItem", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@equipment_id", equipment_id);
                cmd.Parameters.AddWithValue("@location_id", location_id);
                cmd.Parameters.AddWithValue("@status", itemStatus);
                cmd.Parameters.AddWithValue("@delivered_at", itemDeliveryDate);
                cmd.Parameters.AddWithValue("@removed_at", itemRemovalDate);
                con.Open();
                int affectedRows = 0;
                try
                {
                    affectedRows = cmd.ExecuteNonQuery();
                    ItemsFormView_ItemInserted(sender, new FormViewInsertedEventArgs(affectedRows, null));
                    EquipmentModalPopup.Hide();
                    EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                    ItemsFormView.ChangeMode(FormViewMode.ReadOnly);
                    load();
                    loadDataFormViews(equipment_id);
        }
                catch (Exception exception)
                {
                    ItemsFormView_ItemInserted(sender, new FormViewInsertedEventArgs(affectedRows, exception));
                }
            }
        }

        protected void ItemsFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1 || e.AffectedRows == 2)
                {
                    string message = "New item added successfully";
                    string script = "window.onload = function(){ alert('" + message + "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
            }
            else
            {
                string message = "An error has occured. Please check your input";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }

        protected void ItemsFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Int32.TryParse(ItemsFormView.DataKey.Value.ToString(), out int id);
            int location_id = Convert.ToInt32(((TextBox)ItemsFormView.FindControl("locIDTextBoxEdit")).Text);
            string itemDeliveryDate = ((TextBox)ItemsFormView.FindControl("DeliveryDateTextboxEdit")).Text;
            string itemRemovalDate = ((TextBox)ItemsFormView.FindControl("RemovalDateTextboxEdit")).Text;         
            int itemStatus = Convert.ToInt32(((CheckBox)ItemsFormView.FindControl("statusCheckBoxEdit")).Checked ? 1 : 0);

            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("uspUpdateEquipItem@id", con))
            {
                int affectedRows = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@location_id", location_id);
                cmd.Parameters.AddWithValue("@status", itemStatus);
                cmd.Parameters.AddWithValue("@delivered_at", itemDeliveryDate);
                cmd.Parameters.AddWithValue("@removed_at", itemRemovalDate);
                con.Open();
                try
                {
                    affectedRows = cmd.ExecuteNonQuery();
                    ItemsFormView_ItemUpdated(sender, new FormViewUpdatedEventArgs(affectedRows, null));
                    EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
                    ItemsFormView.ChangeMode(FormViewMode.ReadOnly);
                    Int32.TryParse(EquipmentFormView.DataKey.Value.ToString(), out int equipment_id);
                    loadDataFormViews(equipment_id);
                    EquipmentModalPopup.Show();
        }
                catch (Exception exception)
                {
                    ItemsFormView_ItemUpdated(sender, new FormViewUpdatedEventArgs(affectedRows, exception));
                }

            }
        }

        protected void ItemsFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    Int32.TryParse(ItemsFormView.DataKey.Value.ToString(), out int keyFieldValue);
                    string message = "Item " + keyFieldValue + " has been updated successfully";
                    string script = "window.onload = function(){ alert('" + message + "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
            }
            else
            {
                string message = "An error has occured. Please check your input";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }

        protected void ItemsFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(ItemsFormView.DataKey.Value);

            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM EquipmentItem WHERE id = " + id + "", con))
            {
                con.Open();
                cmd.CommandType = CommandType.Text;
                int affectedRows = 0;
                try
                {
                    affectedRows = cmd.ExecuteNonQuery();
                    ItemsFormView_ItemDeleted(sender, new FormViewDeletedEventArgs(affectedRows, null));
                }
                catch (Exception exception)
        {
                    ItemsFormView_ItemDeleted(sender, new FormViewDeletedEventArgs(affectedRows, exception));
        }

            }
            EquipmentFormView.ChangeMode(FormViewMode.ReadOnly);
            ItemsFormView.ChangeMode(FormViewMode.ReadOnly);
            Int32.TryParse(EquipmentFormView.DataKey.Value.ToString(), out int equipment_id);
            loadDataFormViews(equipment_id);
            EquipmentModalPopup.Show();

        }

        protected void ItemsFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows >= 1)
                {
                    string message = "Equipment item deleted";
                    string script = "window.onload = function(){ alert('" + message + "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
            else
            {
                string message = "An error has occured. Item cannot be deleted.";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
            }
        }

        protected void RemovalDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            EquipmentModalPopup.Show();
        }

        protected void EquipGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.RowIndex);
            int equipment_id = Convert.ToInt32(EquipGV.DataKeys[rowIndex].Value.ToString());
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                con.Open();
                int affectedRows = 0;
                using (SqlCommand deleteCmd = new SqlCommand("DELETE FROM Equipment WHERE id = " + equipment_id + "", con))
                {
                    try
                    {
                        affectedRows = deleteCmd.ExecuteNonQuery();
                        EquipGV_RowDeleted(sender, new GridViewDeletedEventArgs(affectedRows, null));
                        SqlCommand selectCmd = new SqlCommand("uspReadAllEquipment", new SqlConnection(CONSTRING));
                        selectCmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        SqlDataAdapter adapter = new SqlDataAdapter(selectCmd);
                        adapter.Fill(dt);
                        EquipGV.DataSource = dt;
                        EquipGV.DataBind();
                    }
                    catch (Exception exception)
                    {
                        EquipGV_RowDeleted(sender, new GridViewDeletedEventArgs(affectedRows, exception));
                    }
                }
            }
        }

        protected void EquipGV_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    string message = "Equipment deleted";
                    string script = "window.onload = function(){ alert('" + message + "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
            else
            {
                string message = "An error has occured. Please check your input";
                string script = "window.onload = function(){ alert('" + message + "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                e.ExceptionHandled = true;
            }
        }

        protected void Category_ListView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selected_category = Category_ListView.SelectedValue.ToString();
            System.Diagnostics.Debug.WriteLine(selected_category);

            if (selected_category == "All")
            {
                load();
                return;
            }

            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                SqlCommand cmd;
                if (selected_category == "Most Popular")
                {
                    cmd = new SqlCommand("uspReadMostPopularEquipment");   
     
                } else
                {
                    cmd = new SqlCommand("uspReadEquipmentByCategory");
                    cmd.Parameters.AddWithValue("@category_name", selected_category);
                }    
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                EquipLV.DataSource = dt;
                EquipLV.DataBind();
            }        
        }

    }

}

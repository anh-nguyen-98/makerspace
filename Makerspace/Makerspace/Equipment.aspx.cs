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
        protected static int LEN_LOC_CODE = 4;
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                load();
            }
            else
            {

            }

        }

        //Post back data
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

        //Bind GridView
        protected void BindGV(GridView gv, SqlCommand cmd, Label CountLabel)
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (cmd)
            {

                con.Open();
                cmd.Connection = con;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                gv.DataSource = dt;
                gv.DataBind();
                CountLabel.Text = gv.Rows.Count.ToString();


            }
        }

        //View selected equipment on gridview
        protected void EquipGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            ItemFV.Visible = false;
            string idString = EquipGV.SelectedRow.Cells[1].Text;
            Int32.TryParse(idString, out int id);
            BindFV(EquipFormView, "uspReadEquip@eID", "@eID", id);
            SqlCommand selectItem = new SqlCommand("uspReadEquipItem@eID");
            selectItem.CommandType = CommandType.StoredProcedure;
            selectItem.Parameters.AddWithValue("@eID", id);
            BindGV(ItemGV, selectItem, ItemCount);
            EquipFormView.Visible = true;
            ItemGridPanel.Visible = true;

        }

        protected void EquipFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {

            EquipFormView.ChangeMode(e.NewMode);
            Int32.TryParse(EquipFormView.DataKey.Value.ToString(), out int id);
            BindFV(EquipFormView, "uspReadEquip@eID", "@eID", id);

        }

        protected void EquipGV_PageIndexChanging(object sender, GridViewPageEventArgs e, Label MessageLabel)
        {
            if (ItemFV.CurrentMode == FormViewMode.Edit)
            {
                e.Cancel = true;
                MessageLabel.Text = "Please finish the form before move to new page.";
            }
            EquipGV.PageIndex = e.NewPageIndex;

        }

        protected void ItemGV_SelectedIndexChanged(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(ItemGV.SelectedValue.ToString());

            BindFV(ItemFV, "uspReadEquipItem@itemID", "@itemID", id);
            ItemFV.Visible = true;


        }

        protected void ItemGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(ItemGV.Rows[e.RowIndex].FindControl("itemID").ToString());
            int eID = Convert.ToInt32(((Label)EquipFormView.FindControl("eIDLabel")).Text);
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

        protected void CategoryDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedId = Convert.ToInt32(CategoryDdl.SelectedValue);
            if (selectedId == 0)
            {
                string roomCode = codes[0];
                string spaceCode = codes[1];
                string objectCode = codes[2];
                string objectNumber = codes[3];

                using (SqlConnection con = new SqlConnection(CONSTRING))
                using (SqlCommand cmd = new SqlCommand("uspReadLoc", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@roomCode", roomCode);
                    cmd.Parameters.AddWithValue("@spaceCode", spaceCode);
                    cmd.Parameters.AddWithValue("@objectCode", objectCode);
                    cmd.Parameters.AddWithValue("@objectNumber", objectNumber);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
                if (dt.Rows.Count > 0) return dt.Rows[0].Field<int>("locID");
            }
            return 0;

        }

        //Update equipment info
        protected void EquipFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {

            Int32.TryParse(EquipFormView.DataKey.Value.ToString(), out int eID);
            string eCode = ((TextBox)EquipFormView.FindControl("eCodeUpdateTextBox")).Text;
            string eName = ((TextBox)EquipFormView.FindControl("eNameUpdateTextBox")).Text;
            string eDesc = ((TextBox)EquipFormView.FindControl("eDescUpdateTextBox")).Text;
            string eFunction = ((TextBox)EquipFormView.FindControl("eFunctionUpdateTextBox")).Text;
            string eManual = ((TextBox)EquipFormView.FindControl("eManualUpdateTextBox")).Text;
            string eSafety = ((TextBox)EquipFormView.FindControl("eSafetyUpdateTextBox")).Text;
            int eTraining = Convert.ToInt32(((CheckBox)EquipFormView.FindControl("eTrainingCheckBox")).Checked ? 1 : 0);

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

            EquipFormView.ChangeMode(FormViewMode.ReadOnly);
            BindFV(EquipFormView, "uspReadEquip@eID", "@eID", eID);

        }

        //Verify Equip Info Updates
        protected void EquipFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e, Label MessageLabel)
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
        protected void EquipFormView_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(EquipFormView.DataKey.Value);
            int eID = Convert.ToInt32(((Label)EquipFormView.FindControl("eIDLabel")).Text);

            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM EquipmentItem WHERE itemID = " + id + "", con))
            {
                con.Open();
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();

            }
            EquipFormView.ChangeMode(FormViewMode.ReadOnly);

            BindFV(EquipFormView, "uspReadEquipItem@itemID", "@itemID", 0);
            SqlCommand selectCmd = new SqlCommand("uspReadEquipItem@eID", new SqlConnection(CONSTRING));
            selectCmd.CommandType = CommandType.StoredProcedure;
            selectCmd.Parameters.AddWithValue("@eID", eID);
            BindGV(EquipGV, selectCmd, ItemCount);
        }


        //Verify deleting process
        protected void EquipFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e, Label MessageLabel)
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

        protected void AddItemBtn_Click(object sender, EventArgs e)
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
            BindFV(ItemFV, "uspReadEquipItem@itemID", "@itemID", itemId);
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

    }

}

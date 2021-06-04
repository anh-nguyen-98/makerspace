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
            {

            }
            else
            {
            }

        }


        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            BindGVRadioBased();

        }

        protected void BindGVRadioBased ()
        {
            String sp;
            String param;
            SqlCommand cmd;
            if (LocCodeBtn.Checked)
            {

                int locID = getLocID(SearchIn.Text);
                sp = "uspReadEquip@locID";
                param = "@locID";

                cmd = new SqlCommand(sp);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(param, locID);
            }
            else
            {
                if (FunctionBtn.Checked)
                {
                    sp = "uspReadEquip@eFunction";
                    param = "@eFunction";

                }
                else if (LocBtn.Checked)
                {
                    sp = "uspReadEquip@eLoc";
                    param = "@eLoc";

                }

                else
                {
                    sp = "uspReadEquip@eName";
                    param = "@eName";
                }
                cmd = new SqlCommand(sp)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue(param, string.Format("%{0}%", SearchIn.Text));
            }

            BindGV(EquipGV, cmd, EquipGVCount);

        }

        protected void BindGV (GridView gv, SqlCommand cmd, Label CountLabel)
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
        protected void Reset(Control parent)
        {
            foreach (Control c in parent.Controls)
            {
                if (c.GetType() == typeof(TextBox))
                {
                    ((TextBox)c).Text = "";
                }
                if (c.HasControls()) Reset(c);
                else if (c.GetType() == typeof(RadioButton))
                {
                    ((RadioButton)c).Checked = false;
                }

            }
        }

        protected int getLocID(String locCode)
        {
            String[] sep = new string[] { "." };
            String[] codes = locCode.Split(sep, count: LEN_LOC_CODE, StringSplitOptions.RemoveEmptyEntries);
            DataTable dt = new DataTable();

            if (codes.Length == LEN_LOC_CODE)
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

        protected void EquipGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idString = EquipGV.SelectedRow.Cells[1].Text;
            Int32.TryParse(idString, out int id);
            BindFV(id);
        }

        protected void BindFV(int id)
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            using (SqlCommand cmd = new SqlCommand("uspReadEquip@eID", con))
            {
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eID", id);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                EquipFormView.DataSource = dt;
                EquipFormView.DataBind();
            }
        }



        protected void EquipFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {

            EquipFormView.ChangeMode(e.NewMode);
            Int32.TryParse(EquipFormView.DataKey.Value.ToString(), out int id);
            BindFV(id);

        }

        protected void EquipFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {

            Int32.TryParse(EquipFormView.DataKey.Value.ToString(), out int eID);
            string eCode = ((TextBox)EquipFormView.FindControl("eCodeUpdateTextBox")).Text;
            string eName = ((TextBox)EquipFormView.FindControl("eNameUpdateTextBox")).Text;
            string eDesc = ((TextBox)EquipFormView.FindControl("eDescUpdateTextBox")).Text;
            string eFunction = ((TextBox)EquipFormView.FindControl("eFunctionUpdateTextBox")).Text;
            string eManual = ((TextBox)EquipFormView.FindControl("eManualUpdateTextBox")).Text;
            string eSafety = ((TextBox)EquipFormView.FindControl("eSafetyUpdateTextBox")).Text;
            int eTraining = Convert.ToInt32(((DropDownList)EquipFormView.FindControl("eTrainingUpdateDdl")).SelectedValue);

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
            BindFV(eID);
            BindGVRadioBased();

        }

    }
}

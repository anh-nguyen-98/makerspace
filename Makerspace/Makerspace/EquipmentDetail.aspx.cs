using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class EquipmentDetail : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                using (SqlConnection con = new SqlConnection(CONSTRING))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);

                    System.Diagnostics.Debug.WriteLine(id.ToString());

                    if (id==0)
                    {
                        Response.Redirect("~/Resource.aspx");
                    }

                    else
                    {
                        SqlCommand cmd = new SqlCommand("SELECT * FROM EquipmentItemLocation_View WHERE id = @id;", con);
                        cmd.Parameters.AddWithValue("@id", id);
                        con.Open();

                        DataTable db = new DataTable();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        adapter.Fill(db);
                        Subitem_Listview.DataSource = db;
                        Subitem_Listview.DataBind();

                        string link = db.Rows[0]["instruction"].ToString();

                        if (link.Equals(""))
                        {
                            ins.Enabled = false;
                            ins.Style.Add("color", "black");
                            ins.Style.Add("font-weight", "normal");
                            ins.Style.Add("text-decoration", "none");
                            ins.Text = "Instruction is not available yet";
                        }
                        else
                        {
                            ins.Text = "Click here for " + db.Rows[0]["name"].ToString().ToLower() + "'s instruction";
                        }

                        name.Text = db.Rows[0]["name"].ToString();
                        cat.Text = db.Rows[0]["category_name"].ToString();
                        eid.Text = db.Rows[0]["code"].ToString();
                        equipment_img.ImageUrl = "Images\\" + db.Rows[0]["image"].ToString();
                        brand.Text = db.Rows[0]["brand"].ToString();
                        desc.Text = db.Rows[0]["description"].ToString();
                        int training = (Int32)db.Rows[0]["training"];
                        if (training == 0)
                        {
                            train.Text = "Yes";
                        }
                        train.Text = "No";
                        
                        editBtn.Enabled = true;
                        ins_box.Visible = false;
                        desc_box.Visible = false;  
                        submit_btn.Visible = false; 
                    }
                    

                }
            }
            else
            {

            }

        }

        protected void Link_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(CONSTRING))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                SqlCommand cmd = new SqlCommand("SELECT instruction FROM EquipmentItemLocation_View WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();


                string link = (String)cmd.ExecuteScalar();

                System.Diagnostics.Debug.WriteLine(link);
                Response.Redirect(link, false);


                //System.Diagnostics.Debug.WriteLine(link);
            }
        }

        protected void Count_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(CONSTRING))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                SqlCommand cmd = new SqlCommand("SELECT COUNT(id) FROM EquipmentItemLocation_View WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();

                int countItem = (Int32)cmd.ExecuteScalar();
                count.Text = countItem.ToString();


            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            ins.Visible = false;
            ins_box.Visible = true;
            desc.Visible = false;
            desc_box.Visible = true;
            submit_btn.Visible = true;
            System.Diagnostics.Debug.WriteLine("Clicked");
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                string desc_input = desc_box.Text.ToString();
                string ins_input = ins_box.Text.ToString();

                SqlCommand cmd = new SqlCommand("updateEquipment@eID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@equipment_id", id);
                cmd.Parameters.AddWithValue("@description", desc_input);
                cmd.Parameters.AddWithValue("@instruction", ins_input);

                con.Open();
                
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                string url = "~/EquipmentDetail.aspx?id=" + id;

                Response.Redirect(url);


                //desc_box.Text = "";
                //ins_box.Text = "";

                //ins_box.Visible = false;
                //desc_box.Visible = false;


                //ins.Visible = true;
                //desc.Visible = true;

                //ins.Text = "Click here for instruction";
                //desc.Text = desc_input;

                //submit_btn.Visible = false;






            }

        }
    }
}
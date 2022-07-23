using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class ResourceDetail : System.Web.UI.Page
    {
        protected static string CONSTRING = ConfigurationManager.ConnectionStrings["MakerspaceDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["role"] != null)
                {
                    editBtn.Visible = true;
                }
                using (SqlConnection con = new SqlConnection(CONSTRING))
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);


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

                        String link = db.Rows[0]["instruction"].ToString();

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
                        if (training == 1)
                        {
                            train.Text = "Yes";
                        }
                        else
                        {
                            train.Text = "No";
                        }

                        //editBtn.Enabled = true;
                        ins_box.Visible = false;
                        desc_box.Visible = false;
                        is_required.Visible = false;    
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
 
            Response.Redirect(getLink(), false);

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
            ins_box.Text = getLink();
            desc_box.Text= desc.Text;    
            desc.Visible = false;
            desc_box.Visible = true;
            submit_btn.Visible = true;
            train.Visible = false;
            is_required.Checked = train.Text.Equals("Yes");
            is_required.Visible = true;
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CONSTRING))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                string desc_input = desc_box.Text.ToString();
                string ins_input = ins_box.Text.ToString();
                int training_input = 0; 
                if (is_required.Checked)
                {
                    training_input = 1;
                }

                SqlCommand cmd = new SqlCommand("uspUpdateEquipment@eID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@equipment_id", id);
                cmd.Parameters.AddWithValue("@description", desc_input);
                cmd.Parameters.AddWithValue("@instruction", ins_input);
                cmd.Parameters.AddWithValue("@training", training_input);

                con.Open();
                
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                string url = "~/ResourceDetail.aspx?id=" + id;
                Response.Redirect(url);
            }

        }

        private String getLink()
        {
            String link = "";

            using (SqlConnection conn = new SqlConnection(CONSTRING))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                SqlCommand cmd = new SqlCommand("SELECT instruction FROM EquipmentItemLocation_View WHERE id = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();

                link = (String)cmd.ExecuteScalar();

            }
            return link;
        }
    }


}
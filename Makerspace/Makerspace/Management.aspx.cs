using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["level"] == null || Convert.ToInt16(Session["level"].ToString()) > 1)
            {
                GridView1.Columns[0].Visible = false;
            }
        }
    }
}
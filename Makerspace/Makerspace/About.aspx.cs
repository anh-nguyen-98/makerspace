using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void epBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EngineeringProjectMain.aspx");
        }
    }
}
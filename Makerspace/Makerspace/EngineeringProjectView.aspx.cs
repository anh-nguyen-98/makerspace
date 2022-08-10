using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class EngineeringProjectView : System.Web.UI.Page
    {
        String projectName;
        protected void Page_Load(object sender, EventArgs e)
        {
            projectName = Request.QueryString["project_name"];
        }
    }
}
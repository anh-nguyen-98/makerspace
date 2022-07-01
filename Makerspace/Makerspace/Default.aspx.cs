using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class _Default : Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/Resource.aspx");
        }

    }

}
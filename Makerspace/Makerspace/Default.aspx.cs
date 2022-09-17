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
            if (id==0)
            {
                Response.Redirect("~/Resource.aspx");

                double users = 0;
                TextReader textReader = new StreamReader(Server.MapPath("count_visit.txt"));
                users = Convert.ToDouble(textReader.readLine());
                textReader.Close();
                textReader.Dispose();

                try {
                    users ++;
                    TextWriter writer = new StreamWriter(Server.MapPath("count_visit.txt"));
                    writer.Write(users);
                    writer.Close();
                    writer.Dispose();
                    
                }
            }
        }

    }

}
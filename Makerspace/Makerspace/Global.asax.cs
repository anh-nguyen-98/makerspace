using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Makerspace
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["users"] = 0;

        }

        void protect Session_Start(object sender, EventArgs e) 
        {
            Application.Lock();
            Application["users"] = Convert.ToInt32(Application["users"]) + 1;
            Application.UnLock();
        }

        void protect Session_End(object sender, EventArgs e) 
        {
            // Application.Lock();
            // Application["users"] = Convert.ToInt32(Application["users"]) - 1;
            // Application.UnLock();
        }

        void Application_End(object sender, EventArgs e)
        {
            // Application.Lock();
            // Application["users"] = Convert.ToInt32(Application["users"]) - 1;
            // Application.UnLock();
        }
    }
}
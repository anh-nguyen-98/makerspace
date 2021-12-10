using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Makerspace
{
    public partial class Login : System.Web.UI.Page
    {
        public string ReturnUrl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //Make a request to the OAuth provider
                var provider = Request.Form["provider"];
                System.Diagnostics.Debug.WriteLine( provider);
                if (provider == null)
                {
                    return;
                }

                var redirectUrl = "~/ExternalLoginLandingPage.aspx";
                System.Diagnostics.Debug.WriteLine(ReturnUrl);
                if (!String.IsNullOrEmpty(ReturnUrl))
                {
                    var resolvedReturnUrl = ResolveUrl(ReturnUrl);
                    redirectUrl += "?ReturnUrl=" + HttpUtility.UrlEncode(resolvedReturnUrl);
                }

                OpenAuth.RequestAuthentication(provider, redirectUrl);
            }
        }

        public IEnumerable<ProviderDetails> GetProviderNames()
        {
            return OpenAuth.AuthenticationClients.GetAll();
        }

    }
}
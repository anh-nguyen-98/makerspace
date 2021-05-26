using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Makerspace.Startup))]
namespace Makerspace
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

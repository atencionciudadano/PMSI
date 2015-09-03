using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace GAC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                //defaults: new { controller = "Reclamo", action = "RegistrarReclamo", id = UrlParameter.Optional }
                //defaults: new { controller = "Atender", action = "AtenderReclamo", id = UrlParameter.Optional }
                //defaults: new { controller = "Atender", action = "AtenderReclamos2", id = UrlParameter.Optional }
                //defaults: new { controller = "Reclamo", action = "ConsultarReclamo", id = UrlParameter.Optional }
                //defaults: new { controller = "Reclamo", action = "Index", id = UrlParameter.Optional }
                defaults: new { controller = "Reclamo", action = "Login", id = UrlParameter.Optional }
            );
        }
    }
}
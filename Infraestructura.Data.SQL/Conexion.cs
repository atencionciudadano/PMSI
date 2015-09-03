using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace Infraestructura.Data.SQL
{
    public class Conexion
    {
        public string fn_cadena_conexion()
        {
            return ConfigurationManager.ConnectionStrings["cnx_Produccion"].ConnectionString;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class Parametro
    {
        public int IdParametro { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }

        public string Resultado { get; set; } 

    }
}

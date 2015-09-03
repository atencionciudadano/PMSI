using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Dominio.Core.Entities
{
    public class Atencion
    {
        [DisplayName("idRegistroEvento")]
        public int idRegistroEvento { get; set; }

        [DisplayName("idArea")]
        public int idArea { get; set; }

        [DisplayName("Reclamo")]
        public Reclamo Reclamo { get; set; }

        [DisplayName("idEvento")]
        public int idEvento { get; set; }

        [DisplayName("Observacion")]
        public String Observacion { get; set; }

        public string RESULTADO { get; set; }
    }
}

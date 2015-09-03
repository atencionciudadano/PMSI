using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Dominio.Core.Entities
{
    public class Evento
    {
        [DisplayName("idRegistroEvento")]
        public int idRegistroEvento { get; set; }

        [DisplayName("idArea")]
        public Nullable<int> idArea { get; set; }

        [DisplayName("Area")]
        public String Area { get; set; }

        [DisplayName("idQuejaReclamo")]
        public Nullable<int> idQuejaReclamo { get; set; }

        [DisplayName("NroQuejaReclamo")]
        public String NroQuejaReclamo { get; set; }

        [DisplayName("idEvento")]
        public Nullable<int> idEvento { get; set; }

        [DisplayName("DescEvento")]
        public String DescEvento { get; set; }

        [DisplayName("Observacion")]
        public String Observacion { get; set; }

        [DisplayName("FecRegistra")]
        public String FecRegistra { get; set; }

        [DisplayName("HoraRegistra")]
        public String HoraRegistra { get; set; }
    }
}

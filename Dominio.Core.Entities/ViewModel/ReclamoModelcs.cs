using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities.ViewModel
{
    public class ReclamoModel
    {
        public Reclamo objReclamo { get; set; }

        public List<Parametro> lstTipoDocumento { get; set; }
        public List<Parametro> lstDepartamentos { get; set; }
        public List<Parametro> lstProvincias { get; set; }
        public List<Parametro> lstDistritos { get; set; }

        public List<Parametro> lstAreas { get; set; }

        public List<Parametro> lstEstadoQuejaReclamo { get; set; }

    }
}

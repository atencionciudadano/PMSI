using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Dominio.Core.Entities
{
    public class Reclamo
    {

        [DisplayName("Código")]
        public int IdReclamo { get; set; }

        [DisplayName("Código")]
        public int IdPersona { get; set; }

        [DisplayName("Numero Reclamo")]
        public string NroReclamo { get; set; }

        [DisplayName("TipoDoc")]
        public int TipDocumento { get; set; }

        [DisplayName("NroDocumento")]
        public string NroDocumento { get; set; }

        [DisplayName("Fecha Registro")]
        public DateTime? FecRegistro { get; set; }

        [DisplayName("Hora")]
        public string Hora { get; set; }

        [DisplayName("Razón Social")]
        public string RazSocial { get; set; }

        [DisplayName("Departamento")]
        public int codDepartamento { get; set; }

        [DisplayName("Provinvia")]
        public int codProvincia { get; set; }

        [DisplayName("Distrito")]
        public int CodDistrito { get; set; }

        [DisplayName("Direccion")]
        public string Direccion { get; set; }

        [DisplayName("Correo")]
        public string Correo { get; set; }

        [DisplayName("Telefono")]
        public string Telefono { get; set; }

        [DisplayName("Archivo")]
        public string Archivo { get; set; }

        [DisplayName("Asunto")]
        public string Asunto { get; set; }

        [DisplayName("Mensaje")]
        public string Mensaje { get; set; }

        [DisplayName("Observaciones")]
        public string Observaciones { get; set; }

        [DisplayName("idEstadoQuejaReclamo")]
        public int idEstadoQuejaReclamo { get; set; }

        [DisplayName("EstadoQuejaReclamo")]
        public string EstadoQuejaReclamo { get; set; }

        public string RESULTADO { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio.Core.Entities;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

using System.Data.Entity;

namespace Infraestructura.Data.SQL
{
    public class Reclamo_DAL : Conexion
    {

        public List<Parametro> ListarDepartamento()
        {
            List<Parametro> list = new List<Parametro>();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var L2Query = contextbd.DEPARTAMENTOes.ToList();

                foreach (var item in L2Query)
                {
                    Parametro obj = new Parametro();
                    obj.Codigo = item.idDepartamento.ToString();
                    obj.Descripcion = item.Nombre;
                    list.Add(obj);
                }

                return list;
            }
        }

        public List<Parametro> ListarAreas()
        {
            List<Parametro> list = new List<Parametro>();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var L2Query = contextbd.AREA.ToList();

                foreach (var item in L2Query)
                {
                    Parametro obj = new Parametro();
                    obj.Codigo = item.idArea.ToString();
                    obj.Descripcion = item.descArea;
                    list.Add(obj);
                }

                return list;
            }
        }

        public List<Parametro> ListarEstados()
        {
            List<Parametro> list = new List<Parametro>();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var L2Query = contextbd.ESTADOS_QUEJARECLAMO.ToList();

                foreach (var item in L2Query)
                {
                    Parametro obj = new Parametro();
                    obj.Codigo = item.idEstadoQuejaReclamo.ToString();
                    obj.Descripcion = item.DescEstado;
                    list.Add(obj);
                }

                return list;
            }
        }

        public List<Parametro> ListarProvincia(int pCod_Depa)
        {
            List<Parametro> list = new List<Parametro>();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var L2Query = contextbd.PROVINCIAs.Where(s => s.idDepartamento == pCod_Depa).ToList();

                foreach (var item in L2Query)
                {
                    Parametro obj = new Parametro();
                    obj.Codigo = item.idProvincia.ToString();
                    obj.Descripcion = item.Nombre;
                    list.Add(obj);
                }

                return list;
            }
        }

        public List<Parametro> ListarDistrito(int pCod_Prov)
        {
            List<Parametro> list = new List<Parametro>();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var L2Query = contextbd.DISTRITOes.Where(s => s.idProvincia == pCod_Prov).ToList();

                foreach (var item in L2Query)
                {
                    Parametro obj = new Parametro();
                    obj.Codigo = item.idDistrito.ToString();
                    obj.Descripcion = item.Nombre;
                    list.Add(obj);
                }

                return list;
            }
        }

        public String GrabarAtencion(Atencion obj)
        {
            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var idEstadoQuejaReclamo = 0;
                var idEvento = 0;

                if(obj.idArea == 0)
                {
                    idEstadoQuejaReclamo = 4;
                    idEvento = 3;
                }
                else if (obj.idArea == 9)
                {
                    idEstadoQuejaReclamo = 3;
                    idEvento = 2;
                }
                else
                {
                    idEstadoQuejaReclamo = 2;
                    idEvento = 2;
                }

                var L2Query = contextbd.SPI_RegistroAtencion(obj.Reclamo.IdReclamo, obj.idArea, idEstadoQuejaReclamo, idEvento, obj.Observacion, 1);

                return "";
            }
        }
        

        public String GrabarReclamo(Reclamo obj)
        {
            try
            {
                //int codReclamo = 0;
                var NroRegistro = "";

                using (var contextbd = new MunicipalidadSanIsidroEntities_New())
                {
                    var Nombres = "";
                    var ApePaterno = "";
                    var ApeMaterno = "";

                    if (obj.TipDocumento == 2)
	                {
		                 Nombres = obj.RazSocial;
	                }else
                    {
                        string[] NomPersona = obj.RazSocial.Split(' ');
                        Nombres = NomPersona[0];
                        ApePaterno = NomPersona[1];
                        ApeMaterno = NomPersona[2];
                    }

                    
                    NroRegistro = "QR_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + "_" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();

                    var L2Query = contextbd.SPI_RegistrarQuejaReclamo(obj.CodDistrito, obj.TipDocumento, Nombres, ApePaterno, ApeMaterno, obj.NroDocumento, obj.Direccion, obj.Telefono, obj.Correo, NroRegistro, DateTime.Now, DateTime.Now.TimeOfDay.ToString(), obj.Asunto, obj.Mensaje, obj.Archivo, 1);
                }

                return NroRegistro;
            }
            catch { throw; }
        }

        public List<Parametro> ListarTipoDocumento()
        {
            List<Parametro> list = new List<Parametro>();
            
            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var L2Query = contextbd.TIPODOCUMENTOIDENTIDADs.ToList();

                foreach (var item in L2Query)
                {
                    Parametro obj = new Parametro();
                    obj.Codigo = item.idTipoDocIdentidad.ToString();
                    obj.Descripcion = item.Descripcion;
                    list.Add(obj);
                }
                
                return list;
            }
        }

        public Reclamo CargarPersona(int tipoDocumento, String NroDocumento)
        {
            Reclamo obj = new Reclamo();
            PERSONAJURIDICA objJur = new PERSONAJURIDICA();
            PERSONANATURAL objNat = new PERSONANATURAL();
            PROVINCIA objProv = new PROVINCIA();
            DEPARTAMENTO objDep = new DEPARTAMENTO();
            DISTRITO objDis = new DISTRITO();

            PERSONA objPersona = new PERSONA();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                if (tipoDocumento == 2)
                {
                    objJur = contextbd.PERSONAJURIDICAs.Where(s => s.RUC == NroDocumento).FirstOrDefault<PERSONAJURIDICA>();
                    if (objJur != null)
                    {
                        objPersona = contextbd.PERSONAs.Where(s => s.idPersona == objJur.idPersona).FirstOrDefault<PERSONA>();
                    objDis = contextbd.DISTRITOes.Where(s => s.idDistrito == objPersona.idDistrito).FirstOrDefault<DISTRITO>();
                    objProv = contextbd.PROVINCIAs.Where(s => s.idProvincia == objDis.idProvincia).FirstOrDefault<PROVINCIA>();

                    obj.IdPersona = Convert.ToInt32(objJur.idPersona);
                    obj.NroDocumento = objJur.RUC;
                    obj.RazSocial = objJur.RazonSocial;
                    obj.codDepartamento = objProv.idDepartamento;
                    obj.codProvincia = objProv.idProvincia;
                    obj.CodDistrito = Convert.ToInt32(objPersona.idDistrito);
                    obj.Direccion = objPersona.Direccion;
                    obj.Correo = objPersona.Correo;
                    obj.Telefono = objPersona.Direccion;
                    }
                }
                else {
                    objNat = contextbd.PERSONANATURALs.Where(s => s.NroDocIdentidad == NroDocumento).FirstOrDefault<PERSONANATURAL>();
                    if (objNat != null)
                    {
                        objPersona = contextbd.PERSONAs.Where(s => s.idPersona == objNat.idPersona).FirstOrDefault<PERSONA>();
                        objDis = contextbd.DISTRITOes.Where(s => s.idDistrito == objPersona.idDistrito).FirstOrDefault<DISTRITO>();
                        objProv = contextbd.PROVINCIAs.Where(s => s.idProvincia == objDis.idProvincia).FirstOrDefault<PROVINCIA>();

                        obj.IdPersona = Convert.ToInt32(objNat.idPersona);
                        obj.NroDocumento = objNat.NroDocIdentidad;
                        obj.RazSocial = objNat.Nombres.Trim() + " " + objNat.ApellidoPaterno.Trim() + " " + objNat.ApellidoMaterno.Trim();
                        obj.codDepartamento = objProv.idDepartamento;
                        obj.codProvincia = objProv.idProvincia;
                        obj.CodDistrito = Convert.ToInt32(objPersona.idDistrito);
                        obj.Direccion = objPersona.Direccion;
                        obj.Correo = objPersona.Correo;
                        obj.Telefono = objPersona.Direccion;
                    }
                }
                return obj;
            }
        }

        public List<Reclamo> ListarReclamos(String pNroReclamo, int pEstado, DateTime pFecDesde, DateTime pFecHasta)
        {
            List<Reclamo> list = new List<Reclamo>();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                //var L2Query = contextbd.QUEJARECLAMOes.Where(s => s.NroRegistro == pNroReclamo && s.idEstadoQuejaReclamo == pEstado && (s.FechaIngreso <= pFecHasta && s.FechaIngreso >= pFecDesde)).ToList();
                var L2Query = contextbd.QUEJARECLAMOes.Where(s => (s.FechaIngreso <= pFecHasta && s.FechaIngreso >= pFecDesde)).ToList();

                if(pNroReclamo != "")
                {
                    L2Query = L2Query.Where(s => s.NroRegistro == pNroReclamo).ToList();
                }

                if (pEstado != 0)
                {
                    L2Query = L2Query.Where(s => s.idEstadoQuejaReclamo == pEstado).ToList();
                }

                foreach (var item in L2Query)
                {
                    Reclamo obj = new Reclamo();
                    obj.IdReclamo = item.idQuejaReclamo;
                    obj.NroReclamo = item.NroRegistro;
                    obj.FecRegistro = item.FechaIngreso;
                    obj.Hora = item.Hora;

                    obj.EstadoQuejaReclamo = contextbd.ESTADOS_QUEJARECLAMO.Where(s => s.idEstadoQuejaReclamo == item.idEstadoQuejaReclamo).FirstOrDefault().DescEstado;

                    list.Add(obj);
                }
            }
            return list;
        }

        public List<Evento> ListarEventos(String pNroReclamo)
        {
            List<Evento> list = new List<Evento>();

            using (var contextbd = new MunicipalidadSanIsidroEntities_New())
            {
                var idReclamo = contextbd.QUEJARECLAMOes.Where(s => s.NroRegistro == pNroReclamo).FirstOrDefault().idQuejaReclamo;
                var L2Query = contextbd.REGISTROEVENTO.Where(s => s.idQuejaReclamo == idReclamo).ToList();

                foreach (var item in L2Query)
                {
                    Evento obj = new Evento();
                    obj.idRegistroEvento = item.idRegistroEvento;
                    obj.idQuejaReclamo = item.idQuejaReclamo;
                    obj.NroQuejaReclamo = contextbd.QUEJARECLAMOes.Where(s => s.idQuejaReclamo == item.idQuejaReclamo).FirstOrDefault().NroRegistro;
                    obj.idEvento = item.idEvento;
                    obj.DescEvento = contextbd.EVENTOes.Where(s => s.idEvento == item.idEvento).FirstOrDefault().DescEvento;
                    obj.idArea = item.idArea;
                    if (item.idArea != null)
                    {
                        obj.Area = contextbd.AREA.Where(s => s.idArea == item.idArea).FirstOrDefault().descArea;
                    }
                    obj.FecRegistra = Convert.ToDateTime(item.FecRegistra).ToShortDateString().ToString();
                    obj.HoraRegistra = Convert.ToDateTime(item.FecRegistra).ToShortTimeString().ToString();
                    obj.Observacion = item.Observacion;

                    list.Add(obj);
                }
            }
            return list;
        }
    }
}

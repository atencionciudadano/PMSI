using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Infraestructura.Data.SQL;
using Dominio.Core.Entities;
using Dominio.Core.Entities.ViewModel;

namespace GAC.Controllers
{
    public class ReclamoController : Controller
    {
        //
        // GET: /Reclamo/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult RegistrarReclamo()
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            ReclamoModel objGuiaModel = new ReclamoModel();

            objGuiaModel.lstDepartamentos = manager.ListarDepartamento();
            ViewBag.lstDepartamentos = objGuiaModel.lstDepartamentos;
            
            objGuiaModel.lstTipoDocumento = manager.ListarTipoDocumento();
            ViewBag.lstTipoDocumento = objGuiaModel.lstTipoDocumento;

            return View();
        }

        public ActionResult CargarPersona(int tipoDocumento, String NroDocumento)
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            ReclamoModel objGuiaModel = new ReclamoModel();
            Reclamo objReclamo = new Reclamo();

            objGuiaModel.lstDepartamentos = manager.ListarDepartamento();
            ViewBag.lstDepartamentos = objGuiaModel.lstDepartamentos;

            objReclamo = manager.CargarPersona(tipoDocumento, NroDocumento);

            return this.Json(objReclamo, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public string GrabarAtencion(int idReclamo, String NroReclamo, DateTime FecRegistro, String Hora, int idArea, String Observacion)
        {
            try
            {
                Reclamo_DAL manager = new Reclamo_DAL();
                Reclamo objReclamo = new Reclamo();
                Atencion objAtencion = new Atencion();

                String NroAtencion;

                objReclamo.IdReclamo = idReclamo;
                objReclamo.NroReclamo = NroReclamo;
                objReclamo.FecRegistro = FecRegistro;
                objReclamo.Hora = Hora;

                objAtencion.idArea = idArea;
                objAtencion.Observacion = Observacion;
                objAtencion.Reclamo = objReclamo;

                NroAtencion = manager.GrabarAtencion(objAtencion);

                var result = JsonConvert.SerializeObject(NroAtencion);

                return result;
            }
            catch (Exception)
            {   
                throw;
            }
        }

        [HttpPost]
        public string GrabarReclamo(int idPersona, int TipDocumento, String NroDocumento, String RazSocial, int CodDistrito,
           String Direccion, String Correo, String Telefono, String Asunto, String Mensaje, String Archivo)
        {
            try
            {
                Reclamo_DAL manager = new Reclamo_DAL();
                Reclamo objReclamo = new Reclamo();
                //int idReclamo;
                String NroReclamo;

                objReclamo.IdPersona = idPersona;
                objReclamo.TipDocumento = TipDocumento;
                objReclamo.NroDocumento = NroDocumento;
                objReclamo.RazSocial = RazSocial;
                objReclamo.CodDistrito = CodDistrito;
                objReclamo.Direccion = Direccion;
                objReclamo.Correo = Correo;
                objReclamo.Telefono = Telefono;
                objReclamo.Asunto = Asunto;
                objReclamo.Mensaje = Mensaje;
                objReclamo.Archivo = Archivo;

                NroReclamo = manager.GrabarReclamo(objReclamo);
                var result = JsonConvert.SerializeObject(NroReclamo);

                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        // -------------------------------  Cargar Combos  --------------------------

        [HttpGet]
        public JsonResult LlenarProvincia(int pCodDepartamento)
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            IEnumerable<Parametro> lstProvincia;

            lstProvincia = manager.ListarProvincia(pCodDepartamento);
            return this.Json(lstProvincia, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult LlenarDistrito(int pCodProvincia)
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            IEnumerable<Parametro> lstDistrito;

            lstDistrito = manager.ListarDistrito(pCodProvincia);
            return this.Json(lstDistrito, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult LlenarAreas()
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            IEnumerable<Parametro> lstAreas;

            lstAreas = manager.ListarAreas();
            return this.Json(lstAreas, JsonRequestBehavior.AllowGet);
        }

        // -------------------------------  Consultar Reclamo --------------------------
        public ActionResult ConsultarReclamo()
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            ReclamoModel objGuiaModel = new ReclamoModel();

            objGuiaModel.lstEstadoQuejaReclamo = manager.ListarEstados();
            ViewBag.lstEstadoQuejaReclamo = objGuiaModel.lstEstadoQuejaReclamo;

            return View();
        }

        public ActionResult _listarReclamos(String pNroReclamo, int pEstado, DateTime pFecDesde, DateTime pFecHasta)
        {
            Reclamo_DAL manager = new Reclamo_DAL();

            List<Reclamo> listReclamo = manager.ListarReclamos(pNroReclamo, pEstado, pFecDesde, pFecHasta);
            return View(listReclamo);
        }

        public ActionResult _HistorialReclamos(String pNroReclamo)
        {
            Reclamo_DAL manager = new Reclamo_DAL();

            List<Evento> listEvento = manager.ListarEventos(pNroReclamo);
            return View(listEvento);
        }

        public ActionResult HistorialReclamo(String NroRegistro, String Estado)
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            Reclamo objReclamo = new Reclamo();

            objReclamo.NroReclamo = NroRegistro;
            objReclamo.EstadoQuejaReclamo = Estado;

            return View(objReclamo);
        }
    }
}

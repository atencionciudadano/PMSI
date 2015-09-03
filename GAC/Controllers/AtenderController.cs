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
    public class AtenderController : Controller
    {
        //
        // GET: /Atender/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AtenderReclamo(int id, String NroRegistro, DateTime FechaRegistro, String Hora)
        {
            Reclamo_DAL manager = new Reclamo_DAL();
            ReclamoModel objGuiaModel = new ReclamoModel();
            Atencion objAtencion = new Atencion();
            Reclamo objReclamo = new Reclamo();

            objGuiaModel.lstAreas = manager.ListarAreas();
            ViewBag.lstAreas = objGuiaModel.lstAreas;

            objReclamo.IdReclamo = id;
            objReclamo.NroReclamo = NroRegistro;
            objReclamo.FecRegistro = FechaRegistro;
            objReclamo.Hora = Hora;

            objAtencion.Reclamo = objReclamo;

            return View(objAtencion);
        }

        public ActionResult AtenderReclamos2()
        {
            return View();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPractica04.Models;

namespace WebPractica04.Controllers
{
    public class ConsultasController : Controller
    {
        principalModel principalModel = new principalModel();
        public ActionResult Consultas()
        {
            var datos = principalModel.Consultar();
            return View(datos);
        }




    }
}

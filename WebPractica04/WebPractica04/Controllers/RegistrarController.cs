using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using WebPractica04.Entity;
using WebPractica04.Models;

namespace WebPractica04.Controllers
{
    public class RegistrarController : Controller
    {
        principalModel principalModel = new principalModel();
        abonosModel abonosModel = new abonosModel();

        [HttpGet]
        public ActionResult Registrar()
        {
            var datos = principalModel.Consultar();
            return View(datos);
        }

        [HttpPost]
        public async Task<ActionResult> Registrar(principalEntity entidad)
        {
            // Obtener la entidad actualizada con el nuevo valor de abono
            var resp1 = await principalModel.ConsultarPAsync(entidad.PrincipalID);
            decimal saldoAnterior = resp1.Saldo;
            resp1.Saldo -= entidad.Saldo;  // Actualizar el saldo con el nuevo valor

            // Abonar con la entidad actualizada
            var resp = await abonosModel.AbonarAsync(resp1);


            if (resp == "OK")
            {
                return RedirectToAction("Consultas", "Consultas");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se pudo abonar";
                return View();
            }
        }




    }
}

using ApiPractica04.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiPractica04.Controllers
{
    public class RegistrarController : ApiController
    {
        [HttpPut]
        [Route("Abonar")]
        public string Abonar(principalEntity entidad)
        {
            try
            {
                using (var context = new Practica4PAEntities())
                {
                    // Obtener los datos actuales de la compra
                    var datos = (from x in context.Principal
                                 where x.PrincipalID == entidad.PrincipalID
                                 select x).FirstOrDefault();

                    if (datos != null)
                    {
                        // Guardar el saldo anterior para la tabla Abonos

                        // Actualizar el saldo en la tabla Principal
                        datos.Saldo = entidad.Saldo;
                        context.SaveChanges();

                        // Insertar un nuevo registro en la tabla Abonos
                        Abonos abono = new Abonos
                        {
                            PrincipalID = entidad.PrincipalID,
                            Compra = datos.Descripcion,  // Aquí debes poner el campo correcto que representa la compra en la tabla Principal
                            Abono = entidad.Saldo,
                            SaldoAnterior = entidad.Saldo,
                            FechaAbono = DateTime.Now
                        };

                        context.Abonos.Add(abono);
                        context.SaveChanges();
                    }

                    return "OK";
                }
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }




        [HttpPost]
        [Route("InsertarAbono")]
        public long RegistrarProducto(Abonos abono)
        {
            using (var context = new Practica4PAEntities())
            {
                context.Abonos.Add(abono);
                context.SaveChanges();
                return abono.AbonoID;
            }
        }
    }
}

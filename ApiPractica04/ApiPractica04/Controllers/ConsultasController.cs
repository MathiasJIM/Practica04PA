using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiPractica04.Controllers
{
    public class ConsultasController : ApiController
    {
        [HttpGet]
        [Route("Consultar")]
        public List<Principal> ConsultarProductos()
        {
            using (var context = new Practica4PAEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return context.Principal.ToList();
            }
        }


        [HttpGet]
        [Route("ConsultarP")]
        public Principal ConsultaUsuario(long q)
        {
            try
            {
                using (var context = new Practica4PAEntities())
                {
                    context.Configuration.LazyLoadingEnabled = false;
                    var datos = (from x in context.Principal
                                 where x.PrincipalID == q
                                 select x).FirstOrDefault();

                    return datos;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }


        [HttpGet]
        [Route("ConsultarPrincipal")]
        public List<System.Web.Mvc.SelectListItem> ConsultarPrincipal()
        {
            try
            {
                using (var context = new Practica4PAEntities())
                {
                    var datos = (from x in context.Principal
                                 select x).ToList();

                    var respuesta = new List<System.Web.Mvc.SelectListItem>();
                    foreach (var item in datos)
                    {
                        respuesta.Add(new System.Web.Mvc.SelectListItem { Value = item.Descripcion, Text = item.Saldo.ToString() });
                    }

                    return respuesta;
                }
            }
            catch (Exception)
            {
                return new List<System.Web.Mvc.SelectListItem>();
            }
        }
    }
}

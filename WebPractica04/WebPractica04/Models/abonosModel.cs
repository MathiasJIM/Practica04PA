using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http.Json;
using System.Net.Http;
using System.Web;
using Microsoft.Ajax.Utilities;
using WebPractica04.Entity;
using System.Threading.Tasks;

namespace WebPractica04.Models
{
    public class abonosModel
    {
        public string urlApi = ConfigurationManager.AppSettings["urlApi"];

        public async Task<string> AbonarAsync(principalEntity entidad)
        {
            using (var client = new HttpClient())
            {
                string url = urlApi + "Abonar";
                JsonContent contenido = JsonContent.Create(entidad);
                var resp = await client.PutAsync(url, contenido);

                if (resp.IsSuccessStatusCode)
                {
                    return "OK";
                }
                else
                {
                    // Manejar el caso en que la solicitud no fue exitosa
                    return "Error en la solicitud";
                }
            }
        }

        public string InsertarAbono(abonoEntity entidad)
        {
            using (var client = new HttpClient())
            {
                string url = urlApi + "InsertarAbono";
                JsonContent contenido = JsonContent.Create(entidad);
                var resp = client.PostAsync(url, contenido).Result;
                return resp.Content.ReadFromJsonAsync<string>().Result;
            }
        }

    }
}
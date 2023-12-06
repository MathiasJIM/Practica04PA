using System;
using System.Web;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Json;
using WebPractica04.Entity;
using System.Web.Mvc;
using System.Threading.Tasks;

namespace WebPractica04.Models
{
    public class principalModel
    {
        public string urlApi = ConfigurationManager.AppSettings["urlApi"];


        public List<principalEntity> Consultar()
        {
            using (var client = new HttpClient())
            {
                var url = urlApi + "Consultar";
                var res = client.GetAsync(url).Result;
                return res.Content.ReadFromJsonAsync<List<principalEntity>>().Result;
            }
        }

        public async Task<principalEntity> ConsultarPAsync(long q)
        {
            using (var client = new HttpClient())
            {
                var url = urlApi + "ConsultarP?q=" + q;
                var res = await client.GetAsync(url);
                return await res.Content.ReadFromJsonAsync<principalEntity>();
            }
        }


    }
}
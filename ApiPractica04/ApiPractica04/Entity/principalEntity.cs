﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiPractica04.Entity
{
    public class principalEntity
    {
        public int PrincipalID { get; set; }
        public string CodigoCompra { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public decimal Saldo { get; set; }
        public string Estado { get; set; }
    }
}
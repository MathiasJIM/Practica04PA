using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiPractica04.Entity
{
    public class abonoEntity
    {
        public int AbonoID { get; set; }
        public int PrincipalID { get; set; }
        public string Compra { get; set; }
        public decimal Abono { get; set; }
        public decimal SaldoAnterior { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Iflee.QueryModels
{
    public class AircraftsIsExists
    {
        [Column("id")]
        public int Id { get; set; }

        [Column("value")]
        public bool Value { get; set; }
    }
}

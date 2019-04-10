using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Iflee.QueryModels
{
    public class AircraftsTotal
    {
        [Column("id")]
        public int Id { get; set; }

        [Column("value")]
        public int Value { get; set; }
    }
}

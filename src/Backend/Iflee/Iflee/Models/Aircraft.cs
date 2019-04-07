using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Iflee.Models
{
    [Table("aircrafts")]
    public class Aircraft
    {
        [Column("id")]
        public int ID { get; set; }

        [Column("type", TypeName = "VARCHAR(255)"), Display(Name = "Type"),
            Required, MaxLength(255)]
        public string Type { get; set; }

        [Column("board_number", TypeName = "VARCHAR(20)"),
            Display(Name = "BoardNumber"), Required, MaxLength(255)]
        public string BoardNumber { get; set; }

        [Column("mark", TypeName = "VARCHAR(10)"), Display(Name = "Mark"),
            Required, MaxLength(10)]
        public string Mark { get; set; }

        [Column("model", TypeName = "VARCHAR(255)"), Display(Name = "Model"),
            Required, MaxLength(10)]
        public string Model { get; set; }
    }
}

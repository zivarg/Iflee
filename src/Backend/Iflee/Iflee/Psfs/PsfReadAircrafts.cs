using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Iflee.Psfs
{
    public class PsfReadAircrafts
    {
        [FromQuery(Name = "limitOffset")]
        public int LimitOffset { get; set; }  = 0;

        [FromQuery(Name = "limitRowCount")]
        public int LimitRowCount { get; set; }  = -1;
    }
}

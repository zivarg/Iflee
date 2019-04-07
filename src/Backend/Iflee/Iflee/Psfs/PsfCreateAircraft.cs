using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Iflee.Psfs
{
    public class PsfCreateAircraft
    {
        [FromQuery(Name = "type")]
        public string Type { get; set; }

        [FromQuery(Name = "boardNumber")]
        public string BoardNumber { get; set; }

        [FromQuery(Name = "mark")]
        public string Mark { get; set; }

        [FromQuery(Name = "model")]
        public string Model { get; set; }

        public bool IsValid()
        {
            if (string.IsNullOrEmpty(Type)
                || string.IsNullOrEmpty(BoardNumber)
                || string.IsNullOrEmpty(Mark)
                || string.IsNullOrEmpty(Model))
            {
                return false;
            }
            return true;
        }
    }
}

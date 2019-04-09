using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Iflee.Psfs
{
    public class PsfCreateAircraft
    {
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

        [FromBody]
        public string BoardNumber { get; set; }

        [FromBody]
        public string Mark { get; set; }

        [FromBody]
        public string Model { get; set; }

        [FromBody]
        public string Type { get; set; }
    }
}

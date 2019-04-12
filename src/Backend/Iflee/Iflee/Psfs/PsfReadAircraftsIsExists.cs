using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Iflee.Psfs
{
    public class PsfReadAircraftsIsExists
    {
        public bool IsBoardNumberValid()
        {
            return !string.IsNullOrEmpty(BoardNumber);
        }

        public bool IsMarkValid()
        {
            return !string.IsNullOrEmpty(Mark);
        }

        public bool IsModelValid()
        {
            return !string.IsNullOrEmpty(Model);
        }

        public bool IsTypeValid()
        {
            return !string.IsNullOrEmpty(Type);
        }

        public bool IsValid()
        {
            if (IsTypeValid() || IsBoardNumberValid() || IsMarkValid()
                || IsModelValid())
            {
                return true;
            }
            return false;
        }

        [FromQuery(Name = "boardNumber")]
        public string BoardNumber { get; set; }

        [FromQuery(Name = "mark")]
        public string Mark { get; set; }

        [FromQuery(Name = "model")]
        public string Model { get; set; }

        [FromQuery(Name = "type")]
        public string Type { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iflee.Models;
using Iflee.QueryModels;
using Microsoft.EntityFrameworkCore;

namespace Iflee.Models
{
    public class IfleeContext : DbContext
    {
        public IfleeContext (DbContextOptions<IfleeContext> options)
            : base(options)
        {
        }

        public DbSet<Aircraft> Aircrafts { get; set; }
        public DbSet<AircraftsTotal> aircraftsTotals { get; set; }
    }
}

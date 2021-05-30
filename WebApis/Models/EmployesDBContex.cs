using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApis.Models
{
    public class EmployesDBContex :DbContext
    {
        public DbSet <Employes> Employes { get; set; }
        public DbSet <Customers> Customers { get; set;}
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-K7I2IUV;Initial Catalog=Employee;Integrated Security=True");
        }
    }
}

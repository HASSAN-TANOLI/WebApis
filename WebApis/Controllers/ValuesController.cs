using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApis.Models;

namespace WebApis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        public IEnumerable<Employes> Get()
        {
            //CRUD
           using (var _contex = new EmployesDBContex())
            {
                //Create

                Employes employes = new Employes();
                employes.employesname = "jhon";
                employes.employesdesignation = "HR Manager";

                _contex.Employes.Add(employes);
                _contex.SaveChanges();

                //Read
                /*  return _contex.Employes.ToList()*/
                ;


                //Update

                //Employes employes = _contex.Employes.FirstOrDefault();
                //employes.employesname = "jhon Pablo";
                //employes.employessalary = 5000;
                //_contex.SaveChanges();


                //Delete
                //Employes employes = _contex.Employes.FirstOrDefault();
                //_contex.Employes.Remove(employes);
                //_contex.SaveChanges();

                //return _contex.Employes.ToList();

            }

            return new List<Employes>();
        }

    }
}

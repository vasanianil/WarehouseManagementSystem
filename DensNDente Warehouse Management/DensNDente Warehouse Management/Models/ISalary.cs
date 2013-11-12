using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface ISalary
    {
        IEnumerable<tblSalary> GetAll();
        tblSalary Get(int id);

        bool Add(tblSalary obj);
        bool Update(tblSalary obj);
        bool Delete(int id);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IEmployee
    {
        IEnumerable<tblEmployee> GetAll();
        tblEmployee Get(int id);

        bool Add(tblEmployee obj);
        bool Update(tblEmployee obj);
        bool Delete(int id);
    }
}

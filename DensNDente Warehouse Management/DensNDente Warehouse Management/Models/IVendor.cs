using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IVendor
    {
        IEnumerable<tblVendor> GetAll();
        tblVendor Get(int id);

        bool Add(tblVendor obj);
        bool Update(tblVendor obj);
        bool Delete(int id);
    }
}

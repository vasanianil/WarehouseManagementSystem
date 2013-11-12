using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface ISalesTarget
    {
        IEnumerable<tblSalesTarget> GetAll();
        tblSalesTarget Get(int id);

        bool Add(tblSalesTarget obj);
        bool Update(tblSalesTarget obj);
        bool Delete(int id);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IPurchaseOrder
    {
        IEnumerable<tblPurchaseOrder> GetAll();
        tblPurchaseOrder Get(int id);

        bool Add(tblPurchaseOrder obj);
        bool Update(tblPurchaseOrder obj);
        bool Delete(int id);
    }
}

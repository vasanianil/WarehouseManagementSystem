using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IPurchaseOrderDetail
    {
        IEnumerable<tblPurchaseOrderDetail> GetAll();
        tblPurchaseOrderDetail Get(int id);

        bool Add(tblPurchaseOrderDetail obj);
        bool Update(tblPurchaseOrderDetail obj);
        bool Delete(int id);
    }
}

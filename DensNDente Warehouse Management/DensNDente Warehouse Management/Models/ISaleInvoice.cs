using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface ISaleInvoice
    {
        IEnumerable<tblSaleInvoice> GetAll();
        tblSaleInvoice Get(int id);

        bool Add(tblSaleInvoice obj);
        bool Update(tblSaleInvoice obj);
        bool Delete(int id);
    }
}

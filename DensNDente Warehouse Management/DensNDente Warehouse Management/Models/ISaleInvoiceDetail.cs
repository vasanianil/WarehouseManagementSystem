using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface ISaleInvoiceDetail
    {
        IEnumerable<tblSaleInvoiceDetail> GetAll();
        tblSaleInvoiceDetail Get(int id);

        bool Add(tblSaleInvoiceDetail obj);
        bool Update(tblSaleInvoiceDetail obj);
        bool Delete(int id);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface ICustomer
    {
        IEnumerable<tblCustomer> GetAll();
        tblCustomer Get(int id);
        bool Update(tblCustomer obj);
        bool Delete(int id);

        bool Add(tblCustomer obj);

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IProduct
    {
        IEnumerable<tblProduct> GetAll();
        tblProduct Get(int id);

        bool Add(tblProduct obj);
        bool Update(tblProduct obj);
        bool Delete(int id);
    }
}

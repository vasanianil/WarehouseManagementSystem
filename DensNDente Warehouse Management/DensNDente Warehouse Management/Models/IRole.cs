using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IRole
    {
        IEnumerable<tblRole> GetAll();
        tblRole Get(int id);

        bool Add(tblRole obj);
        bool Update(tblRole obj);
        bool Delete(int id);
    }
}

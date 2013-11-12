using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IPermission
    {
        IEnumerable<tblPermission> GetAll();
        tblPermission Get(int id);

        bool Add(tblPermission obj);
        bool Update(tblPermission obj);
        bool Delete(int id);
    }
}

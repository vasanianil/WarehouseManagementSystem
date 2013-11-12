using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IBin
    {
        IEnumerable<tblBin> GetAll();
        tblBin Get(int id);

        bool Add(tblBin obj);
        bool Update(tblBin obj);
        bool Delete(int id);
    }
}

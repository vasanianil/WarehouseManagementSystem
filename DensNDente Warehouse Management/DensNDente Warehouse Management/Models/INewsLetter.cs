using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface INewsLetter
    {
        IEnumerable<tblNewsLetter> GetAll();
        tblNewsLetter Get(int id);

        bool Add(tblNewsLetter obj);
        bool Update(tblNewsLetter obj);
        bool Delete(int id);
    }
}

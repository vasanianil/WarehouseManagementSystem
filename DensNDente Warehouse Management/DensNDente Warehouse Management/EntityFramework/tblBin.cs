//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DensNDente_Warehouse_Management.EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblBin
    {
        public tblBin()
        {
            this.tblProducts = new HashSet<tblProduct>();
        }
    
        public int BinId { get; set; }
        public string Name { get; set; }
        public bool Deleted { get; set; }
    
        public virtual ICollection<tblProduct> tblProducts { get; set; }
    }
}

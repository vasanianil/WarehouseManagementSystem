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
    
    public partial class tblRole
    {
        public tblRole()
        {
            this.tblPermissions = new HashSet<tblPermission>();
            this.tblEmployees = new HashSet<tblEmployee>();
        }
    
        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public bool Stock { get; set; }
        public bool Sales { get; set; }
        public bool Purchase { get; set; }
        public bool Admin { get; set; }
        public bool Payroll { get; set; }
        public bool SalesTarget { get; set; }
        public bool Reports { get; set; }
        public bool Deleted { get; set; }
    
        public virtual ICollection<tblPermission> tblPermissions { get; set; }
        public virtual ICollection<tblEmployee> tblEmployees { get; set; }
    }
}

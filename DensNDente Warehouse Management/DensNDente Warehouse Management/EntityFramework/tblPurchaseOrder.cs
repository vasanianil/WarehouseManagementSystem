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
    
    public partial class tblPurchaseOrder
    {
        public tblPurchaseOrder()
        {
            this.tblPurchaseOrderDetails = new HashSet<tblPurchaseOrderDetail>();
        }
    
        public int POId { get; set; }
        public int VendorId { get; set; }
        public System.DateTime OrderDate { get; set; }
        public decimal TotalValue { get; set; }
        public System.DateTime ExpectedDeliveryDate { get; set; }
        public bool Deleted { get; set; }
    
        public virtual tblVendor tblVendor { get; set; }
        public virtual ICollection<tblPurchaseOrderDetail> tblPurchaseOrderDetails { get; set; }
    }
}
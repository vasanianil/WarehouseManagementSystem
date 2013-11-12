using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class PurchaseOrderDetail : IPurchaseOrderDetail
    {
         DensDBEntities repository;

         public PurchaseOrderDetail()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblPurchaseOrderDetail> GetAll()
        {
            try
            {
                return repository.tblPurchaseOrderDetails.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }
            
        }

        public tblPurchaseOrderDetail Get(int id)
        {

            try
            {
                return repository.tblPurchaseOrderDetails.Where(r => r.PODetailId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblPurchaseOrderDetail obj)
        {

            try
            {
                tblPurchaseOrderDetail result = Get(obj.PODetailId);
                if (result != null)
                {
                    repository.Entry(result).CurrentValues.SetValues(obj);
                    repository.SaveChanges();
                    return true;
                }
                return false;

            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool Delete(int id)
        {

            try
            {
                tblPurchaseOrderDetail result = Get(id);
                if (result != null)
                {
                    result.Deleted = true;
                    repository.SaveChanges();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;

            }
        }


        public bool Add(tblPurchaseOrderDetail obj)
        {

            try
            {
                repository.tblPurchaseOrderDetails.Add(obj);
                repository.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
    }
}
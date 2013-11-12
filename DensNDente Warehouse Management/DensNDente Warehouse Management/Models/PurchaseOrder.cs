using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class PurchaseOrder : IPurchaseOrder
    {
        DensDBEntities repository;

        public PurchaseOrder()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblPurchaseOrder> GetAll()
        {
            try
            {
                return repository.tblPurchaseOrders.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public tblPurchaseOrder Get(int id)
        {

            try
            {
                return repository.tblPurchaseOrders.Where(r => r.POId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblPurchaseOrder obj)
        {

            try
            {
                tblPurchaseOrder result = Get(obj.POId);
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
                tblPurchaseOrder result = Get(id);
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


        public bool Add(tblPurchaseOrder obj)
        {

            try
            {
                repository.tblPurchaseOrders.Add(obj);
                repository.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool Bulk_Insert(tblPurchaseOrder order, List<tblPurchaseOrderDetail> orderDetails)
        {

            try
            {
                foreach (var item in orderDetails)
                {
                    order.tblPurchaseOrderDetails.Add(item);
                }

                repository.tblPurchaseOrders.Add(order);
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
using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class SaleInvoice : ISaleInvoice
    {
        DensDBEntities repository;

        public SaleInvoice()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblSaleInvoice> GetAll()
        {
            try
            {
                return repository.tblSaleInvoices.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }
            
        }

        public tblSaleInvoice Get(int id)
        {

            try
            {
                return repository.tblSaleInvoices.Where(r => r.InvoiceId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblSaleInvoice obj)
        {

            try
            {
                tblSaleInvoice result = Get(obj.InvoiceId);
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
                tblSaleInvoice result = Get(id);
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


        public bool Add(tblSaleInvoice obj)
        {

            try
            {
                repository.tblSaleInvoices.Add(obj);
                repository.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool Bulk_Insert(tblSaleInvoice order, List<tblSaleInvoiceDetail> orderDetails)
        {

            try
            {
                foreach (var item in orderDetails)
                {
                    order.tblSaleInvoiceDetails.Add(item);
                }

                repository.tblSaleInvoices.Add(order);
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
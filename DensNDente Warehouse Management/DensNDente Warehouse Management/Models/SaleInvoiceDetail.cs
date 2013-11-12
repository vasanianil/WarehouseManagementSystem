using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class SaleInvoiceDetail : ISaleInvoiceDetail
    {
        DensDBEntities repository;

        public SaleInvoiceDetail()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblSaleInvoiceDetail> GetAll()
        {
            try
            {
                return repository.tblSaleInvoiceDetails.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }
            
        }

        public tblSaleInvoiceDetail Get(int id)
        {

            try
            {
                return repository.tblSaleInvoiceDetails.Where(r => r.InvoiceDetailId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblSaleInvoiceDetail obj)
        {

            try
            {
                tblSaleInvoiceDetail result = Get(obj.InvoiceDetailId);
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
                tblSaleInvoiceDetail result = Get(id);
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


        public bool Add(tblSaleInvoiceDetail obj)
        {

            try
            {
                repository.tblSaleInvoiceDetails.Add(obj);
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
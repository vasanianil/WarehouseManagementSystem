using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    public class Customer : ICustomer
    {
        DensDBEntities repository;

        public Customer()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblCustomer> GetAll()
        {
            try
            {
                return repository.tblCustomers.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }
            
        }

        public tblCustomer Get(int id)
        {

            try
            {
                return repository.tblCustomers.Where(r => r.CustomerId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblCustomer obj)
        {

            try
            {
                tblCustomer result = Get(obj.CustomerId);
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
                tblCustomer result = Get(id);
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


        public bool Add(tblCustomer obj)
        {

            try
            {
                repository.tblCustomers.Add(obj);
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
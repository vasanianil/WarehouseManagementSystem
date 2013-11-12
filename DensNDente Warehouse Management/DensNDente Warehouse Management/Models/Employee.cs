using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class Employee : IEmployee
    {
        DensDBEntities repository;

        public Employee()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblEmployee> GetAll()
        {
            try
            {
                return repository.tblEmployees.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public tblEmployee Get(int id)
        {

            try
            {
                return repository.tblEmployees.Where(r => r.EmployeeId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblEmployee obj)
        {
            try
            {
                tblEmployee result = Get(obj.EmployeeId);
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
                tblEmployee result = Get(id);
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


        public bool Add(tblEmployee obj)
        {

            try
            {
                repository.tblEmployees.Add(obj);
                repository.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public double Get_Pay_Per_Hour_By_Employee(int id)
        {
            try
            {
                return repository.tblEmployees.Where(r => r.EmployeeId == id).Select(r => r.PayPerHour).First();
            }
            catch (Exception)
            {
                return 0;
            }
        }

    }
}
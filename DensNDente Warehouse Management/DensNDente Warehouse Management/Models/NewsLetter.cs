using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class NewsLetter : INewsLetter
    {
         DensDBEntities repository;

        public NewsLetter()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblNewsLetter> GetAll()
        {
            try
            {
                return repository.tblNewsLetters.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }
            
        }

        public tblNewsLetter Get(int id)
        {

            try
            {
                return repository.tblNewsLetters.Where(r => r.NewsId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblNewsLetter obj)
        {

            try
            {
                tblNewsLetter result = Get(obj.NewsId);
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
                tblNewsLetter result = Get(id);
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


        public bool Add(tblNewsLetter obj)
        {

            try
            {
                repository.tblNewsLetters.Add(obj);
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
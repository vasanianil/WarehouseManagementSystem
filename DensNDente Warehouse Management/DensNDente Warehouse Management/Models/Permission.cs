using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class Permission : IPermission
    {
        DensDBEntities repository;

        public Permission()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblPermission> GetAll()
        {
            try
            {
                return repository.tblPermissions.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public tblPermission Get(int id)
        {

            try
            {
                return repository.tblPermissions.Where(r => r.PermissionId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblPermission obj)
        {

            try
            {
                tblPermission result = Get(obj.PermissionId);
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
                tblPermission result = Get(id);
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


        public bool Add(tblPermission obj)
        {

            try
            {
                repository.tblPermissions.Add(obj);
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
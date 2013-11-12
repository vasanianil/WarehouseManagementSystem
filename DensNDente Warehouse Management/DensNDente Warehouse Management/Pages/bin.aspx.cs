using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DensNDente_Warehouse_Management.Models;
using DensNDente_Warehouse_Management.EntityFramework;
using jQueryNotification.Helper;

namespace DensNDente_Warehouse_Management
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gridBin.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                var repository = new Bin();

                // Add new Bin
                if (repository.Add(new tblBin { Name = txtBinName.Text.Trim() }))
                {
                    // If true
                    // Bin Added Sucessfully
                    this.ShowSuccessfulNotification("Bin added successfully.");
                    gridBin.DataBind();
                }
                else
                {
                    // If false
                    // Something goes wrong
                    this.ShowErrorNotification("Error occured.");
                }

            }
            catch (Exception)
            {
                this.ShowErrorNotification("Error occured.");
            }
            finally
            {
                txtBinName.Text = "";
            }

        }

        protected void gridBin_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            this.ShowSuccessfulNotification("Bin deleted successfully.");
        }

        protected void gridBin_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.ShowSuccessfulNotification("Bin updated successfully.");
        }
    }
}
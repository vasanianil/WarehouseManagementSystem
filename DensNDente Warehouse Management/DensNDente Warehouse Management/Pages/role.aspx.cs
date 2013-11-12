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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Request.QueryString.HasKeys())
                {
                    Get_Role_Data_By_QueryString();
                }
                else
                {
                    Load_Data_Grid();
                }


            }
        }

        private void Get_Role_Data_By_QueryString()
        {
            // Set up environment
            gridRole.Visible = false;
            btnInsert.Visible = false;
            btnUpdate.Visible = true;
            linkBack.Visible = true;


            Role repository = new Role();
            tblRole result = repository.Get(Int32.Parse(Request.QueryString["id"]));

            txtRoleName.Text = result.RoleName;
            ckAdmin.Checked = result.Admin;
            ckPayroll.Checked = result.Payroll;
            ckPurchase.Checked = result.Purchase;
            ckReports.Checked = result.Reports;
            ckSale.Checked = result.Sales;
            ckSalestarget.Checked = result.SalesTarget;
            ckStock.Checked = result.Stock;

        }

        private tblRole get_Data_From_Form()
        {
            return new tblRole
            {
                RoleName = txtRoleName.Text.Trim(),
                Admin = ckAdmin.Checked,
                Payroll = ckPayroll.Checked,
                Purchase = ckPurchase.Checked,
                Reports = ckReports.Checked,
                Sales = ckSale.Checked,
                SalesTarget = ckSalestarget.Checked,
                Stock = ckStock.Checked
            };
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Insert_Role();
        }

        private void Insert_Role()
        {

            Role repository = new Role();
            if (repository.Add(get_Data_From_Form()))
            {
                this.ShowSuccessfulNotification("Role created successfully");
                clear_form();
                Load_Data_Grid();
            }
            else
            {

                this.ShowErrorNotification("Error occured");
            }

        }

        private void Load_Data_Grid()
        {
            Role repository = new Role();
            var result = repository.GetAll().ToArray();
            gridRole.DataSource = result;
            gridRole.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            tblRole result = get_Data_From_Form();
            result.RoleId = Int32.Parse(Request.QueryString["id"]);
            Role repository = new Role();
            if (repository.Update(result))
            {
                Response.Redirect("~/pages/role.aspx");
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }

        protected void gridRole_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gridRole.DataKeys[e.RowIndex].Value;
            Role repository = new Role();
            if (repository.Delete(id))
            {
                this.ShowSuccessfulNotification("Role deleted.");
                Load_Data_Grid();
            }
            else
            {
                this.ShowErrorNotification("Error occured.");
                e.Cancel = true;
            }
        }

        private void clear_form()
        {
            txtRoleName.Text = "";
            ckAdmin.Checked = false;
            ckPayroll.Checked = false;
            ckPurchase.Checked = false;
            ckReports.Checked = false;
            ckSale.Checked = false;
            ckSalestarget.Checked = false;
            ckStock.Checked = false;
        }


    }
}
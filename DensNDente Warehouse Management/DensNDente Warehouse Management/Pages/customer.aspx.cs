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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString.HasKeys())
                {
                    Get_Customer_Data_By_QueryString();
                }
                else
                {
                    Load_Data_Grid();
                }
            }
        }

        private void Load_Data_Grid()
        {
            Customer repository = new Customer();
            var result = repository.GetAll().ToArray();
            gridCustomer.DataSource = result;
            gridCustomer.DataBind();
        }

        private void Get_Customer_Data_By_QueryString()
        {
            // Set up environment
            gridCustomer.Visible = false;
            btnInsert.Visible = false;
            btnUpdate.Visible = true;
            linkBack.Visible = true;


            Customer repository = new Customer();
            tblCustomer result = repository.Get(Int32.Parse(Request.QueryString["id"]));

            txtFirstname.Text = result.Firstname;
            txtLastname.Text = result.Lastname;
            txtCompanyName.Text = result.Title;
            txtAddress.Text = result.Address;
            txtCity.Text = result.City;
            txtState.Text = result.State;
            txtPostalCode.Text = result.PostalCode;
            txtEmail.Text = result.Email;
            txtPhoneNumber.Text = result.Phone;
            txtFaxNumber.Text = result.Fax;


        }

        private tblCustomer get_Data_From_Form()
        {
            return new tblCustomer
            {
                Firstname = txtFirstname.Text.Trim(),
                Lastname = txtLastname.Text.Trim(),
                Address = txtAddress.Text.Trim()
                ,
                City = txtCity.Text.Trim(),
                State = txtState.Text.Trim(),
                Email = txtEmail.Text.Trim()
                ,
                Title = txtCompanyName.Text.Trim(),
                Fax = txtFaxNumber.Text.Trim(),
                Phone = txtPhoneNumber.Text.Trim(),
                PostalCode = txtPostalCode.Text.Trim()
            };
        }


        private void clear_form()
        {
            txtFirstname.Text = "";
            txtLastname.Text = "";
            txtCompanyName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPostalCode.Text = "";
            txtEmail.Text = "";
            txtPhoneNumber.Text = "";
            txtFaxNumber.Text = "";
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Insert_Customer();
        }

        private void Insert_Customer()
        {
            var repository = new Customer();
            if (repository.Add(get_Data_From_Form()))
            {

                this.ShowSuccessfulNotification("Customer added successfully.");
                clear_form();
                Load_Data_Grid();
            }
            else
            {
                this.ShowErrorNotification("Error occured.");
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            tblCustomer result = get_Data_From_Form();
            result.CustomerId = Int32.Parse(Request.QueryString["id"]);
            Customer repository = new Customer();
            if (repository.Update(result))
            {
                Response.Redirect("~/pages/customer.aspx");
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }

        protected void gridCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gridCustomer.DataKeys[e.RowIndex].Value;
            Customer repository = new Customer();
            if (repository.Delete(id))
            {
                this.ShowSuccessfulNotification("Customer deleted.");
                Load_Data_Grid();
            }
            else
            {
                this.ShowErrorNotification("Error occured.");
                e.Cancel = true;
            }
        }



    }
}
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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Load_Data_DropDown_Role();

                if (Request.QueryString.HasKeys())
                {
                    Get_Employee_Data_By_QueryString();
                }
                else
                {
                    Load_Data_Grid();
                }
            }
        }

        private void Get_Employee_Data_By_QueryString()
        {
            // Set up environment
            gridEmployee.Visible = false;
            btnInsert.Visible = false;
            btnUpdate.Visible = true;
            linkBack.Visible = true;


            Employee repository = new Employee();
            tblEmployee result = repository.Get(Int32.Parse(Request.QueryString["id"]));

            txtFirstName.Text = result.FirstName;
            txtMiddleName.Text = result.MiddleName;
            txtLastName.Text = result.LastName;
            txtEmail.Text = result.Email;
            txtPay.Text = result.PayPerHour.ToString();
            txtAddress.Text = result.Address;
            txtMobileNo.Text = result.MobileNo;
            txtPassword.Text = result.Password;
            txtPhoneNo.Text = result.PhoneNo;
            txtSinNo.Text = result.SINNo;
            cbRole.SelectedValue = result.RollId.ToString();
        }

        private void Load_Data_Grid()
        {
            Employee repository = new Employee();
            var result = repository.GetAll().ToArray();
            gridEmployee.DataSource = result;
            gridEmployee.DataBind();
        }

        private void Load_Data_DropDown_Role()
        {
            try
            {
                Role repository = new Role();
                var result = repository.GetAll().Select(r => new { r.RoleName, r.RoleId }).ToArray();
                cbRole.DataSource = result;
                cbRole.DataTextField = "RoleName";
                cbRole.DataValueField = "RoleId";
                cbRole.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

            Insert_Employee();

        }

        private tblEmployee get_Data_From_Form()
        {
            return new tblEmployee
                {
                    FirstName = txtFirstName.Text.Trim(),
                    MiddleName = txtMiddleName.Text.Trim(),
                    LastName = txtLastName.Text.Trim(),
                    Address = txtAddress.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    MobileNo = txtMobileNo.Text.Trim(),
                    Password = txtPassword.Text.Trim(),
                    PayPerHour = double.Parse(txtPay.Text.Trim()),
                    PhoneNo = txtPhoneNo.Text.Trim(),
                    SINNo = txtSinNo.Text.Trim(),
                    RollId = Int32.Parse(cbRole.SelectedValue)
                };
        }

        private void Insert_Employee()
        {
            Employee repository = new Employee();

            if (repository.Add(get_Data_From_Form()))
            {
                this.ShowSuccessfulNotification("Employee added successfully");
                clear_form();
                Load_Data_Grid();
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            tblEmployee result = get_Data_From_Form();
            result.EmployeeId = Int32.Parse(Request.QueryString["id"]);
            Employee repository = new Employee();
            if (repository.Update(result))
            {
                this.ShowSuccessfulNotification("Employee updated.");
                Response.Redirect("~/pages/employee.aspx");
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }

        private void clear_form()
        {
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPay.Text = "";
            txtAddress.Text = "";
            txtMobileNo.Text = "";
            txtPassword.Text = "";
            txtPhoneNo.Text = "";
            txtSinNo.Text = "";
            cbRole.SelectedIndex = -1;
        }

        protected void gridEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gridEmployee.DataKeys[e.RowIndex].Value;
            Employee repository = new Employee();
            if (repository.Delete(id))
            {
                this.ShowSuccessfulNotification("Employee deleted.");
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
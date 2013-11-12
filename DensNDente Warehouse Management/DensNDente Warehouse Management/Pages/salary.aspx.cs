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
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Load_Data_DropDown_Employee();

                if (Request.QueryString.HasKeys())
                {
                    Get_Salary_Data_By_QueryString();
                }
                else
                {
                    Load_Data_Grid();
                }
            }
        }

        private void Load_Data_Grid()
        {
            Salary repository = new Salary();
            var result = repository.GetAll().Select(r => new { r.SalaryId, r.StartDate, r.EndDate, r.TotalHours, r.TotalSalary, r.tblEmployee.FirstName }).ToArray();
            gridSalary.DataSource = result;
            gridSalary.DataBind();
        }

        private void Get_Salary_Data_By_QueryString()
        {
            // Set up environment
            gridSalary.Visible = false;
            btnInsert.Visible = false;
            btnUpdate.Visible = true;
            linkBack.Visible = true;


            Salary repository = new Salary();
            tblSalary result = repository.Get(Int32.Parse(Request.QueryString["id"]));

            cbEmployee.SelectedValue = result.EmployeeId.ToString();
            txtStartDate.Text = result.StartDate.ToShortDateString();
            txtEndDate.Text = result.EndDate.ToShortDateString();
            txtTotalHours.Text = result.TotalHours.ToString();
            lblTotalSalary.Text = result.TotalSalary.ToString();


        }

        private void Load_Data_DropDown_Employee()
        {
            try
            {
                Employee repository = new Employee();
                var result = repository.GetAll().Select(r => new { r.EmployeeId, r.FirstName }).ToArray();
                cbEmployee.DataSource = result;
                cbEmployee.DataTextField = "FirstName";
                cbEmployee.DataValueField = "EmployeeId";
                cbEmployee.DataBind();
            }
            catch (Exception)
            {
            }
        }

        private tblSalary get_Data_From_Form()
        {
            Employee empl = new Employee();
            double Pay = empl.Get_Pay_Per_Hour_By_Employee(Int32.Parse(cbEmployee.SelectedValue));

            return new tblSalary
            {
                EmployeeId = Int32.Parse(cbEmployee.SelectedValue),
                StartDate = DateTime.Parse(txtStartDate.Text),
                EndDate = DateTime.Parse(txtEndDate.Text),
                TotalHours = Int32.Parse(txtTotalHours.Text.Trim()),
                TotalSalary = Convert.ToDecimal(Int32.Parse(txtTotalHours.Text.Trim()) * Pay)
            };
        }

        private void Insert_Salary()
        {
            Salary repository = new Salary();

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

        private void clear_form()
        {
            cbEmployee.SelectedIndex = 0;
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtTotalHours.Text = "";
            lblTotalSalary.Text = "";
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Insert_Salary();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            tblSalary result = get_Data_From_Form();
            result.SalaryId = Int32.Parse(Request.QueryString["id"]);
            Salary repository = new Salary();
            if (repository.Update(result))
            {
                Response.Redirect("~/pages/salary.aspx");
            }
            else
            {
                this.ShowErrorNotification("Error occured");
            }
        }

        protected void gridSalary_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gridSalary.DataKeys[e.RowIndex].Value;
            Salary repository = new Salary();
            if (repository.Delete(id))
            {
                this.ShowSuccessfulNotification("Salary deleted.");
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
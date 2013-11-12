<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 130px;
            text-align: right;
            padding-right: 10px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; float: left">
        <div style="width: 50%; float: left">

            <table>
                <tr>
                    <td class="auto-style1"></td>
                    <td style="font-weight: bold; font-size: 26px; color: #ed4e6e">Add New Customer</td>
                </tr>
                <tr>
                    <td class="auto-style1">Firstname:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstname" runat="server" Width="250" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Lastname:</td>
                    <td>
                        <asp:TextBox ID="txtLastname" runat="server" Width="250" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Company Name:</td>
                    <td>
                        <asp:TextBox ID="txtCompanyName" runat="server" Width="250"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Address:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Width="250" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">City:</td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" Width="250" list="city" required></asp:TextBox>

                        <datalist id="city">
                            <option value="Toronto"></option>
                            <option value="Scarborough"></option>
                            <option value="Richmond Hill"></option>
                            <option value="Pickering"></option>
                            <option value="Ottawa"></option>
                            <option value="Ajax"></option>
                            <option value="Brampton"></option>

                        </datalist>

                    </td>
                </tr>

            </table>
        </div>
        <div style="width: 50%; float: left">
            <table>
                <tr style="height: 34px;">
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">State:</td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server" Width="250" list="state" required></asp:TextBox>
                        <datalist id="state">
                            <option value="Ontario"></option>
                            <option value="Quebec"></option>
                            <option value="British Columbia"></option>
                            <option value="Alberta"></option>
                            <option value="Manitoba"></option>
                            <option value="Nova Scotia"></option>
                            <option value="Yukon"></option>

                        </datalist>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Postal Code:</td>
                    <td>
                        <asp:TextBox MaxLength="6" title="Ex: M1E2R3" placeholder="ex: M1E2R3" pattern="[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]" ID="txtPostalCode" runat="server" Width="250" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="250" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Phone Number:</td>
                    <td>
                        <asp:TextBox MaxLength="10" pattern="[0-9]{10}" ID="txtPhoneNumber" runat="server" Width="250" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Fax Number:</td>
                    <td>
                        <asp:TextBox ID="txtFaxNumber" runat="server" Width="250" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td>
                        <asp:Button ID="btnInsert" CssClass="button" runat="server" Text="Add New Customer" OnClick="btnInsert_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update Customer" CssClass="button" Visible="false" OnClick="btnUpdate_Click" />
                        <asp:HyperLink ID="linkBack" CssClass="button-cancel" runat="server" NavigateUrl="~/Pages/customer.aspx" Visible="false">Cancel</asp:HyperLink>
                    </td>
                </tr>

            </table>
        </div>
    </div>

    <div style="width: 100%; float: left">
        <div class="gridHeaderStyle">
            View All Customers
        </div>
        <div>
            <asp:GridView CssClass="ctable" ID="gridCustomer" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerId" AutoGenerateDeleteButton="True" OnRowDeleting="gridCustomer_RowDeleting">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="customer.aspx?id=<%# Eval("CustomerId") %>">Edit</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                </Columns>



            </asp:GridView>
        </div>






    </div>

</asp:Content>

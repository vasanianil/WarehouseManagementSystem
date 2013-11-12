<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="bin.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm2" %>


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
    <div>

        <div style="width: 50%; float: left">

            <table>
                <tr>
                    <td></td>
                    <td style="font-weight:bold; font-size:26px;color:#ed4e6e">Add New Bin</td>
                </tr>
                <tr>
                    <td class="auto-style1">Bin Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtBinName" runat="server" Width="250" required></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td>
                        <asp:Button ID="btnInsert" CssClass="button" runat="server" Text="Add New Bin" OnClick="btnInsert_Click" />
                    </td>
                </tr>
            </table>

        </div>
        <div style="width: 50%; float: left">

            <asp:GridView CssClass="ctable" ID="gridBin" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="BinId" DataSourceID="DSBin" AllowPaging="True" AllowSorting="True" OnRowDeleted="gridBin_RowDeleted" OnRowUpdated="gridBin_RowUpdated" PageSize="10">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="BinId" HeaderText="BinId" InsertVisible="False" ReadOnly="True" SortExpression="BinId" Visible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Bin Name" SortExpression="Name"/>
                </Columns>

                <PagerStyle CssClass="PagerStyle" HorizontalAlign="Right" />

            </asp:GridView>

            <asp:SqlDataSource ID="DSBin" runat="server" ConnectionString="<%$ ConnectionStrings:DensDBConnectionString %>" DeleteCommand="UPDATE [tblBin] SET [Deleted] = 'true' WHERE [BinId] = @BinId" InsertCommand="INSERT INTO [tblBin] ([Name], [Deleted]) VALUES (@Name, @Deleted)" SelectCommand="SELECT * FROM [tblBin] WHERE [Deleted]='false'" UpdateCommand="UPDATE [tblBin] SET [Name] = @Name WHERE [BinId] = @BinId">
                <DeleteParameters>
                    <asp:Parameter Name="BinId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Deleted" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="BinId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>

    </div>

</asp:Content>

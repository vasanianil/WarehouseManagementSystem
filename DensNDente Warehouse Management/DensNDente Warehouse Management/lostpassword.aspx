<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lostpassword.aspx.cs" Inherits="DensNDente_Warehouse_Management.lostpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <div class="login-screen">
                <div class="app-title">
                    <h1>Lost Password</h1>
                </div>

                <div class="login-form">
                    <div class="control-group">
                        <input type="text" value="" placeholder="username" id="login-name">
                        <label class="login-field-icon fui-user" for="login-name"></label>
                    </div>

                  
                    <a class="btn btn-primary btn-large btn-block" href="#">Send email</a>
                    <a class="login-link" href="default.aspx">back to login</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

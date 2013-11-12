<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DensNDente_Warehouse_Management._default" %>

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
                        <h1>Login</h1>
                    </div>

                    <div class="login-form">
                        <div class="control-group">
                            <input type="text" value="" placeholder="username" id="login-name">
                            <label class="login-field-icon fui-user" for="login-name"></label>
                        </div>

                        <div class="control-group">
                            <input type="password" class="login-field" value="" placeholder="password">
                            <label class="login-field-icon fui-lock" for="login-pass"></label>
                        </div>

                        <a class="btn btn-primary btn-large btn-block" href="#">login</a>
                        <a class="login-link" href="lostpassword.aspx">Lost your password?</a>
                    </div>
                </div>
            </div>
      
    </form>
</body>
</html>

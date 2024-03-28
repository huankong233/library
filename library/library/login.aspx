<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="library.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link href="./assets/css/login.css" rel="stylesheet" />
    <style>
        .container .input:nth-child(3){
            margin-bottom:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <p>图书馆管理系统</p>

        <div class="input">
            <span>账号:</span>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
        </div> 

        <div class="input">
            <span>密码:</span>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </div> 
        
        <asp:Label ID="success" runat="server" Text="" CssClass="success"></asp:Label>
        <asp:Label ID="fail" runat="server" Text="" CssClass="fail"></asp:Label>

        <div class="flex">
            <asp:Button ID="Register" runat="server" Text="注册" OnClick="GoRegister" CssClass="submit"/>
            <asp:Button ID="Submit" runat="server" Text="登陆" OnClick="SubmitForm" CssClass="submit"/>
        </div>
    </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="borrow.aspx.cs" Inherits="library.admin.book.borrow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>图书馆管理系统 - 图书借阅</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>图书借还管理</h1>
    <div class="input">
        <h2>图书借阅</h2>
        <div class="items">
            <label>
                <span>读者用户名:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>ISBN:</span>
                <asp:TextBox ID="ISBN" runat="server" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="提交" runat="server" class="submit"/>
        <div class="clear"></div>
    </div>
</asp:Content>

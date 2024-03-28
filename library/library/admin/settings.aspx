<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="library.setting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书馆管理系统 - 系统设置</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>系统设置</h1>
    <div class="input">
        <h2>图书馆信息</h2>
        <div class="items">
            <label>
                <span>图书馆名称:</span>
                <asp:TextBox ID="libraryname" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>馆长姓名:</span>
                <asp:TextBox ID="curator" runat="server" required="required"></asp:TextBox>                
            </label>
            <label>
                <span>图书馆电话:</span>
                <asp:TextBox ID="tel" runat="server" type="tel" required="required"></asp:TextBox>                                
            </label>
            <label>
                <span>图书馆地址:</span>
                <asp:TextBox ID="address" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书馆邮箱:</span>
                <asp:TextBox ID="email" runat="server" type="email" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书馆网址:</span>
                <asp:TextBox ID="url" runat="server" type="url" required="required"></asp:TextBox>
            </label>
            <label>
                <span>建馆时间:</span>
                <asp:TextBox ID="createdate" runat="server" type="datetime-local" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书馆介绍:</span>
                <asp:TextBox ID="introduce" runat="server" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="保存" runat="server" class="submit" ID="submit" OnClick="submit_Click"/>
        <div class="clear"></div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="library.admin.book.info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>图书馆管理系统 - 图书档案管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>图书档案管理</h1>
    <div class="input">
        <h2>添加图书</h2>
        <div class="items">
            <label>
                <span>ISBN:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书名称:</span>
                <asp:DropDownList ID="type" runat="server" required="required">
                    <asp:ListItem>身份证</asp:ListItem>
                </asp:DropDownList>
            </label>
            <label>
                <span>图书类型:</span>
                <asp:DropDownList ID="papertype" runat="server" required="required">
                    <asp:ListItem>身份证</asp:ListItem>
                </asp:DropDownList>
            </label>
            <label>
                <span>图书作者:</span>
                <asp:TextBox ID="papernum" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书译者:</span>
                <asp:TextBox ID="birthday" runat="server" type="date" required="required"></asp:TextBox>
            </label>
            <label>
                <span>出版社名:</span>
                <asp:TextBox ID="tel" runat="server" type="tel" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书价格:</span>
                <asp:TextBox ID="email" runat="server" type="email" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书页数:</span>
                <asp:TextBox ID="remark" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>书架编号:</span>
                <asp:TextBox ID="TextBox1" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>库存数量:</span>
                <asp:TextBox ID="TextBox2" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>入库时间:</span>
                <asp:TextBox ID="TextBox3" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>借阅次数:</span>
                <asp:TextBox ID="TextBox4" runat="server" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="添加" runat="server" class="submit"/>
        <div class="clear"></div>
    </div>
</asp:Content>

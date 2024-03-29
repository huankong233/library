<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="back.aspx.cs" Inherits="library.admin.book.back" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>图书馆管理系统 - 图书归还</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>图书借还管理</h1>
    <div class="input">
        <h2>图书归还</h2>
        <div class="items">
            <label>
                <span>读者用户名:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="搜索" runat="server" class="submit" ID="Submit" OnClick="Submit_Click"/>
        <div class="clear"></div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="操作" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" Text="还书" CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="bookcode.Bookname" HeaderText="书本名称" />
            <asp:BoundField DataField="borrowtime" HeaderText="借书日期" />
            <asp:BoundField DataField="ygbacktime" HeaderText="应该还书日期" />
            <asp:BoundField DataField="borrowoper.Name" HeaderText="借书管理员" />
        </Columns>
    </asp:GridView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="type.aspx.cs" Inherits="library.admin.book.type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>图书馆管理系统 - 图书类型管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>图书类型管理</h1>
    <div class="input">
        <h2>添加类型</h2>
        <div class="items">
            <label>
                <span>类型名称:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>可借天数:</span>
                <asp:TextBox ID="days" runat="server" type="number" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="添加" runat="server" ID="submit" class="submit" OnClick="submit_Click"/>
        <div class="clear"></div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True"/>
            <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" />
            <asp:BoundField DataField="typename" HeaderText="类型名称" />
            <asp:TemplateField HeaderText="可借天数" >
                <EditItemTemplate>
                    <asp:TextBox runat="server" type="number" value='<%# Eval("days") %>'/>
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("days") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

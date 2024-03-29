<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="case.aspx.cs" Inherits="library.admin.book._case" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书馆管理系统 - 书架管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>书架管理</h1>
    <div class="input">
        <h2>添加书架</h2>
        <div class="items">
            <label>
                <span>书架名:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="添加" runat="server" ID="Submit" class="submit" OnClick="Submit_Click" />
        <div class="clear"></div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" />
            <asp:BoundField DataField="name" HeaderText="书架名" />
        </Columns>
    </asp:GridView>
</asp:Content>

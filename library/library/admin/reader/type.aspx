<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="type.aspx.cs" Inherits="library.admin.reader.type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书馆管理系统 - 读者类型</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>读者类型</h1>
    <div class="input">
        <h2>添加类型</h2>
        <div class="items">
            <label>
                <span>类型名称:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>可借书量:</span>
                <asp:TextBox ID="num" runat="server" required="required" type="number"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="添加" ID="submit" runat="server" class="submit" OnClick="Submit_Click"/>
        <div class="clear"></div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True"/>
            <asp:BoundField DataField="Id" HeaderText="类型编号" ReadOnly="true"/>
            <asp:BoundField DataField="Name" HeaderText="类型名称" />
            <asp:BoundField DataField="Number" HeaderText="可借数量" />
        </Columns>
    </asp:GridView>
</asp:Content>
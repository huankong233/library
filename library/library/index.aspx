<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="library.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书馆管理系统 - 首页</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>书本借阅排名</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="排名" InsertVisible="False"> 
                <ItemTemplate>
                    <%#Container.DataItemIndex+1%> 
                </ItemTemplate> 
            </asp:TemplateField>
            <asp:BoundField DataField="bookname" HeaderText="书本名称" />
            <asp:BoundField DataField="borrownum" HeaderText="借阅次数" />
        </Columns>
    </asp:GridView>

    <br />
    <h1>读者借阅排名</h1>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="排名" InsertVisible="False"> 
                <ItemTemplate>
                    <%#Container.DataItemIndex+1%> 
                </ItemTemplate> 
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="用户名称" />
            <asp:BoundField DataField="num" HeaderText="借阅次数" />
        </Columns>
    </asp:GridView>
</asp:Content>

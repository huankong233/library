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
                <asp:TextBox ID="ISBN" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书名称:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>                
            </label>
            <label>
                <span>图书类型:</span>
                <asp:DropDownList ID="type" runat="server" required="required"></asp:DropDownList>
            </label>
            <label>
                <span>图书作者:</span>
                <asp:TextBox ID="author" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书译者:</span>
                <asp:TextBox ID="translator" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>出版社名:</span>
                <asp:TextBox ID="pubname" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书价格:</span>
                <asp:TextBox ID="price" runat="server" type="number" required="required"></asp:TextBox>
            </label>
            <label>
                <span>图书页数:</span>
                <asp:TextBox ID="bookpage" runat="server" type="number" required="required"></asp:TextBox>
            </label>
            <label>
                <span>书架名称:</span>
                <asp:DropDownList ID="bcase" runat="server" required="required"></asp:DropDownList>
            </label>
            <label>
                <span>库存数量:</span>
                <asp:TextBox ID="storage" runat="server" type="number" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="添加" runat="server" class="submit" ID="Submit" OnClick="Submit_Click"/>
        <div class="clear"></div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="width: max-content;" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="bookcode" HeaderText="ISBN" ReadOnly="True" />
            <asp:BoundField DataField="bookname" HeaderText="图书名称" />
            <asp:TemplateField HeaderText="图书类型">
                <EditItemTemplate>
                    <asp:DropDownList ID="type" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("type.Typename") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="author" HeaderText="图书作者" />
            <asp:BoundField DataField="translator" HeaderText="图书译者" />
            <asp:BoundField DataField="pubname" HeaderText="出版社名" />
            <asp:BoundField DataField="price" HeaderText="图书价格" />
            <asp:BoundField DataField="page" HeaderText="图书页数" />
            <asp:TemplateField HeaderText="书架名称">
                <EditItemTemplate>
                    <asp:DropDownList ID="bcase" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("bcase.Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="库存数量">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("storage") %>' type="number"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("storage") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="入库时间">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Convert.ToDateTime(Eval("inTime")).ToString("yyyy-MM-dd HH:mm:ss") %>' type="datetime-local"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("inTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="借阅次数">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("borrownum") %>' type="number"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("borrownum") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

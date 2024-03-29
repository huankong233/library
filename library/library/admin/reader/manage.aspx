<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="manage.aspx.cs" Inherits="library.admin.reader.manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书馆管理系统 - 读者增删</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>读者增删</h1>
    <div class="input">
        <h2>添加读者</h2>
        <div class="items">
            <label>
                <span>读者姓名:</span>
                <asp:TextBox ID="name" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>读者类型:</span>
                <asp:DropDownList ID="type" runat="server" required="required"></asp:DropDownList>
            </label>
            <label>
                <span>证件类型:</span>
                <asp:DropDownList ID="papertype" runat="server" required="required">
                    <asp:ListItem>身份证</asp:ListItem>
                </asp:DropDownList>
            </label>
            <label>
                <span>证件号码:</span>
                <asp:TextBox ID="papernum" runat="server" required="required"></asp:TextBox>
            </label>
            <label>
                <span>读者生日:</span>
                <asp:TextBox ID="birthday" runat="server" type="datetime-local" required="required"></asp:TextBox>
            </label>
            <label>
                <span>读者电话:</span>
                <asp:TextBox ID="tel" runat="server" type="tel" required="required"></asp:TextBox>
            </label>
            <label>
                <span>读者邮箱:</span>
                <asp:TextBox ID="email" runat="server" type="email" required="required"></asp:TextBox>
            </label>
            <label>
                <span>读者备注:</span>
                <asp:TextBox ID="remark" runat="server" required="required"></asp:TextBox>
            </label>
        </div>
        <asp:Button Text="添加" ID="submit" runat="server" class="submit" OnClick="Submit_Click" />
        <div class="clear"></div>
    </div>
    <asp:GridView ID="GridView1" Style="width: max-content;" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="读者编号" ReadOnly="true" />
            <asp:BoundField DataField="name" HeaderText="读者姓名" />
            <asp:TemplateField HeaderText="读者类型">
                <EditItemTemplate>
                    <asp:DropDownList ID="type" runat="server" required="required"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("type.Name") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="读者生日">
                <EditItemTemplate>
                    <asp:TextBox ID="birthday" runat="server" type="datetime-local" required="required" value='<%# Convert.ToDateTime(Eval("birthday")).ToString("yyyy-MM-dd HH:mm:ss") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("birthday") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="证件类型">
                <EditItemTemplate>
                    <asp:DropDownList ID="papertype" runat="server" required="required">
                        <asp:ListItem>身份证</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("papertype") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="papernum" HeaderText="证件号码" />
            <asp:TemplateField HeaderText="读者电话">
                <EditItemTemplate>
                    <asp:TextBox ID="tel" runat="server" required="required" type="tel" value='<%# Eval("tel") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("tel") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="读者邮箱">
                <EditItemTemplate>
                    <asp:TextBox ID="email" runat="server" required="required" type="email" value='<%# Eval("email") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("email") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="remark" HeaderText="读者备注" />
            <asp:TemplateField HeaderText="借书总数">
                <EditItemTemplate>
                    <asp:TextBox ID="borrownum" runat="server" required="required" type="number" value='<%# Eval("borrownum") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("borrownum") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="借阅次数">
                <EditItemTemplate>
                    <asp:TextBox ID="num" runat="server" required="required" type="number" value='<%# Eval("num") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <%# Eval("num") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

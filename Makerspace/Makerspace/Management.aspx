<%@ Page Title="Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="Makerspace.Management" EnableViewState="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EquipmentDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <%--<asp:CommandField HeaderText="Edit" ShowEditButton="True" HeaderStyle-Width="20%" ItemStyle-Width="20%" />--%>
            <asp:CommandField HeaderText="Edit / Delete" ShowEditButton="True" HeaderStyle-Width="20%" ItemStyle-Width="20%" ShowDeleteButton="True"/>
            <%--<asp:CommandField HeaderText="Delete" ShowDeleteButton="True" HeaderStyle-Width="20%" ItemStyle-Width="20%" />--%>

            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" HeaderStyle-Width="10%" ItemStyle-Width="10%"/>
            <asp:TemplateField HeaderText="Code" >
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("code") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox  ID="CodeEditTextBox" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="CodeInsertTextBox" runat="server" ></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label  runat="server" Text='<%# Eval("name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="NameEditTextBox" runat="server" Text='<%# Bind("name") %>' Width="20px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="NameInsertTextBox" runat="server" ></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Fixed Asset">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("fixed_asset") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="FixedAssetEditTextBox" runat="server" Text='<%# Bind("fixed_asset") %>' Width="400px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FixedAssetInsertTextBox" runat="server" ></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
     
            <asp:TemplateField HeaderText="Deleted Asset">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("deleted") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="DeletedAssetEditTextBox" runat="server" Text='<%# Bind("deleted") %>' Width="400px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="DeletedAssetInsertTextBox" runat="server" ></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

             <asp:TemplateField>
                        <FooterTemplate>
                             <asp:Button ID="InsertBtn" runat="server"  Text="insert" OnClick="InsertBtn_Click"/>
                        </FooterTemplate>
             </asp:TemplateField>




            <%--<asp:BoundField DataField="code" HeaderText="Code" SortExpression="code" HeaderStyle-Width="10%" ItemStyle-Width="10%"/>
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" HeaderStyle-Width="40%" ItemStyle-Width="40%" />
            <asp:BoundField DataField="fixed_access" HeaderText="Fixed Access" SortExpression="fixed_access" HeaderStyle-Width="20%" ItemStyle-Width="20%"/>
                Delete from Equipment where id=@id;--%>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="EquipmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" DeleteCommand="UPDATE Equipment SET deleted=1 WHERE id=@id;"  SelectCommand="SELECT [id], [code], [name], [fixed_asset], [deleted] FROM [Equipment] ORDER BY [code], [fixed_asset] DESC" UpdateCommand="UPDATE Equipment SET fixed_asset=@fixed_asset, deleted=@deleted WHERE id=@id;">
        <UpdateParameters>
            <asp:Parameter Name="fixed_asset" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="deleted" />
            <asp:Parameter Name="id" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>

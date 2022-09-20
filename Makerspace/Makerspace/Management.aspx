<%@ Page Title="Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="Makerspace.Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EquipmentDataSource" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" HeaderStyle-Width="10%" ItemStyle-Width="10%"/>
            <asp:BoundField DataField="code" HeaderText="Code" SortExpression="code" HeaderStyle-Width="10%" ItemStyle-Width="10%"/>
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" HeaderStyle-Width="40%" ItemStyle-Width="40%" />
            <asp:BoundField DataField="fixed_access" HeaderText="Fixed Access" SortExpression="fixed_access" HeaderStyle-Width="20%" ItemStyle-Width="20%"/>
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
    <asp:SqlDataSource ID="EquipmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" SelectCommand="SELECT [id], [code], [name], [fixed_access] FROM [Equipment] ORDER BY [code], [fixed_access] DESC" UpdateCommand="UPDATE Equipment SET fixed_access=@fixed_access WHERE id=@id;">
        <UpdateParameters>
            <asp:Parameter Name="fixed_access" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

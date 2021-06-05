<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEquipment.aspx.cs" Inherits="Makerspace.DeleteEquipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="jumbotron">
       <h2>Manage your equipments</h2>
       <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="eID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <Columns>
               <asp:TemplateField>
                   <ItemTemplate>
                       <asp:CheckBox ID="CheckBox1" runat="server" />
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:BoundField DataField="eID" HeaderText="eID" InsertVisible="False" ReadOnly="True" SortExpression="eID" />
               <asp:BoundField DataField="eCode" HeaderText="eCode" SortExpression="eCode" />
               <asp:BoundField DataField="eName" HeaderText="eName" SortExpression="eName" />
               <asp:BoundField DataField="eDesc" HeaderText="eDesc" SortExpression="eDesc" />
               <asp:BoundField DataField="eFunction" HeaderText="eFunction" SortExpression="eFunction" />
               <asp:BoundField DataField="eManual" HeaderText="eManual" SortExpression="eManual" />
               <asp:BoundField DataField="eSafety" HeaderText="eSafety" SortExpression="eSafety" />
               <asp:BoundField DataField="eTraining" HeaderText="eTraining" SortExpression="eTraining" />
           </Columns>
           <EditRowStyle BackColor="#999999" />
           <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
           <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
           <SortedAscendingCellStyle BackColor="#E9E7E2" />
           <SortedAscendingHeaderStyle BackColor="#506C8C" />
           <SortedDescendingCellStyle BackColor="#FFFDF8" />
           <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
       </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" SelectCommand="SELECT [eID], [eCode], [eName], [eDesc], [eFunction], [eManual], [eSafety], [eTraining] FROM [Equipment]"></asp:SqlDataSource>
       <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Delete" />
   </div>
</asp:Content>

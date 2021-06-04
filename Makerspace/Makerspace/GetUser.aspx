<%@ Page Title="Get User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GetUser.aspx.cs" Inherits="Makerspace.GetUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>GET USERS</h1>
    </div>
    <div>
        
        <h5>
            User ID: 
            <asp:TextBox runat="server" ID="UserID" Width="100px" TextMode="Number"></asp:TextBox>
            <asp:Button runat="server" Text="Search" OnClick="SearchBtnClick"/>
            <asp:DropDownList 
                ID="RoleList" 
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged ="RoleList_SelectedIndexChanged">
            </asp:DropDownList>
            
            Department: 
            <asp:DropDownList ID="DeptList" runat="server"></asp:DropDownList>
       
        </h5>
            
            
       
        <asp:Panel ID="Output" runat="server" >
            <h5>Total: 
            <asp:Label runat="server" ID="count">0</asp:Label>
            </h5>
            <asp:GridView runat="server" ID="RetGridView" HorizontalAlign="Center"></asp:GridView>
  

        </asp:Panel>
        
    </div>
</asp:Content>
   
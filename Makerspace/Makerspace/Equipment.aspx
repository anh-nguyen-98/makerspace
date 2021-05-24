<%@ Page Title="Equipment Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="Makerspace.Equipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
       <h1>Find Makerspace Equipment</h1>
   </div>
    <div id="CategoryMenu" style="text-align:center">

        <asp:ListView ID="categoryList" runat="server">
        </asp:ListView>

    </div>
    
</asp:Content>

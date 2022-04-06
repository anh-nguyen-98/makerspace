<%@ Page Title="Equipment Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentDetail.aspx.cs" Inherits="Makerspace.EquipmentDetail" %>
<asp:Content ID="EDetail" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
        <div class="one">One
            <br />
            <img src="Images/A18-030.jpg>"/>
        </div>
        <div class="two">
            <asp:Label style="background-color:#FFAD1D; color:#00196E; padding:10px 30px 10px 30px; font-size:24px; font-weight:700; text-align:center; border-radius:4px" runat="server">CODE12345</asp:Label>
            <asp:Label runat="server" style="display:inline-block; color:#00196E; font-size:24px; font-weight:700; float:right">Originial Prusa i3 MK3</asp:Label>
            <br />
            <asp:Label runat="server" style="display:block; color:#00196E;  font-size:60px; font-weight:800; background-color:#E1E1DE; padding:10px 160px 10px 160px; height:100px; text-align:center; border-radius:12px">3D Printer</asp:Label>
        </div>
        <div class="three">Three</div>
    </div>
</asp:Content>

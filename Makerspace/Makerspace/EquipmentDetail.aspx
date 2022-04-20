<%@ Page Title="Equipment Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentDetail.aspx.cs" Inherits="Makerspace.EquipmentDetail" %>
<asp:Content ID="EDetail" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
        <div class="one">
            <div>          
                <img src="Images\A18-030.jpg" width="260" height="260" style="vertical-align:baseline">
            <br />
            <div style="display: flex; justify-content:center">
                 <asp:Label id="name" style="background-color: #00196E; color: white; font-size: 24px; border-radius: 4px; font-weight: 700; position: absolute; padding: 6px 15px 6px 15px;" runat="server">Heavy Machine</asp:Label>
            </div>
            </div>
  
        </div>
        <div class="two">
            <asp:Label id="eid" style="background-color:#FFAD1D; color:#00196E; padding:10px 30px 10px 30px; font-size:24px; font-weight:700; text-align:center; border-radius:4px; vertical-align: super" runat="server" OnLoad="code_Load"></asp:Label>
            <asp:Label id="brand" runat="server" style="display:inline-block; color:#00196E; font-size:24px; font-weight:700; float:right" OnLoad="code_Load">Originial Prusa i3 MK3</asp:Label>
            <br />
            <asp:Label runat="server" style="display:block; color:#00196E;  font-size:60px; font-weight:800; background-color:#E1E1DE; padding:10px 160px 10px 160px; height:100px; text-align:center; border-radius:12px">3D Printer</asp:Label>
        </div>
        <div class="three">
            <asp:Label id="count" class="equipment_info" runat="server">Total: Link</asp:Label>
            <br/>
            <asp:Label id="description" class="equipment_info" runat="server">Quick guide: Link</asp:Label>
            <br />
            <asp:Label id="instruction" class="equipment_info" runat="server">Video instruction: Link</asp:Label>
            <br />
            <asp:Label ID="training" class="equipment_info" runat="server">Training requirement: Link</asp:Label>
            <br />
        </div>
    </div>
</asp:Content>

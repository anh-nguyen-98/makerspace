<%@ Page Title="Edit Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEquipment.aspx.cs" Inherits="Makerspace.EditEquipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div></div>
    <asp:TextBox runat="server" ID="Input" Width="385px"></asp:TextBox>
    <asp:Button runat="server" ID="SearchBtn" Text="Search" OnClick="SearchBtn_Click"/>
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
	<asp:DetailsView
		ID="dvShippers" 
		runat="server" 
		AllowPaging="false"
		AutoGenerateRows="false" 
		DataKeyNames="eID" OnItemUpdating="dvShippers_ItemUpdating" 
		OnModeChanging="dvShippers_ModeChanging">
		<Fields>
			<asp:BoundField DataField="eID" HeaderText="ID" />
			<asp:BoundField DataField="eName" HeaderText="Name"  />
				
			<asp:TemplateField>
				<ItemTemplate>
					<asp:LinkButton id="btnEdit" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit" />
				
				
				</ItemTemplate>
				<EditItemTemplate>
					<asp:LinkButton id="btnUpdate" runat="server" CommandName="Update"  Text="Update" />
					<asp:LinkButton id="btnCancel" runat="server" CausesValidation="false" CommandName="Cancel"  Text="cancel" />
				</EditItemTemplate>
				
			</asp:TemplateField>

		</Fields>
			
		
	</asp:DetailsView>
</asp:Content>

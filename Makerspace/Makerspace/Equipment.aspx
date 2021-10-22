<%@ Page Title="Equipment Lookup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="Makerspace.Equipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>Equipment Lookup</h1>

    <div>
 
        <div class="container">
            <div class="row">
                <div class="col-4 input-group">
                    <asp:TextBox ID="searchBox" runat="server" CssClass="form-control rounded"></asp:TextBox>
                    <asp:Button ID="searchBtn" runat="server" CssClass="btn btn-secondary" OnClick="searchBtn_Click" Text="Search"/>
                </div>
 
                <div class="col-3">
                    <asp:DropDownList ID="CategoryDdl" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="CategoryDdl_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select category</asp:ListItem>
                        <asp:ListItem Value="1">Electronics</asp:ListItem>
                        <asp:ListItem Value="2">Mechanics</asp:ListItem>
                        <asp:ListItem Value="3">Printing</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-3 ml-auto">
                    <asp:button runat="server" type="button" CssClass="btn btn-primary float-right" Text="New equipment"></asp:button>
                </div>
            </div>
               
        </div>
        <div class="my-4">
            <asp:GridView ID="EquipGV" runat="server" AutoGenerateColumns="False" CssClass="table table-hover text-center">
                <Columns>
                    <asp:ButtonField ButtonType="Button" Text="Select"  ControlStyle-CssClass="btn btn-primary" />
                    <asp:BoundField  DataField="code" HeaderText="Code"/>
                    <asp:BoundField DataField="name" HeaderText="Name"/>
                    <asp:BoundField DataField="purpose" HeaderText="Usage" />
                    <asp:BoundField DataField="category_name" HeaderText="Category" />
                    <asp:BoundField DataField="room_space_name" HeaderText="Location" />
                    <asp:ButtonField ButtonType="Button" Text="Delete" ControlStyle-CssClass="btn btn-danger" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
   
</asp:Content>

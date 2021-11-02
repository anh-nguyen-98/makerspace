<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %> 
<%@ Page Title="Equipment Lookup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="Makerspace.Equipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Equipment Lookup</h1>
 
        <div class="container">
            <div class="row">
                <div class="col-4 input-group">
                    <asp:TextBox ID="searchBox" runat="server" CssClass="form-control rounded"></asp:TextBox>
                    <asp:Button ID="searchBtn" runat="server" CssClass="btn btn-secondary ml-1" OnClick="searchBtn_Click" Text="Search"/>
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
            <asp:GridView ID="EquipGV" runat="server" AutoGenerateColumns="False" CssClass="table table-hover text-center" OnRowCommand="EquipGV_RowCommand" DataKeyNames="code">
                <Columns>
                    <asp:BoundField DataField="code" HeaderText="Code"/>
                    <asp:BoundField DataField="name" HeaderText="Name"/>
                    <asp:BoundField DataField="purpose" HeaderText="Usage" />
                    <asp:BoundField DataField="category_name" HeaderText="Category" />
                    <asp:BoundField DataField="room_space_name" HeaderText="Location" />
                    <asp:ButtonField runat="server"  Text="Info" ControlStyle-CssClass="btn btn-primary" CommandName="ViewInfo"/>
                    <asp:ButtonField runat="server"  Text="Items" ControlStyle-CssClass="btn btn-primary" CommandName="ViewItems"/>
                    <asp:ButtonField ButtonType="Button" Text="Delete" ControlStyle-CssClass="btn btn-danger" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="PseudoBtn" runat="server" />    
            <ajaxToolkit:ModalPopupExtender ID="EquipmentModalPopup" runat="server" TargetControlID="PseudoBtn" PopupControlID="divPopUp"></ajaxToolkit:ModalPopupExtender>
            <div id="divPopUp" style="border-radius: 10px">
                <asp:FormView 
                    ID="EquipmentFormView" 
                    runat="server"
                    CssClass="bg-light rounded" Width="800px">
                     
                <ItemTemplate>
                    <h1 class="p-5"><%# Eval("name") %> 
                        <asp:Button runat="server" Text="Update" CssClass="btn btn-outline-primary ml-3"/>
                        <asp:Button runat="server" Text="Delete" CssClass="btn btn-outline-danger ml-2"/>
                    </h1>
                    <table >
 
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Code:</td>
                            <td class="px-5 py-2"><%#Eval("code") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Name:</td>
                            <td class="px-5 py-2"><%#Eval("name") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Description:</td>
                            <td class="px-5 py-2"><%#Eval("description") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Function:</td>
                            <td class="px-5 py-2"><%#Eval("purpose") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Instruction:</td>
                            <td class="px-5 py-2"><%#Eval("instruction") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Training Requirement:</td>
                            <td class="px-5 py-2"><%# Convert.ToInt32( Eval("training")).Equals(1) ? "Yes" : "No" %></td> 
                        </tr>
            
                    </table>
               

                </ItemTemplate> 
                    <FooterTemplate>
                    <div class="d-flex my-4 justify-content-around">

                        <asp:Button ID="CloseModalBtn" runat="server" Text="Close" OnClick="CloseModalBtn_Click" CssClass="btn btn-secondary "/>
                    </div>
                </FooterTemplate>
              </asp:FormView>
            </div>
            <ajaxToolkit:ModalPopupExtender ID="ItemsModalPopup" runat="server" TargetControlID="PseudoBtn" PopupControlID="ItemsPopUp"></ajaxToolkit:ModalPopupExtender>
            <div id="ItemsPopUp" style="border-radius: 10px">
                <asp:FormView 
                    ID="ItemsFormView" 
                    runat="server"
                    AllowPaging="true"
                    OnPageIndexChanging="ItemsFormView_PageIndexChanging"
                    CssClass="bg-light rounded" Width="800px">      
                  <ItemTemplate>
                    <h1 class="p-5"><%# Eval("name")%>  #<%# Eval("num") %> 
                        <asp:Button runat="server" Text="Update" CssClass="btn btn-outline-primary ml-3"/>
                        <asp:Button runat="server" Text="Delete" CssClass="btn btn-outline-danger ml-2"/>
                    </h1>
                    <table >
 
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Code:</td>
                            <td class="px-5 py-2"><%#Eval("item_code") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Name:</td>
                            <td class="px-5 py-2"><%#Eval("name") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Location:</td>
                            <td class="px-5 py-2"><%#Eval("location_id") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Status:</td>
                            <td class="px-5 py-2"><%#Eval("status").Equals(1) ? "Active" : "Inactive" %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Delivered at:</td>
                            <td class="px-5 py-2"><%#Eval("delivered_at") %></td>
                        </tr>
                        <tr>
                            <td class="font-weight-bold px-5 py-2">Removed at:</td>
                            <td class="px-5 py-2"><%# Eval("removed_at") %></td> 
                        </tr>
            
                    </table>
                    

                </ItemTemplate> 
                 <PagerStyle  Font-Size="X-Large" HorizontalAlign="Center" />
                <FooterTemplate>
                    <div class="d-flex my-4 justify-content-around">
                        <asp:Button ID="CloseItemsModalBtn" runat="server" Text="Close" OnClick="CloseItemsModalBtn_Click" CssClass="btn btn-secondary "/>
                    </div>
                </FooterTemplate>
              </asp:FormView>
            </div>
          
    </div>
   
</asp:Content>

<%@ Page Title="Equipment Lookup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="Makerspace.Equipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %> 
    <h1>Equipment Lookup</h1>
        <%-- startregion: Search Form --%>
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
                    <asp:button ID="AddNewEquipment" runat="server" type="button" CssClass="btn btn-primary float-right" Text="New equipment" OnClick="AddNewEquipment_Click"></asp:button>
                </div>
            </div>
               
        </div>
        <%-- endregion: Search Form --%>

        <div class="my-4">
            <%-- startregion: Equipment Gridview --%>
            <asp:GridView ID="EquipGV" runat="server" AutoGenerateColumns="False" CssClass="table table-hover text-center" OnRowCommand="EquipGV_RowCommand" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="code" HeaderText="Code"/>
                    <asp:BoundField DataField="name" HeaderText="Name"/>
                    <asp:BoundField DataField="purpose" HeaderText="Usage" />
                    <asp:BoundField DataField="category_name" HeaderText="Category" />
                    <asp:BoundField DataField="room_space_name" HeaderText="Location" />
                    <asp:ButtonField runat="server"  Text="Select" ControlStyle-CssClass="btn btn-primary" CommandName="Select"/>
                    <asp:ButtonField ButtonType="Button" Text="Delete" ControlStyle-CssClass="btn btn-danger" />
                </Columns>
            </asp:GridView>
            <%-- endregion: Equipment Gridview --%>

            <asp:Button ID="PseudoBtn" runat="server" CssClass="d-none" />
            
            <%-- startregion: PopUp (Equipment Formview + Equipment SubItems Formview) --%>
            <ajaxToolkit:ModalPopupExtender ID="EquipmentModalPopup" runat="server" TargetControlID="PseudoBtn" PopupControlID="divPopUp" ></ajaxToolkit:ModalPopupExtender>
            <div id="divPopUp" class="bg-light">
                <asp:Button ID="ClosePopupBtn" runat="server" CssClass="close border-0 mr-4 mt-3 rounded" Text="&times;" Width="50px" Height="50px" Font-Size="30px"  OnClick="ClosePopupModalBtn_Click"/>
                <%-- startregion: Equipment FormView --%>
                <asp:FormView 
                    ID="EquipmentFormView" 
                    runat="server"  DataKeyNames="equipment_id"
                    CssClass="my-2" Width="800px" OnModeChanging="EquipmentFormView_ModeChanging" OnItemCommand="EquipmentFormView_ItemCommand" 
                    OnItemInserting="EquipmentFormView_ItemInserting" OnItemInserted="EquipmentFormView_ItemInserted"
                    OnItemUpdating="EquipmentFormView_ItemUpdating" OnItemUpdated="EquipmentFormView_ItemUpdated"
                    OnItemDeleting="EquipmentFormView_ItemDeleting" OnItemDeleted="EquipmentFormView_ItemDeleted">
                    <ItemTemplate>
                        <h3 class="px-5 py-2"><%# Eval("name") %>
                            <asp:Button runat="server" Text="Edit" CssClass="btn btn-outline-primary ml-3" CommandName="Edit"/>
                            <asp:Button runat="server" Text="Delete" CssClass="btn btn-outline-danger ml-2" CommandName="Delete"/>
                            <asp:Button runat="server" Text="New Item" CssClass="btn btn-primary ml-2" CommandName="New Item"/>
                            
                            <%--<div class="close" aria-label="close"><span aria-hidden="true">&times;</span></div>--%>
                        </h3>
                        <table >
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Code</td>
                                <td class="px-5 py-2"><%#Eval("code") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Name</td>
                                <td class="px-5 py-2"><%#Eval("name") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Total</td>
                                <td class="px-5 py-2"><%= ItemsCount %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Description</td>
                                <td class="px-5 py-2"><%#Eval("description") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Function</td>
                                <td class="px-5 py-2"><%#Eval("purpose") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Instruction</td>
                                <%--<td class="px-5 py-2"><%#Eval("instruction") %></td>--%>
                                <td class="px-5 py-2"><asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="https://www.google.com.vn/?hl=vi">Guide to use <%#Eval("name") %></asp:HyperLink></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Training</td>
                                <td class="px-5 py-2"><%# Convert.ToInt32( Eval("training")).Equals(1) ? "Yes" : "No" %></td> 
                            </tr>           
                        </table>
                    </ItemTemplate> 
                    <InsertItemTemplate>
                        <table>
                            <tr>
                                <td><h3 class="px-5 py-2">Add Equipment</h3></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Code</td>
                                <td><asp:TextBox runat="server" ID="CodeTextBox" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Name</td>
                                <td><asp:TextBox runat="server" ID="NameTextBox"  CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Description</td>
                                <td><asp:TextBox runat="server" TextMode="MultiLine" ID="DescriptionTextBox"  CssClass="form-control"></asp:TextBox></td>

                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Function</td>
                                <td><asp:TextBox runat="server" TextMode="MultiLine" ID="FunctionTextbox"  CssClass="form-control"></asp:TextBox></td>
                            
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Instruction</td>
                                <td><asp:TextBox runat="server" ID="InstructionTextBox"  CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Training</td>
                                <td><asp:CheckBox runat="server" ID="TrainingCheckbox"/></td>
                            </tr>
                        </table>
                        <div class="d-flex justify-content-center mt-4">
                            <asp:Button runat="server" CssClass="btn btn-primary" CommandName="Insert" Text="Create"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button runat="server" CssClass="btn btn-secondary" CommandName="Cancel" Text="Cancel"/>
                        </div>
                    
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td><h3 class="px-5 py-2"><%# Eval("name") %> </h3></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Code</td>
                                <td><asp:TextBox runat="server" ID="eCodeUpdateTextBox" CssClass="form-control" Text='<%# Eval("code") %>' Enabled="false"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Name</td>
                                <td><asp:TextBox runat="server" ID="eNameUpdateTextBox"  CssClass="form-control" Text='<%# Bind("name") %>'></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td class="font-weight-bold px-5 py-2">Description</td>
                                <td><asp:TextBox runat="server" TextMode="MultiLine" ID="eDescUpdateTextBox"  CssClass="form-control" Text='<%# Bind("description") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Function</td>
                                <td><asp:TextBox runat="server" TextMode="MultiLine" ID="eFunctionUpdateTextBox"  CssClass="form-control" Text='<%# Bind("purpose") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Instruction</td>
                                <td><asp:TextBox runat="server" TextMode="MultiLine" ID="eInstructionUpdateTextBox"  CssClass="form-control" Text='<%# Bind("instruction") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Training</td>
                                <td><asp:CheckBox runat="server" ID="eTrainingUpdateCheckbox" Checked='<%# Convert.ToInt32( Eval("training")).Equals(1)%>'/></td>
                            </tr>
                        </table>
                        <div class="d-flex justify-content-center mt-4">
                            <asp:Button runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Update"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button runat="server" CssClass="btn btn-secondary" CommandName="Cancel" Text="Cancel"/>
                        </div>

                    </EditItemTemplate>

                </asp:FormView>
                <%-- endregion: Equipment FormView --%>

                <%-- startregion: Equipment SubItems FormView --%>
                <asp:FormView 
                    ID="ItemsFormView" 
                    runat="server" DataKeyNames="equipment_id"
                    CssClass="table table-borderless mb-0" Width="800px" AllowPaging="true"
                    OnPageIndexChanging="ItemsFormView_PageIndexChanging" OnModeChanging="ItemsFormView_ModeChanging" OnItemCommand="ItemsFormView_ItemCommand"
                    OnItemInserting="ItemsFormView_ItemInserting" OnItemInserted="ItemsFormView_ItemInserted"
                    OnItemUpdating="ItemsFormView_ItemUpdating" OnItemUpdated="ItemsFormView_ItemUpdated"
                    OnItemDeleting="ItemsFormView_ItemDeleting" OnItemDeleted="ItemsFormView_ItemDeleted">      
                    <ItemTemplate>
                        <h3 class="px-5 py-2"><%# Eval("name")%>  #<%# Eval("num") %> 
                            <asp:Button runat="server" Text="Edit" CssClass="btn btn-outline-primary ml-3" CommandName="Edit"/>
                            <asp:Button runat="server" Text="Delete" CssClass="btn btn-outline-danger ml-2" CommandName="Delete"/>
                     </div>
                        </h3>
                        <table>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Code</td>
                                <td class="px-5 py-2"><%#Eval("item_code") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Location</td>
                                <td class="px-5 py-2"><%#Eval("location_id") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Available</td>
                                <td class="px-5 py-2"><%#Eval("status").Equals(1) ? "Active" : "Inactive" %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Delivered at</td>
                                <td class="px-5 py-2"><%#Eval("delivered_at") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Removed at</td>
                                <td class="px-5 py-2"><%# Eval("removed_at") %></td> 
                            </tr>
                        </table>
                    </ItemTemplate>
                    <InsertItemTemplate>
                      <table>
                          <tr>
                              <td class="font-weight-bold px-5 py-2">Equipment Name</td>
                              <td class="px-5 py-2"><%= EquipGV.SelectedRow.Cells[1].Text.ToString() %></td>
                          </tr>
                          <tr>
                              <td class="font-weight-bold px-5 py-2">Equipment Code</td>
                              <td class="px-5 py-2"><%= EquipGV.SelectedRow.Cells[0].Text.ToString() %></td>
                          </tr>
                          <tr>
                              <td class="font-weight-bold px-5 py-2">Equipment Number</td>
                              <td class="px-5 py-2"><%= ItemsCount +1 %></td>
                          </tr>
                      
                          <tr>
                              <td class="font-weight-bold px-5 py-2">Location</td>
                              <td class="px-5 py-2"><asp:TextBox runat="server" ID="locIDTextBox" CssClass="form-control"></asp:TextBox></td>
                          </tr>
                          <tr>
                              <td class="font-weight-bold px-5 py-2">Delivery Date</td>
                              
                               <td class="px-5 py-2">
                                    <asp:UpdatePanel runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Calendar runat="server" ID="DeliveryDateCalendar" OnSelectionChanged="DeliveryDateCalendar_SelectionChanged"></asp:Calendar>
                                        </ContentTemplate>
                                    </asp:UpdatePanel></td>
                          </tr>
                          <tr>
                              <td class="font-weight-bold px-5 py-2">Availabe</td>
                              <td class="px-5 py-2"> <asp:CheckBox runat="server" ID="statusCheckBox" /> </td>
                          </tr>

                      </table> 
                         <div class="d-flex justify-content-center mt-4">
                            <asp:Button runat="server" CssClass="btn btn-primary" CommandName="Insert" Text="Add"/>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button runat="server" CssClass="btn btn-secondary" CommandName="Cancel" Text="Cancel"/>
                        </div>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <h3 class="px-5 py-2"><%# Eval("name")%>  #<%# Eval("num") %> </h3>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Code:</td>
                                <td class="px-5 py-2"><%#Eval("item_code") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Location</td>
                                <td class="px-5 py-2"><asp:TextBox runat="server" ID="locIDTextBoxEdit" CssClass="form-control"></asp:TextBox></td>
                            </tr>    
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Available</td>
                                <td class="px-5 py-2"> <asp:CheckBox runat="server" ID="statusCheckBoxEdit" /> </td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Delivery Date</td>
                                <td class="px-5 py-2">
                                    <asp:UpdatePanel runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Calendar runat="server" ID="DeliveryDateCalendarEdit" OnSelectionChanged="DeliveryDateCalendar_SelectionChanged"></asp:Calendar>
                                        </ContentTemplate>
                                    </asp:UpdatePanel></td>
                            </tr>
                        </table> 
                        <div class="d-flex justify-content-center mt-4">
                            <asp:Button runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Update"/>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button runat="server" CssClass="btn btn-secondary" CommandName="Cancel" Text="Cancel"/>
                        </div>
                    </EditItemTemplate>
                    <PagerStyle HorizontalAlign="Center" Font-Size="Larger"/>

                </asp:FormView>
                <%-- endregion: Equipment SubItems FormView --%>
            </div>
            <%-- endregion: PopUp--%>
        </div>
    
</asp:Content>

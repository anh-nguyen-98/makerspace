<%@ Page Title="Makerspace Equipment and Materials" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resource.aspx.cs" Inherits="Makerspace.Resource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %> 
    <h1>Makerspace Equipment and Materials</h1>
        <%-- startregion: Search Form --%>
        <div class="container">
            <div class="row">
                <div class="col-4 input-group">
                    <asp:TextBox ID="searchBox" runat="server" CssClass="form-control rounded"></asp:TextBox>
                    <asp:Button ID="searchBtn" runat="server" CssClass="btn btn-secondary ml-1" OnClick="searchBtn_Click" Text="Search"/>
                </div>
                <div class="col-3 ml-auto">
                    <asp:button ID="AddNewEquipment" runat="server" type="button" CssClass="btn btn-primary float-right" Text="New equipment" OnClick="AddNewEquipment_Click"></asp:button>
                </div>
               
        </div>
        </div>
        <%-- endregion: Search Form --%>

        <%--startregion: ListView Category--%>
        <label style="color:#00196E; font-size:20px; font-weight:600">Category </label>
        <asp:ListView ID="Category_ListView" runat="server" GroupItemCount="3" DataSourceID="Category_DataSource" DataKeyNames="name" OnSelectedIndexChanged="Category_ListView_SelectedIndexChanged">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server" colspan="4">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                
                <td runat="server">
                    <asp:LinkButton runat="server" CommandName="Select">
                        <table style="border-collapse:collapse">
                            <tr>
                                <td>
                                    <div style="background-color:#F1F3F6; border-radius:12px; height:92px; width:92px; position:relative">
                                        <img src="<%# Eval("src") %>" style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); height:40px"/>
                                    </div>
                                </td>
                                </tr>
                            <tr>
                                <td class="text-center">
                                    <asp:Label  style="color:#00196E; font-size:15px; font-weight:800" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                     </asp:LinkButton>   
                </td>       
            </ItemTemplate>
            <LayoutTemplate>
                <table style="width:100%">
                    <tbody>
                        <tr>
                            <td>
                                <table class="table table-borderless" id="groupPlaceholderContainer" runat="server" style="width:100%">
                                    <tr id="groupPlaceholder">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="Category_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" SelectCommand="SELECT [name] FROM [Category]"></asp:SqlDataSource>
        

        <div class="my-4">
            <%-- startregion: Equipment Listview --%>
            <asp:ListView runat="server"  ID="EquipLV" GroupItemCount="4">
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server" colspan="3"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server" >
                        <table class="rounded text-center" style="background-color: #F1F3F6; width:180px;">
                            <tr>
                                <td class="px-3 pt-3">
                                    <img class="rounded" src='Images/<%# Eval("image") %>' width="150" height="120"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="p-0">
                                    <asp:Label runat="server" Text='<%# Eval("name") %>' CssClass="text-blue-fuv font-weight-medium" Font-Size="18px"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" Text='<%# Eval("name_vie") %>' Font-Size="12px" ForeColor="#3A4276"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="background-color: #3A4276; font-size: 12px" class="rounded font-weight-bold text-white">
                                        <asp:Label runat="server" Text='<%# Eval("room_space_name") %>'></asp:Label>
                                    </div>
                                    <div class="text-blue-fuv font-weight-bold bg-white" style="font-size: 20px"><asp:Label runat="server" Text='<%# String.Concat (Eval("object_code").ToString().Trim(), Eval("object_num").ToString().Trim()) %>'></asp:Label></div>
                                </td>
                            </tr>
                            
                        </table>

                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table  style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table cellpadding="3" class="table table-borderless" id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                     
                </LayoutTemplate>
                
            </asp:ListView>
        </div>
        <div class="my-4">
            <%-- startregion: Equipment Gridview --%>
            <asp:GridView ID="EquipGV" Visible="false" runat="server" AutoGenerateColumns="False" CssClass="table table-hover text-center" OnRowCommand="EquipGV_RowCommand" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="code" HeaderText="Code"/>
                    <asp:BoundField DataField="name" HeaderText="Name"/>
                    <asp:BoundField DataField="purpose" HeaderText="Usage" />
                    <asp:BoundField DataField="category_name" HeaderText="Category" />
                    <asp:BoundField DataField="room_space_name" HeaderText="Location" />
                    <asp:ButtonField runat="server"  Text="Select" ControlStyle-CssClass="btn btn-primary" CommandName="Select"/>
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
                                <td class="font-weight-bold px-5 py-2">Code:</td>
                                <td class="px-5 py-2"><%#Eval("code") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Name:</td>
                                <td class="px-5 py-2"><%#Eval("name") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Total:</td>
                                <td class="px-5 py-2"><%= ItemsCount %></td>
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
                                <%--<td class="px-5 py-2"><%#Eval("instruction") %></td>--%>
                                <td class="px-5 py-2"><asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="https://www.google.com.vn/?hl=vi">Guide to use <%#Eval("name") %></asp:HyperLink></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Training:</td>
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
                    runat="server" DataKeyNames="item_id"
                    CssClass="table table-borderless mb-0" Width="800px" AllowPaging="true"
                    OnPageIndexChanging="ItemsFormView_PageIndexChanging" OnModeChanging="ItemsFormView_ModeChanging" OnItemCommand="ItemsFormView_ItemCommand"
                    OnItemInserting="ItemsFormView_ItemInserting" OnItemInserted="ItemsFormView_ItemInserted"
                    OnItemUpdating="ItemsFormView_ItemUpdating" OnItemUpdated="ItemsFormView_ItemUpdated"
                    OnItemDeleting="ItemsFormView_ItemDeleting" OnItemDeleted="ItemsFormView_ItemDeleted">      
                    <ItemTemplate>
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
                                   <asp:TextBox ID="DeliveryDateTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                   <ajaxToolkit:CalendarExtender runat="server" PopupButtonID="imgPopup" TargetControlID="DeliveryDateTextBox" Format="MM/dd/yyyy" />
                               </td>
                          </tr>
                          <tr>
                              <td class="font-weight-bold px-5 py-2">Removal Date</td>
                              
                               <td class="px-5 py-2">
                                   <asp:TextBox ID="RemovalDateTextbox" runat="server" CssClass="form-control"></asp:TextBox>
                                   <ajaxToolkit:CalendarExtender runat="server" PopupButtonID="imgPopup" TargetControlID="RemovalDateTextbox" Format="MM/dd/yyyy" />
                               </td>
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
                            <h3 class="px-5 py-2"><%# Eval("name")%>  #<%# Eval("num") %></h3>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Code:</td>
                                <td class="px-5 py-2"><%#Eval("item_code") %></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Location</td>
                                <td class="px-5 py-2"><asp:TextBox runat="server" ID="locIDTextBoxEdit" CssClass="form-control" Text='<%# Bind("location_id") %>'></asp:TextBox></td>
                            </tr>    
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Available</td>
                                <td class="px-5 py-2"> <asp:CheckBox runat="server" ID="statusCheckBoxEdit" Checked='<%# Eval("status").Equals(1) %>'/></td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Delivery Date</td>
                                <td class="px-5 py-2">
                                   <asp:TextBox ID="DeliveryDateTextBoxEdit" runat="server" CssClass="form-control" Text='<%#Bind("delivered_at") %>'></asp:TextBox>
                                   <ajaxToolkit:CalendarExtender runat="server" PopupButtonID="imgPopup" TargetControlID="DeliveryDateTextBoxEdit" Format="MM/dd/yyyy" />

                                </td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold px-5 py-2">Removal Date</td>
                                <td class="px-5 py-2">
                                   <asp:TextBox ID="RemovalDateTextBoxEdit" runat="server" CssClass="form-control" Text='<%#Bind("removed_at") %>'></asp:TextBox>
                                   <ajaxToolkit:CalendarExtender runat="server" PopupButtonID="imgPopup" TargetControlID="RemovalDateTextBoxEdit" Format="MM/dd/yyyy" />
                                </td>
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

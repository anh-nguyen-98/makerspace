<%@ Page Title="Equipment Lookup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resource.aspx.cs" Inherits="Makerspace.Resource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %> 
    <h1 class="text-center" style="font-size:70px"; font-weight:900> <span style="color:#00196E">Makerspace</span> <span style="color:#FFAD1D"> Equipment</span></h1>
    <br />
    <br />
        <%-- startregion: Search Form --%>
        <div class="container">
            <div class="row">
                <div class="col-4 input-group" style="display: block; margin-left:auto; margin-right:auto">
                    <asp:TextBox ID="searchBox" runat="server" CssClass="form-control rounded" style="width:739px; height:44px"></asp:TextBox>
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
        <asp:ListView ID="Category_ListView" runat="server" GroupItemCount="3" DataSourceID="Category_DataSource">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server" colspan="4">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server">
                    <table style="border-collapse:collapse">
                        <tr>
                            <td>
                               <div style="background-color:#F1F3F6; border-radius:12px; height:92px; width:92px; position:relative">
                                        <img src="Images/popular.png" style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); height:40px"/>
                                </div>
                                <div>
                                    <%--<svg width="93" height="91" viewBox="0 0 93 91" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="92.0498" height="90.964" rx="12" fill="#F1F3F6"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M36.25 31C35.0234 31 33.847 31.5268 32.9796 32.4645C32.1123 33.4021 31.625 34.6739 31.625 36V56C31.625 57.3261 32.1123 58.5979 32.9796 59.5355C33.847 60.4732 35.0234 61 36.25 61H54.75C55.9766 61 57.153 60.4732 58.0204 59.5355C58.8877 58.5979 59.375 57.3261 59.375 56V36C59.375 34.6739 58.8877 33.4021 58.0204 32.4645C57.153 31.5268 55.9766 31 54.75 31H36.25ZM42.4167 39.3333C42.4167 38.8913 42.5791 38.4674 42.8682 38.1548C43.1573 37.8423 43.5495 37.6667 43.9583 37.6667H53.2083C53.6172 37.6667 54.0093 37.8423 54.2985 38.1548C54.5876 38.4674 54.75 38.8913 54.75 39.3333C54.75 39.7754 54.5876 40.1993 54.2985 40.5118C54.0093 40.8244 53.6172 41 53.2083 41H43.9583C43.5495 41 43.1573 40.8244 42.8682 40.5118C42.5791 40.1993 42.4167 39.7754 42.4167 39.3333ZM42.4167 46C42.4167 45.558 42.5791 45.134 42.8682 44.8215C43.1573 44.5089 43.5495 44.3333 43.9583 44.3333H53.2083C53.6172 44.3333 54.0093 44.5089 54.2985 44.8215C54.5876 45.134 54.75 45.558 54.75 46C54.75 46.442 54.5876 46.8659 54.2985 47.1785C54.0093 47.4911 53.6172 47.6667 53.2083 47.6667H43.9583C43.5495 47.6667 43.1573 47.4911 42.8682 47.1785C42.5791 46.8659 42.4167 46.442 42.4167 46ZM42.4167 52.6667C42.4167 52.2246 42.5791 51.8007 42.8682 51.4882C43.1573 51.1756 43.5495 51 43.9583 51H53.2083C53.6172 51 54.0093 51.1756 54.2985 51.4882C54.5876 51.8007 54.75 52.2246 54.75 52.6667C54.75 53.1087 54.5876 53.5326 54.2985 53.8452C54.0093 54.1577 53.6172 54.3333 53.2083 54.3333H43.9583C43.5495 54.3333 43.1573 54.1577 42.8682 53.8452C42.5791 53.5326 42.4167 53.1087 42.4167 52.6667ZM37.7917 37.6667C37.3828 37.6667 36.9907 37.8423 36.7015 38.1548C36.4124 38.4674 36.25 38.8913 36.25 39.3333C36.25 39.7754 36.4124 40.1993 36.7015 40.5118C36.9907 40.8244 37.3828 41 37.7917 41H37.7932C38.2021 41 38.5942 40.8244 38.8833 40.5118C39.1725 40.1993 39.3349 39.7754 39.3349 39.3333C39.3349 38.8913 39.1725 38.4674 38.8833 38.1548C38.5942 37.8423 38.2021 37.6667 37.7932 37.6667H37.7917ZM36.25 46C36.25 45.558 36.4124 45.134 36.7015 44.8215C36.9907 44.5089 37.3828 44.3333 37.7917 44.3333H37.7932C38.2021 44.3333 38.5942 44.5089 38.8833 44.8215C39.1725 45.134 39.3349 45.558 39.3349 46C39.3349 46.442 39.1725 46.8659 38.8833 47.1785C38.5942 47.4911 38.2021 47.6667 37.7932 47.6667H37.7917C37.3828 47.6667 36.9907 47.4911 36.7015 47.1785C36.4124 46.8659 36.25 46.442 36.25 46ZM37.7917 51C37.3828 51 36.9907 51.1756 36.7015 51.4882C36.4124 51.8007 36.25 52.2246 36.25 52.6667C36.25 53.1087 36.4124 53.5326 36.7015 53.8452C36.9907 54.1577 37.3828 54.3333 37.7917 54.3333H37.7932C38.2021 54.3333 38.5942 54.1577 38.8833 53.8452C39.1725 53.5326 39.3349 53.1087 39.3349 52.6667C39.3349 52.2246 39.1725 51.8007 38.8833 51.4882C38.5942 51.1756 38.2021 51 37.7932 51H37.7917Z" fill="#FFAD1D"/>
</svg>--%>

                                </div>
                            </td>
                         </tr>
                        <tr>
                            <td class="text-center">
                                <asp:Label  style="color:#00196E; font-size:15px; font-weight:800" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
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
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="my-4">
            <%-- startregion: Equipment Gridview --%>
            <asp:GridView ID="EquipGV" runat="server" AutoGenerateColumns="False" CssClass="table table-hover text-center" OnRowCommand="EquipGV_RowCommand" DataKeyNames="id" OnRowDeleting="EquipGV_RowDeleting" OnRowDeleted="EquipGV_RowDeleted">
                <Columns>
                    <asp:BoundField DataField="code" HeaderText="Code"/>
                    <asp:BoundField DataField="name" HeaderText="Name"/>
                    <asp:BoundField DataField="purpose" HeaderText="Usage" />
                    <asp:BoundField DataField="category_name" HeaderText="Category" />
                    <asp:BoundField DataField="room_space_name" HeaderText="Location" />
                    <asp:ButtonField runat="server"  Text="Select" ControlStyle-CssClass="btn btn-primary" CommandName="Select"/>
                    <asp:ButtonField ButtonType="Button" Text="Delete" ControlStyle-CssClass="btn btn-danger" CommandName="Delete"/>
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
                        <h3 class="px-5 py-2"><%# Eval("name")%>  #<%# Eval("num") %><asp:Button runat="server" Text="Edit" CssClass="btn btn-outline-primary ml-3" CommandName="Edit"/>
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

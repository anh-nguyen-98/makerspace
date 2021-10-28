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
               
                    </Columns>
                </asp:GridView>
            </div>


                </asp:Panel>
            </div>


            <div>
                <asp:FormView 
                    ID="EquipFormView" 
                    DataKeyNames="eID"
                    runat="server"

                    OnModeChanging="EquipFormView_ModeChanging"
                    OnItemUpdating="EquipFormView_ItemUpdating"
                    OnItemUpdated="EquipFormView_ItemUpdated"
                    OnModeChanging="EquipFormView_ModeChanging"
                    OnItemDeleting="EquipFormView_ItemDeleting"
                    OnItemDeleted="EquipFormView_ItemDeleted">
   
                    >
                    <ItemTemplate>
                        <h3><%# Eval("eName") %></h3>
                        <asp:Label runat="server" ID="eID" ></asp:Label>
                        <table>
                            <tr>
                                <td>ID</td>
                                <td><%#Eval("eID") %></td>
                            </tr>
                            <tr>
                                <td>Code</td>
                                <td><%#Eval("eCode") %></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><%#Eval("eName") %></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td><%#Eval("eDesc") %></td>
                            </tr>
                            <tr>
                                <td>Function</td>
                                <td><%#Eval("eFunction") %></td>
                            </tr>
                            <tr>
                                <td>Manual</td>
                                <td><%#Eval("eManual") %></td>
                            </tr>
                            <tr>
                                <td>Safety Caution</td>
                                <td><%#Eval("eSafety") %></td>
                            </tr>
                            <tr>
                                <td>Training Requirement</td>
                       
                                <td><asp:CheckBox 
                                    runat="server" 
                                    AutoPostBack="True"
                                    Enabled="false"
                                    Checked='<%# Convert.ToInt32( Eval("eTraining")).Equals(1) %>'
                                    />
                               
                                </td>
                  
                            </tr>
                            <tr>
                                <td><asp:LinkButton ID="EditBtn" runat="server" Text="Edit" CommandName="Edit"/></td>
                                <td><asp:LinkButton ID="Delete" runat="server" Text="Delete" CommandName="Delete" /></td>
                    
                            </tr>
                        </table>
                    </ItemTemplate> 
                    <EditItemTemplate>
                        <h3><%# Eval("eName") %></h3>
                        <asp:Label runat="server" ID="eIDD" ></asp:Label>
                        <table>
                            <tr>
                                <td>ID</td>
                                <td><asp:Label ID="eIDLabel" runat="server" Text='<%#Eval("eID")%>'></asp:Label> </td>
                            </tr>
                            <tr>
                                <td>Code</td> 
                                <td><asp:TextBox ID="eCodeUpdateTextBox" runat="server" Text='<%#Bind("eCode") %>'></asp:TextBox> </td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><asp:TextBox ID="eNameUpdateTextBox" runat="server" Text='<%#Bind("eName") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td><asp:TextBox ID="eDescUpdateTextBox" runat="server" Text='<%#Bind("eDesc") %>'></asp:TextBox> </td>
                            </tr>
                            <tr>
                                <td>Function</td>
                                <td><asp:TextBox ID="eFunctionUpdateTextBox" runat="server" Text='<%#Bind("eFunction") %>'></asp:TextBox> </td>
                            </tr>
                            <tr>
                                <td>Manual</td>
                                <td><asp:TextBox ID="eManualUpdateTextBox" runat="server" Text='<%#Bind("eManual") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Safety Caution</td>
                                <td><asp:TextBox ID="eSafetyUpdateTextBox" runat="server" Text='<%#Bind("eSafety") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Training Requirement</td>
          
                                <td>
                                    <asp:CheckBox 
                                        ID="eTrainingCheckBox"
                                        runat="server"
                                         AutoPostBack="true"
                                         Enabled="true"
                                         Checked='<%# Convert.ToInt32(Eval("eTraining")).Equals(1) %>'/>
                                </td>
                               
                            </tr>
                            <tr>
                                <td><asp:LinkButton ID="UpdateBtn" runat="server" Text="Update" CommandName="Update"  /></td>
                                <td><asp:LinkButton ID="CancelBtn" runat="server" Text="Cancel" CommandName="Cancel" /></td>
                  
                    
                            </tr>
                        </table>

                    </EditItemTemplate>
       

                </asp:FormView>
            
            <div>
                <asp:Panel runat="server" ID="ItemGridPanel">
                    <div >
                        <asp:Label runat="server">Total: </asp:Label>
                        <asp:Label runat="server" ID="ItemCount"></asp:Label>
                    </div>

                    <div>
                        <asp:GridView 
                        runat="server"
                        ID="ItemGV"
                        AllowPaging="false" 
                        AutoGenerateColumns="false"
                        DataKeyNames="itemID" 
                        AutoGenerateSelectButton="true"
                        OnSelectedIndexChanged="ItemGV_SelectedIndexChanged"
                        OnRowDeleting="ItemGV_RowDeleting"
                        OnRowDeleted="ItemGV_RowDeleted"
                        ShowFooter="true">
                        <Columns>

                            <asp:BoundField HeaderText="ID" DataField="itemID"/>
                            <asp:BoundField HeaderText="Equipment ID" DataField="eID" />
                            <asp:BoundField HeaderText="Code" DataField="itemCode"/>
                            <asp:BoundField HeaderText="Status" DataField="itemStatus" />
                            <asp:BoundField HeaderText="Location" DataField="locID"/>
                            <asp:BoundField HeaderText="Delivery Date" DataField="itemDeliveryDate"/>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                   
                            <asp:TemplateField HeaderText="Removal Date">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RemovalDateLbl" Text='<%# Eval("itemRemovalDate")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns> 
               
                    </asp:GridView>
                    </div>
                </asp:Panel>
            </div>

            </asp:FormView>


            <asp:label id="MessageLabel" forecolor="Red" runat="server"/>
            <asp:Button ID="AddItemBtn_Click" runat="server" OnClick="AddItemBtn_Click" Text="New Equipment"/>
            <asp:FormView 
                runat="server" 
                ID="AddItemFV"
                DataKeyNames="itemID"
                OnItemInserting="AddItemFV_ItemInserting"
                OnItemInserted="AddItemFV_ItemInserted">
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <h1>Add Equipment Item</h1>
                            </td>
                        </tr>
                
                        
                        <tr>
                            <td>Equipment ID</td>
                            <td>
                                <asp:TextBox runat="server" ID="eIDTextBox" TextMode="Number" Text='<%# Eval(EquipFormView.DataKey.Value.ToString()) %>'
                                    ></asp:TextBox>
                            </td>
                        </tr>
                    

                        <tr>
                            <td>Status</td>
                            <td><asp:TextBox runat="server" ID="itemStatusTextBox" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Location</td>
                            <td><asp:TextBox runat="server" ID="locIDTextBox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Delivery Date</td>
                            
                             <asp:UpdatePanel runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Calendar runat="server" ID="DeliveryDateCalendar"></asp:Calendar>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                        </tr>
                        <tr>
                            <td>Removal Date</td>
                            
                            <asp:UpdatePanel runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Calendar runat="server" ID="RemovalDateCalendar"></asp:Calendar>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton runat="server" CommandName="Insert" Text="Submit"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                   
                </InsertItemTemplate>
                <div>
                <ItemTemplate>
                    <table>
                
                        <tr>
                            <td>ID</td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("itemID")%>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Equipment ID</td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("eID") %>' ID="eIDLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Code</td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("itemCode") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td><asp:Label runat="server" Text='<%# Eval("itemStatus") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Location</td>
                            <td><asp:Label runat="server" Text='<%# Eval("locID") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Delivery Date</td>
                            <td><asp:Label runat="server" Text='<%# Eval("itemDeliveryDate") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Removal Date</td>
                            <td><asp:Label runat="server" Text='<%# Eval("itemRemovalDate") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            
                        </tr>
                    </table>
                </ItemTemplate>
        </asp:FormView>
            </div>
            

        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>

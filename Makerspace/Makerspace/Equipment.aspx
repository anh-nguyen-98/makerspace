﻿<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="Makerspace.Equipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
       <h1>Makerspace Equipment</h1>
   </div>
    <div id="CategoryMenu" style="text-align:center">

        <asp:ListView ID="categoryList" runat="server" DataSourceID="MakerspaceDB" OnItemCommand="CategoryList_Search">
            <ItemTemplate>
                    <b style="font-size: large; font-style: normal">
                        <asp:Button  ID="cat_btn" runat="server" Text='<%# Eval("catName")%>' CommandName='<%# Eval("catName")%>' OnClick="CatBtn_Click">   
                        </asp:Button> 
                    </b>
                </ItemTemplate>
                <ItemSeparatorTemplate>  |  </ItemSeparatorTemplate>
        </asp:ListView>

        <asp:Button ID="AddEquipBtn" runat="server" Text="Add Equipment" OnClick="AddEquipBtn_Click" />

        <asp:SqlDataSource ID="MakerspaceDB" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" SelectCommand="SELECT [catName] FROM [EquipmentCategory]">
        </asp:SqlDataSource>


        <br />
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="EquipmentSearch" Text="Equipment Name" AutoPostBack="True" />
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="EquipmentSearch" Text="Equipment Function" />
        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="EquipmentSearch" Text="Equipment Location" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Search_Click" Text="Search" style="width: 67px" />
        <asp:GridView ID="GridView1" runat="server"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            AutoGenerateDeleteButton ="True"
            OnRowDeleting ="GridView1_RowDeleting"
            DataKeyNames ="eID"
            AllowPaging = "true"
            OnPageIndexChanging="GridView1_PageIndexChanging"
      
            >
   
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

        &nbsp;&nbsp;&nbsp;

        <div>

        <asp:FormView ID="FormView1" 
            runat="server" 
            Visible="false"
            style="margin-right: 0px"
            defaultmode="Insert"
            OnModeChanging="FormView1_ModeChanging"
            OnItemInserting="FormView1_ItemInserting"
            OnItemInserted="FormView1_ItemInserted"
            OnPageIndexChanging="FormView1_PageIndexChanging" >
            <InsertItemTemplate>
                <h2>Add new equipment</h2>
                <table class="nav-justified">
                    <tr>
                        <td style="width: 313px">Equipment code</td>
                        <td class="text-left">
                            <asp:TextBox ID="eCode" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 313px">Equipment name</td>
                        <td class="text-left">
                            <asp:TextBox ID="eName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 313px">Description</td>
                        <td class="text-left">
                            <asp:TextBox ID="eDesc" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 313px">Function</td>
                        <td class="text-left">
                            <asp:TextBox ID="eFunction" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 313px">Manual</td>
                        <td class="text-left">
                            <asp:TextBox ID="eManual" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 313px">Safety</td>
                        <td class="text-left">
                            <asp:TextBox ID="eSafety" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 313px">Training</td>
                        <td class="text-left">
                            <asp:CheckBox ID="Training" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="InsertBtn" runat="server" Text="Insert" CommandName="Insert"/>
                            <br />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                <h3>New added equipment</h3>
                <table class="nav-justified">
                    <tr>
                        <td style="width: 135px">Equipment code</td>
                        <td><%#Eval("eCode")%></td>
                    </tr>
                    <tr>
                        <td style="width: 135px">Equipment name</td>
                        <td><%#Eval("eName") %></td>
                    </tr>
                    <tr>
                        <td style="width: 135px">Description</td>
                        <td><%#Eval("eDesc") %></td>
                    </tr>
                    <tr>
                        <td style="width: 135px">Function</td>
                        <td><%#Eval("eFunction") %></td>
                    </tr>
                    <tr>
                        <td style="width: 135px">Manual</td>
                        <td><%#Eval("eManual") %></td>
                    </tr>
                    <tr>
                        <td style="width: 135px">Safety</td>
                        <td><%#Eval("eSafety") %></td>
                    </tr>
                    <tr>
                        <td style="width: 135px">Training</td>
                        <td><%# Convert.ToInt32(Eval("eTraining")).Equals(1) ? "Yes": "No" %></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>



        </div>



        <br />


        <br />

    </div>

</asp:Content>

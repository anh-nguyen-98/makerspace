﻿<%@ Page Title="User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Makerspace.GetUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>USERS</h1>
    </div>
    <div>
        
        <h5>
            User ID: 
            <asp:TextBox runat="server" ID="UserID" Width="100px" TextMode="Number"></asp:TextBox>
            <asp:Button runat="server" Text="Search" OnClick="SearchBtnClick"/>
            <asp:DropDownList 
                ID="RoleList" 
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged ="RoleList_SelectedIndexChanged">
            </asp:DropDownList>
            
            Department: 
            <asp:DropDownList 
                ID="DeptList" 
                runat="server"></asp:DropDownList>
       
        </h5>
            
            
       
        <asp:Panel ID="Output" runat="server" >
            <h5>Total: 
            <asp:Label runat="server" ID="count">0</asp:Label>
            </h5>
            <asp:GridView runat="server" ID="UserGV" HorizontalAlign="Center"
                 AutoGenerateColumns="False"
                 AutoGenerateEditButton="True"
                 AutoGenerateSelectButton="True"
                 AutoGenerateDeleteButton="True"
                 ShowFooter="True"
                 OnSelectedIndexChanged="UserGV_SelectedIndexChanged"
                 DataKeyNames="userID"
                 >
                <Columns>
        
                    <asp:BoundField HeaderText="ID" DataField="userID" />
                    <asp:BoundField HeaderText="Code" DataField="userCode" />
                    <asp:BoundField HeaderText="Email" DataField="userEmail"/>
                    <asp:BoundField HeaderText="Last Name" DataField="userLastName"/>
                    <asp:BoundField HeaderText="Middle Name" DataField="userMiddleName"/>
                    <asp:BoundField HeaderText="FirstName" DataField="userFirstName"/>
                    <asp:BoundField HeaderText="Phone" DataField="userPhone"/>
                    <asp:BoundField HeaderText="Department" DataField="userDept"/>
                    <asp:BoundField HeaderText="Job" DataField="userJob"/>
         
                    <asp:TemplateField HeaderText="DOB">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="DOBLbl" Text='<%# Eval("userDOB") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton runat="server" ID="AddBtn" Text="Add" OnClick="AddBtn_Click"></asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
  

        </asp:Panel>
        <div>
            <asp:FormView 
                runat="server"
                ID="UserFV"
                 DataKeyNames="userID"
                 OnModeChanging="UserFV_ModeChanging"
                 OnItemInserting="UserFV_ItemInserting">
                <ItemTemplate>
                    <table>
<%--                        <tr>
                            <h1><%# String.Concat(Eval("userLastName"), Eval("userMiddleName"), Eval("userFirstName")) %></h1>
                        </tr>--%>
                        <tr>
                            <td>
                                ID
                            </td>
                            <td>
                                <%# Eval("userID") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Code
                            </td>
                            <td>
                                <%# Eval("userCode") %>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <%# Eval("userEmail") %>
                            </td>
                        </tr>

                        <tr>
                            <td>Last Name</td>
                            <td>
                                <%# Eval("userLastName") %>
                            </td>
                        </tr>
                        <tr>
                            <td>Middle Name</td>
                            <td>
                                <%# Eval("userMiddleName") %>
                            </td>
                        </tr>
                        <tr>
                            <td>First Name</td>
                            <td>
                                <%# Eval("userFirstName") %>
                            </td>
                        </tr>
                        <tr>
                            <td>Phone </td>
                            <td>
                                <%# Eval("userPhone") %>
                            </td>
                        </tr>
                        <tr>
                            <td>Department</td>
                            <td>
                                <%# Eval("userDept") %>
                            </td>
                        </tr>
                        <tr>
                            <td>Job Title</td>
                            <td>
                                <%# Eval("userJob") %>
                            </td>
                        </tr>
                        <tr>
                            <td>DOB</td>
                            <td>
                                <%# Eval("userDOB") %>
                            </td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td><%# Eval("roleName") %></td>
                        </tr>
                        <tr>
                            <td><asp:LinkButton runat="server" Text="Add" CommandName="New"></asp:LinkButton></td>
                        </tr>
                    </table>
                </ItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <h1>New User</h1>
                                
                            </td>

                        <tr>
                            <td>
                                Code
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="CodeTextBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <asp:TextBox runat="server" ID="EmailTextBox"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td>
                             <asp:TextBox runat="server" ID="LastNameTextBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Middle Name</td>
                            <td>
                                <asp:TextBox runat="server" ID="MiddleNameTextBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>First Name</td>
                            <td><asp:TextBox runat="server" ID="FirstNameTextBox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Phone </td>
                            <td><asp:TextBox runat="server" ID="PhoneTextBox" TextMode="Phone"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Department</td>
                            <td><asp:TextBox runat="server" ID="DeptTextBox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Job Title</td>
                            <td><asp:TextBox runat="server" ID="JobTextBox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>DOB</td>
                            <td><asp:Calendar runat="server" ID="DOBCalendar"></asp:Calendar></td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td><asp:TextBox runat="server" ID="RoleTextbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:LinkButton runat="server" CommandName="Insert" Text="Submit"></asp:LinkButton></td>
                            <td><asp:LinkButton runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton></td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
        </div>
        
    </div>
</asp:Content>
   
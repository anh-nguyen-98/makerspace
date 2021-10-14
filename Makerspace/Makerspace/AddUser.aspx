﻿<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Makerspace.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>
            Add User
        </h1>
    </div>
    <asp:Panel ID="AddUserForm" runat="server" >
        <asp:Label runat="server" Text="First Name: "></asp:Label>
        <asp:TextBox runat="server" ID="FirstName" Placeholder="first name"></asp:TextBox>
        <br />
        <asp:Label runat="server">Last Name: </asp:Label>
        <asp:TextBox runat="server" ID="LastName"></asp:TextBox>
        <br />
        <asp:Label runat="server">Middle Name: </asp:Label>
        <asp:TextBox runat="server" ID="MiddleName"></asp:TextBox>
        <br />
        <asp:Label runat="server">Code: </asp:Label>
        <asp:TextBox runat="server" ID="Code" TextMode="Number"></asp:TextBox>
        <br />
        
        <asp:Label runat="server">Email: </asp:Label>
        <asp:TextBox runat="server" ID="Email" TextMode="Email"></asp:TextBox>
        <br />
        <asp:Label runat="server">Phone: </asp:Label>
        <asp:TextBox runat="server" ID="Phone" TextMode="Phone"></asp:TextBox>
        <br />
        <asp:Label runat="server">Department: </asp:Label>
        <asp:TextBox runat="server" ID="Dept"></asp:TextBox>
        <br />
        <asp:Label runat="server">Job Title: </asp:Label>
        <asp:TextBox runat="server" ID="Job"></asp:TextBox>
        <br />
        <asp:UpdatePanel runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label runat="server">DOB: </asp:Label>
                <asp:Calendar ID="DOB" runat="server"></asp:Calendar>
            </ContentTemplate>
            
        </asp:UpdatePanel>
      
     
        <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click"/>
        
        <br />
        
    </asp:Panel>

  
</asp:Content>

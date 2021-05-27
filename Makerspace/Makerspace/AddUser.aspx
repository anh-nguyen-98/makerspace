<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Makerspace.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>
            Add User
        </h1>
    </div>
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label runat="server" Text="First Name: "></asp:Label>
        <asp:TextBox runat="server" ID="FirstNameTxt"></asp:TextBox>

        <br />
        <asp:Label runat="server">Last Name: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
        <br />
        <asp:Label runat="server">Middle Name: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox2"></asp:TextBox>
        <br />
        <asp:Label runat="server">Code: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox3"></asp:TextBox>
        <br />
        
        <asp:Label runat="server">Email: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox4"></asp:TextBox>
        <br />
        <asp:Label runat="server">Phone: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox5"></asp:TextBox>
        <br />
        <asp:Label runat="server">Department: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox6"></asp:TextBox>
        <br />
        <asp:Label runat="server">Job Title: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox7"></asp:TextBox>
        <br />
        <asp:Label runat="server">DOB: </asp:Label>
        <asp:TextBox runat="server" ID="TextBox8"></asp:TextBox>
        <br />
        
    </asp:Panel>

  
</asp:Content>

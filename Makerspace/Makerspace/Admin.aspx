<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Makerspace.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
       <h1>Your Admin Page</h1>
   </div>
    <div>

        <asp:TreeView ID="TreeView1" runat="server" Font-Size="Large" Height="305px" Width="388px">
            <Nodes>
                <asp:TreeNode Text="Equipment" Value="Object">
                    <asp:TreeNode Text="Add" Value="Add" NavigateUrl="~/AddEquipment"></asp:TreeNode>
                    
                    <asp:TreeNode Text="Edit" Value="Edit" NavigateUrl="~/EditEquipment"></asp:TreeNode>
                    <asp:TreeNode Text="Delete" Value="Delete" NavigateUrl="~/DeleteEquipment"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode runat="server" Text="Equipment Item">
                    <asp:TreeNode Text="Add" Value="Add" NavigateUrl="~/AddEquipmentItem"></asp:TreeNode>
                    <asp:TreeNode Text="Edit" Value="Edit" NavigateUrl="~/EditEquipmentItem"></asp:TreeNode>
                    <asp:TreeNode Text="Delete" Value="Delete" NavigateUrl="~/DeleteEquipmentItem"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="User" Value="New Node">
                    <asp:TreeNode Text="Add" Value="Add" NavigateUrl="~/AddUser"></asp:TreeNode>
                    <asp:TreeNode Text="Edit" Value="Edit" NavigateUrl="~/EditUser"></asp:TreeNode>
                    <asp:TreeNode Text="Delete" Value="Delete" NavigateUrl="~/DeleteUser"></asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
        </asp:TreeView>

    </div>
</asp:Content>

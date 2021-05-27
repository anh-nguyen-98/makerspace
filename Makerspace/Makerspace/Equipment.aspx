<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="Makerspace.Equipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
       <h1>Makerspace Equipment</h1>
   </div>
    <div id="CategoryMenu" style="text-align:center">

        <asp:ListView ID="categoryList" runat="server" DataSourceID="MakerspaceDB">
            <ItemTemplate>
                    <b style="font-size: large; font-style: normal">
                        <asp:Button  ID="cat_btn" runat="server" Text='<%# Eval("catName")%>'>   
                        </asp:Button> 
                    </b>
                </ItemTemplate>
                <ItemSeparatorTemplate>  |  </ItemSeparatorTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="MakerspaceDB" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" SelectCommand="SELECT [catName] FROM [EquipmentCategory]"></asp:SqlDataSource>

        <br />
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="EquipmentSearch" Text="Equipment Name" />
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="EquipmentSearch" OnCheckedChanged="RadioButton2_CheckedChanged" Text="Equipment Function" />
        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="EquipmentSearch" Text="Equipment Location" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

        <br />
        <br />

    </div>
    
</asp:Content>

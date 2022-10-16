<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindItemsByLocation_QR.aspx.cs" Inherits="Makerspace.FindItemsByLocation_QR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="Code" SortExpression="code" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="image" HeaderText="Image" SortExpression="image" Visible="False" />
                        <asp:BoundField DataField="object_name" HeaderText="Object name" SortExpression="object_name" />
                        <asp:BoundField DataField="object_num" HeaderText="Object number" SortExpression="object_num" />
                        <asp:ImageField DataImageUrlField="image" DataImageUrlFormatString="~/Images/{0}" ControlStyle-Height="100">
<ControlStyle Height="100px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                </asp:GridView>

            </div>
    
        
     </div>
</asp:Content>

<%@ Page Title="Makerspace Equipment and Materials" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResourceDetail.aspx.cs" Inherits="Makerspace.ResourceDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mb-4">
        <%-- startregion: Equipment Listview --%>
        <asp:ListView runat="server"  ID="ResourceDetail_Listview" GroupItemCount="2">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" >
                    <table class="rounded" style="background-color: #F1F3F6; width:400px">
        
                        <tr >
                            <td rowspan="2" style="width:104px">
                                <div style="background-color:#F1F3F6;">
                                        <img src="Images/A18-030.jpg"/ height="82px" width="82px">
                                </div>
                            </td>
                            <td>
                                <asp:Label runat="server" Text='<%# Eval("name") %>' class="text-blue-fuv"></asp:Label>
                          
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="rounded text-blue-fuv">
                                    <asp:Label runat="server" Text='<%# Eval("room_space_name") %>'></asp:Label>
                                </div>

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
        <%-- endregion: Equipment Listview --%>
    </div>
    
</asp:Content>

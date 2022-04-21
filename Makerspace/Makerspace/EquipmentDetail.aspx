<%@ Page Title="Equipment Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentDetail.aspx.cs" Inherits="Makerspace.EquipmentDetail" %>
<asp:Content ID="EDetail" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
        <div class="one">
            <div>          
                <img src="Images\A18-030.jpg" width="260" height="260" style="vertical-align:baseline">
            <br />
            <div style="display: flex; justify-content:center">
                 <asp:Label id="name" style="background-color: #00196E; color: white; font-size: 24px; border-radius: 4px; font-weight: 700; position: absolute; padding: 6px 15px 6px 15px;" runat="server">Heavy Machine</asp:Label>
            </div>
            </div>
  
        </div>
        <div class="two">
            <asp:Label id="eid" style="background-color:#FFAD1D; color:#00196E; padding:10px 30px 10px 30px; font-size:24px; font-weight:700; text-align:center; border-radius:4px; vertical-align: super" runat="server" Text='<%# Eval("code")%>'></asp:Label>
            <asp:Label id="brand" runat="server" style="display:inline-block; color:#00196E; font-size:24px; font-weight:700; float:right" Text='<%# Eval("brand")%>'></asp:Label>
            <br />
            <asp:Label runat="server" style="display:block; color:#00196E;  font-size:60px; font-weight:800; background-color:#E1E1DE; padding:10px 160px 10px 160px; height:100px; text-align:center; border-radius:12px" Text='<%# Eval("name")%>'>3D Printer</asp:Label>
        </div>
        <div class="three">
            <asp:Label id="count" class="equipment_info" runat="server">Link</asp:Label>
            <br/>
            <asp:Label id="description" class="equipment_info" runat="server">Quick guide: <asp:LinkButton ID="desc" runat="server" OnClick="Description_Click">Link</asp:LinkButton></asp:Label>
            <br />
            <asp:Label id="instruction" class="equipment_info" runat="server">Video instruction: Link</asp:Label>
            <br />
            <asp:Label ID="training" class="equipment_info" runat="server">Training requirement: Link</asp:Label>
            <br />
        </div>
    </div>
<%--    <div style="margin-bottom: 3rem"></div>--%>
    <%-- startregion: Subitem Listview --%>
    <asp:ListView runat="server" ID="Subitem_Listview" GroupItemCount="2">
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server" style="min-width:1140px; display: flex;justify-content: space-between">
                <td id="itemPlaceholder" runat="server" ></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server">
                <table class="rounded" style="background-color: #F1F3F6; min-width:400px;">
                    <tr>
                        <td rowspan="2" style="width:104px" class="p-3">
                            <div style="background-color:#F1F3F6;"><img src="Images/<%#Eval("category_src") %>" height="82" width="82"></div>
                        </td>
                        <td class="py-0 pl-0 pr-3 align-bottom">
                            <asp:Label runat="server" Text='<%# String.Concat(Eval("name"), " #", Eval("num"))%>' CssClass="fs-5 text-blue-fuv font-weight-medium"></asp:Label>  
                        </td>
                    </tr>
                    <tr>
                        <td class="py-0 pl-0 pr-3 align-top">
                            <asp:Label runat="server" Text='<%# String.Concat("Location: ", Eval("room_space_name"), " - ", Eval("object_name"), " ", Eval("object_num"))%>' ForeColor="#3A4276"></asp:Label>
                        </td>
                    </tr>          
                </table>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table>
                <tbody>
                    <tr>
                        <td>
                            <table class="table table-borderless" id="groupPlaceholderContainer" runat="server">
                                <tr id="groupPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>               
        </LayoutTemplate>         
    </asp:ListView>
    <%-- endregion: Subitem Listview --%>

</asp:Content>

﻿<%@ Page Title="Equipment Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentDetail.aspx.cs" Inherits="Makerspace.EquipmentDetail" %>
<asp:Content ID="EDetail" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper" style="width: 60vw">
        <div class="one">
            <div>
                <asp:Image ID="equipment_img" runat="server" Width="260" Height="260" style="vertical-align:baseline" />
                <%--<img src="Images/<%#Eval("cat_src")%>" width="260" height="260" style="vertical-align:baseline">--%>
            <br />
            <div style="display: flex; justify-content:center">
                 <asp:Label id="cat" style="background-color: #00196E; color: white; font-size: 24px; border-radius: 4px; font-weight: 700; margin-top:10px; position: absolute; padding: 6px 15px 6px 15px;" runat="server"></asp:Label>
            </div>
            </div>
  
        </div>
        <div class="two">
            <asp:Label id="eid" style="background-color:#FFAD1D; color:#00196E; padding:7px 30px 7px 30px; font-size:24px; font-weight:700; text-align:center; border-radius:4px; vertical-align: super" runat="server"></asp:Label>
            <asp:Label id="brand" runat="server" style="display:inline-block; color:#00196E; font-size:24px; font-weight:700; float:right"></asp:Label>
            <br />
            <asp:Label ID="name" runat="server" style="display:block; color:#00196E; min-width: 590px; font-size:2.5vw; font-weight:800; background-color:#E1E1DE; padding:15px 20px 15px 20px; height:100px; text-align:center; border-radius:12px"></asp:Label>
            <asp:Button runat="server" Text="Edit" BorderStyle="None" style="width: 120px; height: 40px; margin-top:15px; float:right; border-radius:4px; font-size: 24px; font-weight: 600; color: white; background-color: #00196E" OnClick="Edit_Click"/>
        </div>
        <div class="three">
            <asp:Label class="equipment_info" runat="server">Total: <asp:Label id="count" class="equipment_info" runat="server" OnLoad="Count_Load" style="font-weight:normal"></asp:Label></asp:Label>
            <br/>
            <asp:Label id="description" class="equipment_info" runat="server">Decription: <asp:Label id="desc" runat="server" style="font-weight:normal" ></asp:Label></asp:Label>
            <br />
            <asp:Label id="instruction" class="equipment_info" runat="server">Instruction: <asp:LinkButton ID="ins" runat="server" OnClick="Link_Click" OnClientClick="document.forms[0].target = '_blank';"></asp:LinkButton></asp:Label>
            <br />
            <asp:Label class="equipment_info" runat="server">Training requirement: <asp:Label id="train" runat="server"  style="font-weight:normal"></asp:Label></asp:Label>
            <br />
        </div>
    </div>
    <%-- startregion: Subitem Listview --%>
    <div style="width:60vw; margin:auto">
        <asp:ListView runat="server" ID="Subitem_Listview" GroupItemCount="2">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server" style="display:flex; width:60vw; justify-content:space-between">
                    <td id="itemPlaceholder" runat="server" ></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server">
                    <table style="background-color: #F1F3F6; min-width:400px; border-radius:0.75rem">
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
    </div>

    <%-- endregion: Subitem Listview --%>

</asp:Content>

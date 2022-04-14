<%@ Page Title="Makerspace Equipment and Materials" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resource.aspx.cs" Inherits="Makerspace.Resource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center" style="font-size:70px; font-weight:900;"> <span style="color:#00196E">Makerspace</span> <span style="color:#FFAD1D"> Equipment</span></h1>
    <br />
    <br />
        <%-- startregion: Search Form --%>
        <div class="container body-content" style="z-index:1">
            <div class="row" style="-ms-overflow-style:none;">
                <div class="input-group mb-3" id="inputGroup-sizing-default" style="margin-left:auto; margin-right:auto">
                    <asp:TextBox ID="searchBox" placeholder="Search here" runat="server" CssClass="form-control rounded" ></asp:TextBox>
                    <asp:Button ID="searchBtn" runat="server" CssClass="btn btn-secondary ml-1" OnClick="searchBtn_Click" Text="Search" style="background-color:#00196E"/>
                </div>
               
            </div>
        </div>
        <%-- endregion: Search Form --%>

        <%--startregion: ListView Category--%>
        <div class="px-3">
            <label style="color:#00196E; font-size:20px; font-weight:600">Category </label>
        </div>
        <asp:ListView ID="Category_ListView" runat="server" GroupItemCount="8" DataSourceID="Category_DataSource" DataKeyNames="name" OnSelectedIndexChanged="Category_ListView_SelectedIndexChanged" style="z-index:1">
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server" colspan="4">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>    
                <td runat="server">
                 <asp:LinkButton runat="server" CommandName="Select">
                    <table style="border-spacing:0; border-collapse:collapse; padding-top:0px; margin:0px; align-content: center; table-layout: fixed">
                        <tr style="margin:0px; line-height:0px; align-content:center">
                            <td class="text-center" style="padding:0; align-content:center">
                               <div style="background-color:#F1F3F6; border-radius:12px; height:115px; width:115px; position:relative; vertical-align:bottom">
                                        <img src="Images/<%#Eval("cat_src")%>" style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); height:40px"/>
                                </div>
                                <div>
                                </div>
                            </td>
                         </tr>
                        <tr style="line-height:20px; word-wrap: break-word">
                            <td style="text-align: center; width: 115px">
                                <asp:Label style="color:#00196E; font-size:15px; font-weight:800" runat="server" Text='<%#Eval("name")%>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                    </asp:LinkButton>
                </td>
            </ItemTemplate>
            <SelectedItemTemplate>
                <td runat="server">
                    <asp:LinkButton runat="server" CommandName="Select">
                        <table style="border-spacing:0; border-collapse:collapse; padding-top:0px; margin:0px; align-content: center; table-layout: fixed">
                            <tr style="margin:0px; line-height:0px; align-content:center">
                                <td class="text-center" style="padding:0; align-content:center">
                                   <div style="background-color:#F1F3F6; border-radius:12px; height:115px; width:115px; position:relative; vertical-align:bottom">
                                            <img src="Images/<%#Eval("cat_src")%>" style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); height:40px"/>
                                    </div>
                                    <div>
                                    </div>
                                </td>
                             </tr>
                            <tr style="line-height:20px; word-wrap: break-word">
                                <td style="text-align: center; width: 115px">
                                    <asp:Label style="color:#FFAD1D; font-size:15px; font-weight:800" runat="server" Text='<%#Eval("name")%>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:LinkButton>
                </td>
            </SelectedItemTemplate>
            <LayoutTemplate>
                <table style="width:100%">
                    <tbody>
                        <tr>
                            <td>
                                <table class="table table-borderless" id="groupPlaceholderContainer" runat="server" style="width:100%">
                                    <tr id="groupPlaceholder">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="Category_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" SelectCommand="SELECT [name], [cat_src] FROM [Category]"></asp:SqlDataSource>
        

        <div class="mb-4">
            <%-- startregion: Equipment Listview --%>
            <asp:ListView runat="server"  ID="EquipLV" GroupItemCount="4">
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server" colspan="3"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <asp:LinkButton runat="server" OnClick="Direct_EquipmentDetail">
                        <table id="equipment_re" class="rounded text-center" style="background-color: #F1F3F6; width:220px; height: 350px">
                            <tr>
                                <td class="px-3 pt-3">
                                    <img class="rounded center" src="Images/<%#Eval("image")%>" onerror="this.src='Images/mechanics.png'" style="width:100%" height="165"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="px-3 py-0">
                                    <asp:Label id="Label1" runat="server" Text='<%# Eval("name") %>' class="text-blue-fuv font-weight-medium" Font-Size="18px"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" Text='<%# Eval("name_vie") %>' Font-Size="16px" ForeColor="#3A4276"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="background-color: #3A4276; font-size: 16px" class="rounded font-weight-bold text-white">
                                        <asp:Label runat="server" Text='<%# Eval("room_space_name") %>'></asp:Label>
                                    </div>
                                    <div class="text-blue-fuv font-weight-bold bg-white" style="font-size: 24px"><asp:Label runat="server" Text='<%# String.Concat (Eval("object_code").ToString().Trim(), Eval("object_num").ToString().Trim()) %>'></asp:Label></div>
                                </td>
                            </tr>
                        </table>
                    </asp:LinkButton>
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

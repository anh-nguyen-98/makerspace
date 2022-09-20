<%@ Page Title="Independent Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EngineeringProjectMain.aspx.cs" Inherits="Makerspace.ProjectContent" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        #main {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0px;
            gap: 50px;

            position: relative;
        }
        #title {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0px;
            gap: 30px;

            width: 780px;
            /*height: 273px;*/
            margin: auto;

            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        #search_and_sort {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px;
            gap: 21px;

            margin-bottom:18px;

            width: 779px;
            height: 40px;
        }
        .search_box {
            display: inline-block;
            margin-right: 15px;

            flex-direction: row;
            justify-content: center;
            align-items: center;
            padding: 8px 40px;
            gap: 6px;

            width: 578px;
            height: 40px;

            /* Foundation /Blue/blue-50 */

            background-color: #E6E8F1;
            border-radius: 12px;

            /* Inside auto layout */

            flex: none;
            order: 0;
            flex-grow: 1;
        }
        .sort_box {
            display: inline-block;
            box-sizing: border-box;
            width: 180px;
            height: 40px;

            /* Neutral/B00 */

            background: #FFFFFF;
            /* Foundation /Blue/blue-300 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 500;
            font-size: 14px;
            line-height: 20px;
            color: #33478B;
            /* identical to box height, or 143% */

            border: 3px solid #54659E;
            border-radius: 12px;

            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        #box {
            width: 20px;
            height: 20px;

            /* Main/Yellow */

            background: #FFAD1D;

            /* Inside auto layout */

            flex: none;
            order: 0;
            flex-grow: 0;
        }
        #intro {
            width: 429px;
            height: 32px;
            margin-bottom: 20px;

            /* Headline Small - Roboto Bold 24 . 32 . 0 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 700;
            font-size: 24px;
            line-height: 32px;
            /* identical to box height, or 133% */

            display: flex;
            align-items: flex-end;

            /* Neutral/B500 */

            color: #1F2531;


            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        #long_intro {
            width: 780px;
            left: 0.5px;
            top: 153px;

            /* Body Large - Roboto 16 . 24 . +0.15 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            font-size: 16px;
            line-height: 24px;
            /* or 150% */

            letter-spacing: 0.5px;

            /* Neutral/B500 */

            color: #1F2531;
        }
        #rest_of_the_page {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0px;

            width: 780px;
            margin: auto;

            /* Inside auto layout */

            flex: none;
            order: 2;
            flex-grow: 0;
        }
        #itemPlaceholder {
            display: flex;
            flex-direction: row;
            align-items: stretch;
            padding: 0px;
            gap: 20px;

            width: 780px;
            height: 470px;
        }
        #project_card {
            padding: 0px;

            width: 380px;
            height: 470px;
            margin-bottom:18px;

            position: relative;

            /* Neutral/B75 */

            background-color: #F1F3F6;
            /* M3/Elevation Light/2 */

            box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3), 0px 2px 6px 2px rgba(0, 0, 0, 0.15);
            border-radius: 12px;
        }
        #project_card_image {
            width: 380px;
            height: 202px;
            
            border-radius: 12px 12px 0px 0px;
            /* Inside auto layout */

            flex: none;
            order: 0;
            align-self: stretch;
            flex-grow: 0;
        }
        .status_chip {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            padding: 4px 10px;

            position: absolute;
            width: 65px;
            height: 24px;
            right: 16px;
            bottom: 16px;

            /* Function/Yellow */

            background: #FFC700;
            border-radius: 100px;

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 500;
            font-size: 11px;
            line-height: 16px;
            /* identical to box height, or 145% */

            letter-spacing: 0.5px;

            /* Foundation /Blue/blue-500 */

            color: #00196E;
        }
        #status_chip_text {

            /* Label Small - Roboto Medium 11 . 16 . +0.5 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 500;
            font-size: 11px;
            /* identical to box height, or 145% */

            letter-spacing: 0.5px;

            /* Foundation /Blue/blue-500 */

            color: #00196E;
        }
        #headline {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 12px 16px;

            width: 380px;
            height: 72px;


            /* Inside auto layout */
        }
        #project_title {
            width: 328px;
            height: 28px;
            /* Title Large - Roboto Medium 22 . 28 . 0 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 600;
            font-size: 22px;
            line-height: 28px;
            /* identical to box height, or 127% */
            /* Foundation /Blue/blue-500 */

            color: #00196E;
        }
        #project_span {
            width: 328px;
            height: 20px;

            /* Title Small - Roboto Medium 14 . 20 . +0.1 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 500;
            font-size: 14px;
            line-height: 20px;
            /* identical to box height, or 143% */

            letter-spacing: 0.1px;

            /* Neutral/B200 */

            color: #555D6E;
        }
        #overview_box {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 12px 16px;
            gap: 8px;

            width: 380px;
            height: 128px;

            /*white-space: nowrap;*/

            /* Inside auto layout */

            flex: none;
            order: 2;
            align-self: stretch;
            flex-grow: 0;
        }
        #overview_text {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            font-size: 14px;
            line-height: 20px;
            /* or 143% */

            overflow: hidden;
            text-overflow: ellipsis;
            height: 104px;

            letter-spacing: 0.25px;

            /* Neutral/B400 */

            color: #232A38;
        }
        #actions {
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
            padding: 10px 16px;
            gap: 8px;

            width: 380px;
            height: 68px;


            /* Inside auto layout */

            flex: none;
            order: 3;
            align-self: stretch;
            flex-grow: 0;
        }
        #read_more_button {
            width: 101px;
            height: 40px;

            /* Function/Yellow */

            background: #FFC700;
            border-radius: 12px;

            display:flex;
            align-items:center;
            justify-content:center;
        }
        #edit_button {
            box-sizing: border-box;

            /* Auto layout */

            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            padding: 12px 16px;

            width: 56px;
            height: 40px;

            /* Neutral/BFF */

            background: #FAFAFA;
            /* Foundation /Blue/blue-400 */

            border: 2px solid #33478B;
            border-radius: 12px;
        }
    </style>
    <main>
        <%--Title and description--%>
        <section id="title">
            <h1 style="
                
                /* Display Large - Roboto 57 . 64 . 0 */
                font-family: 'Roboto';
                font-style: normal;
                font-weight: 700;
                font-size: 57px;
                line-height: 64px;
                /* or 112% */">
                <span>
                    <span style="color:#00196E">INDEPENDENT</span>
                    <span style="color:#FFAD1D"> PROJECTS</span>
                </span>
            </h1>
            <%--Description--%>
            <section id="sloganAndDescription" style="
                width: 781px;
                /* Inside auto layout */

                flex: none;
                order: 1;
                flex-grow: 0;">
                <section>
                    <div id="box" style="display:inline-block"></div>
                    <div id="intro" style="display:inline-block">We have all engineering projects @ FUV</div>
                </section>
                <p id="long_intro">
                    Here at Fulbright we have many inspired engineering projects led by students, with the help of at least a faculty member. Be sure to check this section often for new exciting project updates!<br />
                    Happy browsing!
                </p>
            </section>
        </section>

        <%--Rest of the page--%>
        <section id="rest_of_the_page">
            <%--Search and sort--%>
            <section id="search_and_sort">
                <span>
                    <%--<input type="text" id="search_box" />--%>
                    <asp:TextBox 
                        ID="search" 
                        runat="server" 
                        CssClass="search_box" 
                        placeholder="Search" 
                        ForeColor="#8A95BC"
                        BorderWidth="0px"></asp:TextBox>
                    
                    <asp:DropDownList id="sortOption" runat="server" CssClass="sort_box"
                        ForeColor="#54659E">
                        <asp:ListItem Value="aToZ">A to Z</asp:ListItem>
                        <asp:ListItem Value="zToA">Z to A</asp:ListItem>
                        <asp:ListItem Value="newest">Newest</asp:ListItem>
                        <asp:ListItem Value="oldest">Oldest</asp:ListItem>
                    </asp:DropDownList>

                </span>
                <br />
            </section>
            <%--Project Listing--%>
            <section id="project_listing">
                <%--https://docs.microsoft.com/en-us/dotnet/api/system.web.ui.webcontrols.listview?view=netframework-4.8--%>
                <asp:ListView 
                    runat="server" 
                    ID="ListView1" 
                    GroupItemCount="2">                    
                    <LayoutTemplate>
                        <table cellpadding="10" runat="server" id="tblProject">
                            <tr runat="server" id="groupPlaceholder" />
                        </table>
                    </LayoutTemplate>

                    <GroupTemplate>
                        <tr id="horizontal_group" runat="server">
                            <td runat="server" id="itemPlaceholder"/>
                        </tr>
                    </GroupTemplate>

                    <ItemTemplate>
                        <td runat="server">
                            <div id="project_card">
                                <%--Note: div of image has position:relative so that status chip can display over image--%>
                                <div id="project_image_group" style="position: relative">
                                    <img id="project_card_image" src='Images/engineering_project/<%#Eval("image_path")%>.jpg' onerror="this.src='Images/engineering_project/1.png'"/>
                                    <%--Doesn't show the "Ongoing" label if the "ongoing" field returns 0--%>
                                    <asp:Label
                                        runat="server" 
                                        CssClass="status_chip" 
                                        Text="Ongoing" 
                                        Visible= <%# (int)Eval("ongoing") == 1%> 
                                        />
                                </div>

                                <div id="headline">
                                    <div>
                                        <span id="project_title"><%#Eval("name") %></span>
                                    </div>
                                    <p id="project_span">
                                        <%--<%# Eval("begin_date") %> - <%#Eval("end_date") %>--%>
                                        <%--<asp:Label runat="server" Text='<%# (int)Eval("ongoing") == 1 ? Eval("begin_date") + " - " + Eval("end_date") : Eval("begin_date") + " - Present"%>'></asp:Label>--%>
                                        <asp:Label runat="server" Text='<%# (int)Eval("ongoing") == 1 ? String.Concat( DateTime.Parse(Eval("begin_date").ToString()).ToShortDateString() , " - Present") : String.Concat( DateTime.Parse (Eval("begin_date").ToString()).ToShortDateString(), " - ", DateTime.Parse( Eval("end_date").ToString()).ToShortDateString())%>'></asp:Label> 
                                    </p>
                                    
                                </div>

                                <div id="overview_box">
                                    <span id="overview_text"><%#Eval("overview") %></span>
                                </div>

                                <div id="actions">
                                    <!-- EDIT BUTTON -->
                                    <%--<a id="edit_button">
                                        <img src="Images/engineering_project/edit.png"/>
                                    </a>--%>

                                    <!-- in order to pass multiple query strings, put '&' in between fields -->
                                    <asp:HyperLink
                                        id="read_more"
                                        NavigateUrl='<%# String.Format("~/EngineeringProjectView.aspx?projectID={0}&projectName={1}", Eval("projectID"), Eval("name")) %>'
                                        
                                        runat="server">

                                        <div id="read_more_button">
                                            <span style="
                                                font-family: 'Roboto';
                                                font-style: normal;
                                                font-weight: 500;
                                                font-size: 14px;
                                                line-height: 20px;
                                                /* identical to box height, or 143% */

                                                letter-spacing: 0.1px;

                                                /* Neutral/B500 */

                                                color: #1F2531;">Read More</span>
                                        </div>
                                    </asp:HyperLink>

                                </div>
                            </div>
                        </td>
                    </ItemTemplate>
                </asp:ListView>
            </section>
        </section>
    </main>
</asp:Content>
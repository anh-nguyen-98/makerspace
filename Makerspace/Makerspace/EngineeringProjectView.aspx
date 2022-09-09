<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EngineeringProjectView.aspx.cs" Inherits="Makerspace.EngineeringProjectView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #page_root {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px;

            position: relative;

            background: #FAFAFA;
        }
        #page_cover {
            display: flex;
            flex-direction: column;
            position: relative;

            width:100%;
            height:auto;
            margin-top:-55px;

            order:0;
        }
        .status_chip {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            padding: 4px 10px;

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
        #edit_button {
            box-sizing: border-box;

            /* Auto layout */

            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            padding: 12px 16px;
            gap: 6px;

            width: 56px;
            height: 40px;

            /* Neutral/B00 */

            background: #FFFFFF;
            /* Foundation /Blue/blue-400 */

            border: 2px solid #33478B;
            border-radius: 12px;

            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        .box {
            display:flex;
            width: 20px;
            height: 20px;
            background: #FFAD1D;
            flex: none;
            order: 0;
            flex-grow: 0;
        }
        #page_cover_button_container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            padding: 0px;
            gap: 20px;

            position: absolute;
            left: 9.03%;
            right: 9.03%;
            /*top: 78.67%;*/
            bottom: 4%;
        }
        #about_project {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 50px;
            gap: 30px;

            width: 100%;

            /* Neutral/B75 */

            background: #F1F3F6;

            /* Inside auto layout */

            flex: none;
            order: 1;
            align-self: stretch;
            flex-grow: 0;
                    }
        #project_department {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 50px;
            gap: 30px;

            width:100%;

            /* Neutral/B00 */

            background: #FFFFFF;

            /* Inside auto layout */

            flex: none;
            order: 2;
            align-self: stretch;
            flex-grow: 0;
        }
        .section_content_container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px;
            gap: 20px;

            width: 780px;

            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        #project_progress {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 50px;
            gap: 20px;

            width: 100%;

            /* Neutral/B75 */

            background: #F1F3F6;

            /* Inside auto layout */

            flex: none;
            order: 3;
            align-self: stretch;
            flex-grow: 0;
        }
        .image2_box{
            width: 382px;

            /* Inside auto layout */

            flex: none;
            order: 0;
            align-self: stretch;
            flex-grow: 0;
        }
        #project_progress_content {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px;
            gap: 30px;

            width: 380px;

            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        #join_us {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 50px;
            gap: 30px;

            width: 100%;

            background: #FFFFFF;

            flex: none;
            order: 4;
            align-self: stretch;
            flex-grow: 0;
        }
        .project_contact {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 50px;
            gap: 30px;

            width: 100%;

            /* Neutral/B75 */

            background: #F1F3F6;

            /* Inside auto layout */

            flex: none;
            order: 5;
            align-self: stretch;
            flex-grow: 0;
        }
        .project_contact_hidden {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 50px;
            gap: 30px;

            width: 100%;

            /* Neutral/B00 */

            background: #FFFFFF;

            /* Inside auto layout */

            flex: none;
            order: 4;
            align-self: stretch;
            flex-grow: 0;
        }
        #project_contact_content {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px 30px;
            gap: 20px;

            width: 780px;

            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        .link_box {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            padding: 0px;
            gap: 14px;

            height: 24px;


            /* Inside auto layout */

            flex: none;
            flex-grow: 0;
        }
        .link {
            height: 24px;

            /* Title Medium - Roboto Medium 16 . 24 . +0.15 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 500;
            font-size: 16px;
            line-height: 24px;
            /* identical to box height, or 150% */

            display: flex;
            align-items: flex-end;
            letter-spacing: 0.1px;

            /* Function/Blue */

            color: #295FCC;


            /* Inside auto layout */

            flex: none;
            flex-grow: 0;
        }
        .link_icon {
            width: 24px;
            height: 24px;


            /* Inside auto layout */

            flex: none;
            order: 0;
            flex-grow: 0;
        }
        .section_title {
            display: flex;
            flex-direction: row;
            align-items: center;
            padding: 0px;
            gap: 7px;

            width: 780px;
            height: 36px;
            line-height:36px;
            text-align:center;

            flex: none;
            order: 0;
            flex-grow: 0;
        }
        .advisor {
            width: 780px;
            height: 28px;

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 600;
            font-size: 22px;
            line-height: 28px;

            color: #1F2531;

            order: 1;
        }
        .about_project_content {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px;
            gap: 20px;
            width: 780px;

            flex: none;
            order: 2;
            flex-grow: 0;
        }
        #brief_overview{
            order:0;
        }
        #objective{
            order:1;
        }
        #duration{
            order:2;
        }
        #image_group_1_box{
            order:3;
        }
        h2 {
            display:inline-block;
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 600;
            font-size: 28px;
            line-height: 36px;

            display: flex;
            align-items: flex-end;

            color: #1F2531;

            flex: none;
            order: 1;
            flex-grow: 0;

            text-align:center;
        }
        .para_header {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 600;
            font-size: 22px;
            line-height: 28px;

            color: #33478B;
        }
        .long_text {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            font-size: 16px;
            line-height: 24px;

            letter-spacing: 0.5px;

            color: #1F2531;
        }
        .intro {
            display: inline-block;
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 600;
            font-size: 28px;
            line-height: 36px;
            display: flex;
            align-items: flex-end;
            color: #1F2531;
            flex: none;
            order: 1;
            flex-grow: 0;
        }
        .image_1 {
            width: 780px;
            height: 439px;

            /* Inside auto layout */

            flex: none;
            order: 3;
            flex-grow: 0;
        }
    </style>

    <div id="page_root">
        <%--PAGE COVER--%>
    <section id="page_cover">
        <div id="page_cover_button_container">
                <div style="
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    padding: 0px;
                    gap: 20px;

                    width: 360px;
                    height: 52px;

                    /* Inside auto layout */

                    flex: none;
                    order: 0;
                    flex-grow: 0;">
                    <span style="
                        height: 52px;

                        /* Display Medium - Roboto 45 . 52 . 0 */

                        font-family: 'Roboto';
                        font-style: normal;
                        font-weight: 700;
                        font-size: 45px;
                        line-height: 52px;
                        /* identical to box height, or 116% */

                        display: flex;
                        align-items: center;

                        /* Neutral/B00 */

                        color: #FFFFFF;

                        /* Inside auto layout */

                        flex: none;
                        order: 0;
                        flex-grow: 0;
                        ">
                        <asp:Label ID="project_title" runat="server"></asp:Label>
                    </span>

                    <asp:Label
                        id="statusChip"
                        runat="server" 
                        CssClass="status_chip" 
                        Text="Ongoing" 
                        />
                </div>

                <div id="edit_button">
                    <a>
                        <%--<asp:Image runat="server" ImageUrl="Images\engineering_projects\edit.png"/>--%>
                        <img src="Images/engineering_project/edit.svg" />
                    </a>
                </div>   
        </div>

            <%--gradient still under construction--%>
        <div id="cover_image_container">
            <asp:Image ID="coverImage" runat="server" width="100%" height="300px"/>
        </div>
    </section>

    <%--ABOUT THE PROJECT--%>
    <section id="about_project">

        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">About the Project</div>
        </section>

        <%--<section class="advisor">Advisor(s): Phan Vu Xuan Hung</section>--%>

        <asp:FormView
            id="aboutProjectFormView"
            runat="server"
            datakeynames="projectID"
            CssClass="about_project_content"
            >

            <ItemTemplate>
                <table>
                    <p class="advisor">
                        <asp:Label runat="server" Text= '<%#Eval("advisor", "Advisor(s): {0}") %>'></asp:Label>
                    </p>
                    <p class="para_header">Brief Overview
                        <br />
                        <span class="long_text">
                            <asp:Label CssClass="long_text" runat="server" Text='<%# Eval("overview") %>'></asp:Label>
                        </span>
                    </p>
                    
                    <p class="para_header">Objectives
                        <br />
                        <span class="long_text">
                            <asp:Label CssClass="long_text" runat="server" Text='<%# Eval("objective") %>'></asp:Label>
                        </span>
                    </p>
                    
                    <p class="para_header">Duration
                        <br />
                        <span class="long_text">
                            <asp:Label CssClass="long_text" runat="server" Text='<%# Eval("duration") %>'></asp:Label>
                        </span>
                    </p>
                    
                </table>

            </ItemTemplate>

        </asp:FormView>

        <asp:Label runat="server" ID="debug_label" Text="DEBUG:"> </asp:Label>

        <section id="image_group_1_box">
            <%--set image url in page_load()--%>
            <asp:Image width="780px" Height="439px" ID="image1" ImageUrl="Images/engineering_project/girl.jpg" runat="server" />
            <%--<img class="image_1" id="image1" runat="server" />--%>
        </section>
    </section>

    <%--DEPARTMENTS--%>
    <section id="project_department">
        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">Departments</div>
        </section>

        <section class="section_content_container">
            <asp:ListView
                id="projectDepartmentListview"
                runat="server"
                GroupItemCount="1"
                >

                <GroupTemplate>
                    <tr runat="server">
                        <td runat="server" id="itemPlaceholder"/>
                    </tr>
                </GroupTemplate>

                <ItemTemplate>
                    <td runat="server">
                        <p>
                            <asp:Label runat="server" CssClass="para_header" Text='<%# Eval("name") %>'></asp:Label>
                            <br />
                            <asp:Label runat="server" CssClass="long_text" Text='<%# Eval("role") %>'></asp:Label>
                        </p>
                    
                    </td>
                </ItemTemplate>

            </asp:ListView>
        </section>
            
    </section>

    <%--PROGRESS--%>
    <section id="project_progress">

        <asp:Image CssClass="image2_box" ID="image2" runat="server"/>

        <div id="image2_box">
            <%--set image url in page_load()--%>
            
        </div>

        <div id="project_progress_content">
            <section class="section_title">
                <div class="box" style="display:inline-block"></div>
                <div class="intro" style="display:inline-block">Progress</div>
            </section>

            <asp:ListView
                id="projectProgressListview"
                runat="server"
                GroupItemCount="1">

                <GroupTemplate>
                    <tr runat="server">
                        <td runat="server" id="itemPlaceholder"/>
                    </tr>
                </GroupTemplate>

                <ItemTemplate>
                    <td runat="server">
                        <p>
                            <asp:Label runat="server" CssClass="para_header" Text='<%# Eval("phase", "Phase {0}") %>'></asp:Label>
                            <br />
                            <asp:Label runat="server" CssClass="long_text" Text='<%# Eval("description") %>'></asp:Label>
                        </p>
                    </td>
                </ItemTemplate>

            </asp:ListView>
        </div>
    </section>

    <%-- JOIN US --%>
    <section id="join_us" runat="server">
        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">Join Us!</div>
        </section>
        
        <section class="section_content_container">
            <asp:Listview
                id="projectPositionListview"
                runat="server"
                GroupItemCount="1"
                >

                <GroupTemplate>
                    <tr runat="server">
                        <td runat="server" id="itemPlaceholder"/>
                    </tr>
                </GroupTemplate>

                <ItemTemplate>
                    <td runat="server">
                        <p>
                            <asp:Label runat="server" CssClass="para_header" Text='<%# Eval("name") %>'></asp:Label>
                            <br />
                            <asp:Label runat="server" CssClass="long_text" Text='<%# Eval("description") %>'></asp:Label>
                        </p>
                    </td>
                </ItemTemplate>

            </asp:Listview>
        </section>
        
    </section>

    <%-- CONTACTS --%>
    <section id="project_contact" runat="server">
        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">Contacts</div>
        </section>

        <section id="project_contact_content">

            <div class="link_box">
                <img src="Images/engineering_project/youtube_icon.svg"/>
                <a id="youtubeLink" runat="server" class="link" target="_blank" rel="noopener noreferrer"
                    href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Youtube Link</a>
            </div>

            <div class="link_box">
                <img src="Images/engineering_project/facebook_icon.svg"/>
                <a id="facebookLink" runat="server" class="link" target="_blank" rel="noopener noreferrer"
                    href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Facebook Link</a>
            </div>

            <div class="link_box">
                <img src="Images/engineering_project/email_icon.svg"/>
                <a id="emailLink" runat="server" class="link" target="_blank" rel="noopener noreferrer"
                    href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Email</a>
            </div>
        </section>
                
        
    </section>
    </div>
</asp:Content>

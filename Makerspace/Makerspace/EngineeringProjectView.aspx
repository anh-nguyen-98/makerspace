<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EngineeringProjectView.aspx.cs" Inherits="Makerspace.EngineeringProjectView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #header {
            display: flex;
            flex-direction: column;
            position: relative;

            width:100%;
            height:auto;
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
            width: 20px;
            height: 20px;
            display: inline-block;

            /* Main/Yellow */

            background: #FFAD1D;

            /* Inside auto layout */

            flex: none;
            order: 0;
            flex-grow: 0;
        }
        #page_cover_container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            padding: 0px;
            gap: 20px;

            position: absolute;
            left: 9.03%;
            right: 9.03%;
            top: 78.67%;
            bottom: 4%;
        }
        #about_project {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 50px;
            gap: 30px;

            width:100%;
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
        #join_us {
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
        #project_contact {
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
        .section_title {
            display: flex;
            flex-direction: row;
            align-items: center;
            padding: 0px;
            gap: 7px;

            width: 780px;
            height: 36px;

            flex: none;
            order: 0;
            flex-grow: 0;


        }
        .advisor {
            width: 780px;
            height: 28px;

            /* Title Large - Roboto Medium 22 . 28 . 0 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 600;
            font-size: 22px;
            line-height: 28px;
            /* identical to box height, or 127% */


            /* Neutral/B500 */

            color: #1F2531;


            /* Inside auto layout */

        }

    </style>

    <header id="header">
        <%--PAGE COVER--%>
        <section id="page_cover">
            <div id="page_cover_container">
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
                        ">Project Name</span>

                    <asp:Label
                        runat="server" 
                        CssClass="status_chip" 
                        Text="Ongoing" 
                        Visible=true
                        />
                </div>

                <div id="edit_button">
                    <a>
                            <img src="Images/engineering_project/edit.png"/>
                    </a>
                </div>
                        
            </div>

            <%--gradient still pending--%>
            <div id="cover_image_container">
                <asp:Image ImageUrl="Images\engineering_project\1.jpg" runat="server" width="100%" height="300px"/>
            </div>
                            
        </section>
    </header>

    <main id="main">

        <%--ABOUT THE PROJECT--%>
        <section id="about_project">
            <section class="section_title">
                <div class="box"></div>
                <span style="
                    font-family: 'Roboto';
                    font-style: normal;
                    font-weight: 600;
                    font-size: 28px;
                    line-height: 36px;
                    /* identical to box height, or 129% */

                    display: flex;
                    align-items: flex-end;

                    /* Neutral/B500 */

                    color: #1F2531;


                    /* Inside auto layout */

                    flex: none;
                    order: 1;
                    flex-grow: 0;
                    ">About the Project</span>
            </section>

            <section class="advisor">Advisor(s): Phan Vu Xuan Hung</section>

            <section id="about_project_content">
                <section id="brief_overview">
                    <span>Brief Overview</span>
                </section>

                <section id="objective">
                    <span>Objectives</span>
                </section>

                <section id="duration">
                    <span>Duration</span>
                </section>

                <section id="image_box_1">
                    
                </section>
            </section>

            <section id="image_group_1_box">
                <%--set image url in page_load()--%>
                <asp:Image ID="image1" runat="server" />

                <asp:Button ID="Button1" Text="Back" runat="server"/>

                <asp:Label runat="server" Text="1/5"></asp:Label>

                <asp:Button ID="Button2" Text="Next" runat="server"/>
            </section>
        </section>

        <%--DEPARTMENTS--%>
        <section id="project_department">
            <section>
                <div class="box"></div>
                <span>Departments</span>
            </section>

            <asp:ListView
                id="project_department_listview"
                runat="server"
                GroupItemCount="1">

                <GroupTemplate>
                    <tr runat="server">
                        <td runat="server" id="itemPlaceholder"/>
                    </tr>
                </GroupTemplate>

                <ItemTemplate>
                    <td runat="server">
                        <span>Department 1</span>
                        <span>Placeholder for department description.</span>
                    </td>
                </ItemTemplate>
            </asp:ListView>
        </section>

        <%--PROGRESS--%>
        <section id="project_progress">
            <div class="box"></div>
            <span>Progress</span>

            <div id="image_group_2_box">
                <%--set image url in page_load()--%>
                <asp:Image ID="image_group_2" runat="server" />

                <asp:Button ID="previous_image_2" Text="Back" runat="server"/>

                <asp:Label runat="server" Text="1/5"></asp:Label>

                <asp:Button ID="next_image_2" Text="Next" runat="server"/>
            </div>

            <div id="project_phase">
                <asp:ListView
                    id="project_phase_listview"
                    runat="server"
                    GroupItemCount="1">

                    <GroupTemplate>
                        <tr runat="server">
                            <td runat="server" id="itemPlaceholder"/>
                        </tr>
                    </GroupTemplate>

                    <ItemTemplate>
                        <td runat="server">
                            <span>Phase 1</span>
                            <span>Placeholder for department description.</span>
                        </td>
                    </ItemTemplate>

                </asp:ListView>
            </div>
        </section>

        <%-- JOIN US --%>
        <section id="join_us">
            <section>
                <div class="box"></div>
                <span>Join us!</span>
            </section>
                
            <asp:Listview
                id="join_us_listview"
                runat="server"
                GroupItemCount="1"
                Visible= true>

                <GroupTemplate>
                    <tr runat="server">
                        <td runat="server" id="itemPlaceholder"/>
                    </tr>
                </GroupTemplate>

                <ItemTemplate>
                    <td runat="server">
                        <span>Position 1</span>
                        <span>Placeholder for position description.</span>
                    </td>
                </ItemTemplate>

            </asp:Listview>
        </section>

        <%-- CONTACTS --%>
        <section id="project_contact">
            <section>
                <div class="box"></div>
                <span>Contacts</span>
            </section>
                
            <p id="youtube_link">
                <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Youtube Link</a>
            </p>

            <p id="facebook_link">
                <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Facebook Link</a>
            </p>

            <p id="email_address">
                <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Email</a>
            </p>
        </section>
    </main>
</asp:Content>

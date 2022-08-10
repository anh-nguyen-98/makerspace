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
        #about_project_content {
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
        #image_group_2_box{
            width: 382px;
            height: 517px;

            flex: none;
            order: 0;
            align-self: stretch;
            flex-grow: 0;
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
        h3 {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 600;
            font-size: 22px;
            line-height: 28px;

            color: #33478B;
        }
        p {
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

    <%--ABOUT THE PROJECT--%>
    <section id="about_project">

        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">About the Project</div>
        </section>

        <section class="advisor">Advisor(s): Phan Vu Xuan Hung</section>

        <section id="about_project_content">
            <section id="brief_overview">
                <h3>Brief Overview</h3>
                <p>
                    <asp:Label runat="server"></asp:Label>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit sagittis feugiat sit nunc. Risus at maecenas senectus elementum neque. Turpis sodales neque, in cursus tellus enim imperdiet. Urna tincidunt a gravida quam a volutpat vehicula congue. Eu sit morbi ut vulputate habitant. Feugiat et vulputate nibh ut a feugiat. Porttitor turpis sed pretium blandit et eget porttitor ultrices. Maecenas lectus egestas turpis sed eu mauris, etiam.
                </p>
               
            </section>

            <section id="objective">
                <h3>Objectives</h3>
                <p>
                    <asp:Label runat="server"></asp:Label>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit sagittis feugiat sit nunc. Risus at maecenas senectus elementum neque. Turpis sodales neque, in cursus tellus enim imperdiet. Urna tincidunt a gravida quam a volutpat vehicula congue. Eu sit morbi ut vulputate habitant. Feugiat et vulputate nibh ut a feugiat. Porttitor turpis sed pretium blandit et eget porttitor ultrices. Maecenas lectus egestas turpis sed eu mauris, etiam.
                </p>
            </section>

            <section id="duration">
                <h3>Duration</h3>
                <p>
                    <asp:Label runat="server"></asp:Label>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit sagittis feugiat sit nunc. Risus at maecenas senectus elementum neque. 
                </p>
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
        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">Departments</div>
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
        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">Progress</div>
        </section>

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
        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">Join Us!</div>
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
        <section class="section_title">
            <div class="box" style="display:inline-block"></div>
            <div class="intro" style="display:inline-block">Contacts</div>
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
    </div>
</asp:Content>

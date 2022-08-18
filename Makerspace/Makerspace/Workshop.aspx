<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Workshop.aspx.cs" Inherits="Makerspace.Workshop" %>

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
        #title_section {
            height: 64px;

            /* Display Large - Roboto 57 . 64 . 0 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 700;
            font-size: 57px;
            line-height: 64px;
            /* identical to box height, or 112% */

            display: flex;
            align-items: center;
            text-align: center;
            letter-spacing: -0.25px;

            /* Inside auto layout */

            flex: none;
            order: 0;
            flex-grow: 0;
        }
        .section_title {
            width: 132px;
            height: 32px;

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
        }
        .section_description {
            width: 780px;

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
        .box {
            display:flex;
            width: 20px;
            height: 20px;
            background: #FFAD1D;
            
            /* Inside auto layout */

            flex: none;
            order: 0;
            flex-grow: 0;
        }
        .box_title {
            /*width: 132px;*/
            height: 32px;

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
        #intro {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px;
            gap: 20px;

            width: 780px;

            /* Inside auto layout */

            flex: none;
            order: 2;
            flex-grow: 0;
        }
        p {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            font-size: 16px;
            line-height: 24px;
            /* or 150% */

            letter-spacing: 0.5px;

            color: #000000;
        }

    </style>


    <main id="main">
        <section style="/* Auto layout */

                        display: flex;
                        flex-direction: row;
                        align-items: center;
                        padding: 0px;
                        gap: 7px;

                        width: 780px;
                        height: 32px;


                        /* Inside auto layout */

                        flex: none;
                        order: 0;
                        flex-grow: 0;">
            <span id="title_section">
                <span style="color:#FFAD1D">WORKSHOP:</span>
                <span style="color:#00196E"> DIGITAL DESIGN</span>
            </span>
        </section>

        <section id="intro">
            <section class="section_title">
                <div class="box"></div>
                <div class="box_title" style="display:inline-block">Introduction</div>
            </section>

            <section>
                <p>
                    Digital Design is (mostly) all about realizing ideas into viewable 3D objects using Fusion 360. This workshop will help you visualize your ideas and jot down details of the product before making them, so as to avoid mistakes later on. 
                </p>
            </section>

            <section>
                <img class="inline_images" src="Images\A18-030.jpg"/>
            </section>
        </section>
    </main>
</asp:Content>

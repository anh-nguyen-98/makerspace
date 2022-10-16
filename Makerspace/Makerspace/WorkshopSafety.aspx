<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkshopSafety.aspx.cs" Inherits="Makerspace.WorkshopDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #main {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0px;
            gap: 40px;

            position: relative;
            width: 100%;
        }
        #PageHeading {
            /* Auto layout */

            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: flex-start;
            padding: 0px;

            width: 100%;
            height: 64px;


            /* Inside auto layout */

            flex: none;
            align-self: stretch;
            flex-grow: 0;
        }
        #DisplayLarge {
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
            letter-spacing: -0.25px;
        }
        #LabelLarge {
            height: 20px;

            /* Label Large - Roboto Medium 14 . 20 . +0.1 */

            font-family: 'Roboto';
            font-style: normal;
            font-weight: 500;
            font-size: 14px;
            line-height: 20px;
            /* identical to box height, or 143% */

            letter-spacing: 0.1px;

            /* Neutral/B500 */

            color: #1F2531;
        }
        .Content {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 0px;
            gap: 16px;

            width: 780px;
        }
        .Box {
            display:flex;
            width: 20px;
            height: 20px;
            background: #FFAD1D;
            
            /* Inside auto layout */
            flex: none;
            order: 0;
            flex-grow: 0;
        }
        .HeadlineSmall {
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


            /* Inside auto layout */

            flex: none;
            order: 1;
            flex-grow: 0;
        }
        .ContentTilte {
            display: flex;
            flex-direction: row;
            align-items: center;
            padding: 0px;
            gap: 8px;

            width: 780px;
            height: 32px;


            /* Inside auto layout */

            flex: none;
            order: 0;
            flex-grow: 0;
        }
        p {
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
        ol {
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
        .NavButton {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            padding: 12px 16px;
            gap: 4px;

            height: 40px;

            background: #CEECF6;
            border-radius: 12px;
        }

    </style>
    <section id="main">
        <section id="PageHeading"; order: 0>
            <span id="DisplayLarge">
                <span 
                    style="color:#FFAD1D;flex: none;order: 0;flex-grow: 0;">
                    WORKSHOP:&nbsp 
                </span>
                <span 
                    style="color:#00196E;flex: none;order: 1;flex-grow: 0;">
                    SAFETY
                </span>
            </span>
        </section>

        <section id="Introduction" class="Content">
            <section class="ContentTilte">
                <div class="Box"></div>
                <div class="HeadlineSmall">Introduction</div>
            </section>
            <p>
                This workshop aims to introduce you to the facilities available to you 
                in the Makerspace as well as procedures to operate them safely. Such 
                safety trainings are common across industries, which will help you get 
                to know the ins and outs of the Makerspace and ensure everyone’s safety.    
            </p>
            <video width="780" height="440" controls>
              <source src="/Videos/orientation-video-1.mp4" type="video/mp4">
            Your browser does not support the video tag.
            </video>
            <%--<img style="width: 780px;height: 440px;" 
                src="https://images.unsplash.com/photo-1592016871138-88a6e4fe3701?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"/>--%>
        </section>

        <section id="WhatYouWillLearn" class="Content">
            <section class="ContentTilte">
                <div class="Box"></div>
                <div class="HeadlineSmall">What you will learn</div>
            </section>
            <ol start="1">
              <li>Layout of the Synergy Room and Maker Room. </li>
              <li>Designated workspace for different works.</li>
              <li>How to safely operate machineries.</li>
              <li>Safety procedure in case of emergency.</li>
            </ol> 
        </section>

        <section id="WhatYouNeedToPrepare" class="Content">
            <section class="ContentTilte">
                <div class="Box"></div>
                <div class="HeadlineSmall">What you need to prepare</div>
            </section>
            <p>
                This workshop does not require prior preparation.
            </p>
        </section>

        <section id="OtherWorkshops" class="Content">
            <section class="ContentTilte">
                <div class="Box"></div>
                <div class="HeadlineSmall">Other Workshops</div>
            </section>
            <section id="LinkButtons" 
                    style="display: flex;
                    flex-direction: row;
                    align-items: center;
                    padding: 0px;
                    gap: 16px;

                    width: 780px;
                    height: 40px;">

                <div class="NavButton">
                    <a class="LabelLarge" href="WorkshopDigitalDesign.aspx">Digital Design</a>
                </div>
                <div class="NavButton">
                    <a class="LabelLarge" href="WorkshopElectrics.aspx">Electrics</a>
                </div>
                <div class="NavButton">
                    <a class="LabelLarge" href="WorkshopFabrication.aspx">Fabrication</a>
                </div>

            </section>
        </section>
    </section>
    

</asp:Content>

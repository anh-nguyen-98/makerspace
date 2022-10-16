<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkshopFabrication.aspx.cs" Inherits="Makerspace.WorkshopDetail" %>

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
                    FABRICATION
                </span>
            </span>
        </section>

        <section id="Introduction" class="Content">
            <section class="ContentTilte">
                <div class="Box"></div>
                <div class="HeadlineSmall">Introduction</div>
            </section>
            <p>
                The fabrication workshop introduces you to some of the most common
                machines to be used in DST projects: 3D printer, Laser Engraver, CNC 
                machine, and various Large Hand tools. These are hands-on, offline 
                workshops to give you the basic ideas of how these machines work 
                and how to operate them.     
            </p>
            <img style="width: 780px;height: 440px;" 
                src="https://images.unsplash.com/photo-1515630771457-09367d0ae038?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"/>
        </section>

        <section id="WhatYouWillLearn" class="Content">
            <section class="ContentTilte">
                <div class="Box"></div>
                <div class="HeadlineSmall">What you will learn</div>
            </section>
            <ol start="1">
              <li>All about: 3D printer, Laser Engraver, CNC machine, Larger Hand tools.</li>
              <li>How to operate them. </li>
              <li>When to use them. </li>
              <li>What to do in case of malfunction.</li>
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
                    <a class="LabelLarge" href="WorkshopSafety.aspx">Safety</a>
                </div>

            </section>
        </section>
    </section>
    

</asp:Content>

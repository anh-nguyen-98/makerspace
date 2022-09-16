<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Makerspace.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center" style="font-size:70px; font-weight:900;"> <span style="color:#00196E">Makerspace</span> <span style="color:#FFAD1D"> Information</span></h1>

    <div class="container about-page" style="width: 60vw">
        <div class="row" style="margin-bottom: 40px; justify-content: center; background:#f1f3f6;">
            <div>
                <asp:Image ID="cover" src="Images/Makerspace_Cover.png" runat="server"/>
            </div>
        </div>

        <div class="row" style="margin-bottom: 40px">
            <div class="d-flex" style="width:100%; min-height:200px;">
                      
                <div class="flex-grow-1" style="background-color: #00196E; border-top-left-radius: 12px; border-bottom-left-radius: 12px">
                  
                </div>
                <div style="width: 66%;padding-top: 30px; padding-bottom: 30px; padding-left: 54px; padding-right:54px; background: #F1F3F6; color: #00196E;">
                    <p> <i>Learn more about</i></p>
                    <p style="font-size: 40px; font-weight:900;">
                        BOOKING
                    </p>
                    <p>
                        Not sure what you need? Grab 60 minutes with us and we will work with you to understand your goals, and to develop a proposal and price estimate.
                    </p>
                    <a class="yellow-btn" href="https://outlook.office365.com/owa/calendar/Makerspacebooking@fulbright.edu.vn/bookings/">Our Services</a>
                 
                </div>
                <div class="d-flex flex-column" style="width: 32%;">
                    <div style="background-color: #00196E; height: 40px; border-top-right-radius: 12px">


                    </div>
                    <div style="position: relative" class="flex-grow-1">
                          <img src="Images/Makerspace_Logo.png"  style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); width: 60%;" />
                  

                    </div>
                    <div style="background-color: #00196E; height: 40px; border-bottom-right-radius: 12px">


                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="d-flex" style="width:100%; min-height:200px; margin-bottom: 40px">
                 <div class="d-flex flex-column" style="width: 32%;">
                    <div style="background-color: #00196E; height: 40px; border-top-left-radius: 12px">


                    </div>
                    <div style="position: relative; background-color: #00196E" class="flex-grow-1">
                          <img src="Images/About_Workshop.png"  style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); width: 100%;" />
                  

                    </div>
                    <div style="background-color: #00196E; height: 40px;border-bottom-left-radius: 12px">


                    </div>
                </div>
              
                <div style="width: 66%;padding-top: 30px; padding-bottom: 30px; padding-left: 54px; padding-right:54px; background: #F1F3F6; color: #00196E;">
                    <p><i>Learn more about</i></p>
                    <p style="font-size: 40px; font-weight:900;">
                        WORKSHOPS
                    </p>
                    <p>
                        The Makerspace workshop offers theoretical background information and practical hands-on activities in a variety of "soft skills" areas that are relevant to working in the tech sector, especially those themes that are customized to the context of Engineers..
                    </p>
                    <div class="d-flex justify-content-between mb-2">
                       
                                <asp:Button runat="server" Text="Digital Design" CssClass="white-btn"/>
                           
                                 <asp:Button runat="server" Text="Electrics & Arduino" CssClass="white-btn"/>
                                   

                    </div>
                    
                   
                    <div class="d-flex justify-content-between">
                        <asp:Button runat="server" Text="Fabrication" CssClass="white-btn"/>
                    <asp:Button runat="server" Text="Safety & Policy" CssClass="white-btn"/>
                    </div>
                    
                </div>
                  <div class="flex-grow-1" style="background-color: #00196E; border-top-right-radius: 12px; border-bottom-right-radius: 12px">
                  
                </div>
               
            </div>

            
        </div>
        <div class="row">
            <div class="d-flex"  style="width:100%; min-height:200px; margin-bottom: 40px">
                <div class="flex-grow-1" style="background-color: #00196E; border-top-left-radius: 12px; border-bottom-left-radius: 12px">
                  
                </div>
                <div style="width: 66%;padding-top: 30px; padding-bottom: 30px; padding-left: 54px; padding-right:54px; background: #F1F3F6; color: #00196E;">
                    <p> <i>Learn more about</i></p>
                    <p style="font-size: 40px; font-weight:900;">
                        PROJECTS
                    </p>
                    <p>
                        The FUV Makerspace encourages students to actively drive social change and positively impact local communities. To solve a need they identify in their communities, abroad or in their own countries, students independently initiate and develop initiatives according to their own interests and talents. Student-led projects provide an opportunity for leadership, personal growth, and hands-on learning while collaborating with others, being creative, and making a difference in the world.
                    </p>
                    <div class="d-flex justify-content-center">
                          <asp:Button runat="server" Text="Hearty Plant" CssClass="white-btn"/>
                    <asp:Button runat="server" Text="E-dap" CssClass="white-btn ml-5"/>
                    </div>
                  
                 
                </div>
                <div class="d-flex flex-column" style="width: 32%;">
                    <div style="background-color: #00196E; height: 40px; border-top-right-radius: 12px">


                    </div>
                    <div style="position: relative; background-color:#00196E" class="flex-grow-1">
                          <img src="Images/About_Project.png"  style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); width: 100%;" />
                  

                    </div>
                    <div style="background-color: #00196E; height: 40px;border-bottom-right-radius: 12px">


                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="d-flex" style="width:100%; min-height:200px;">
                 <div class="d-flex flex-column" style="width: 32%;">
                    <div style="background-color: #00196E; height: 40px; border-top-left-radius: 12px">


                    </div>
                    <div style="position: relative; background-color:#00196E" class="flex-grow-1">
                          <img src="Images/Makerspace_Cover.png"  style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); width: 100%;" />
                  

                    </div>
                    <div style="background-color: #00196E; height: 40px;border-bottom-left-radius: 12px">


                    </div>
                </div>
              
                <div style="width: 66%;padding-top: 30px; padding-bottom: 30px; padding-left: 54px; padding-right:54px; background: #F1F3F6; color: #00196E;">
                    <p> <i>Learn more about</i></p>
                    <p style="font-size: 40px; font-weight:900;">
                        PRODUCT GALLERY
                    </p>
                    <p>
                        Not sure what you need? Grab 60 minutes with us and we will work with you to understand your goals, and to develop a proposal and price estimate.
                    </p>
                    <asp:Button runat="server" Text="Submit Your Work" CssClass="white-btn"/>
                    <asp:Button runat="server" Text="Visit" CssClass="yellow-btn"/>
                 
                </div>
                  <div class="flex-grow-1" style="background-color: #00196E; border-top-right-radius: 12px; border-bottom-right-radius: 12px">
                  
                </div>
               
            </div>
        </div>

    </div>

    
</asp:Content>

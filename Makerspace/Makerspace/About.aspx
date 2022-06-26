<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Makerspace.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center" style="font-size:70px; font-weight:900;"> <span style="color:#00196E">Makerspace</span> <span style="color:#FFAD1D"> Information</span></h1>
    <div class= "cover-align" style="width:100vw; height: 500px; position:relative" >
        <asp:Image ID="cover" class="image-cover" src="Images/Makerspace_Cover.png" runat="server" style="height: 383px; position: absolute"/>
        <h3 style="width:60vw">Served for DST A Class: 9:45AM - 11:15AM</h3>
    </div>
    <div class="container about-page" style="width: 60vw">
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
                    <asp:Button runat="server" Text="Our Services" CssClass="yellow-btn"/>
                 
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
                          <img src="Images/Makerspace_Cover.png"  style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); width: 100%;" />
                  

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
                        Not sure what you need? Grab 60 minutes with us and we will work with you to understand your goals, and to develop a proposal and price estimate.
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
                        Not sure what you need? Grab 60 minutes with us and we will work with you to understand your goals, and to develop a proposal and price estimate.
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
                          <img src="Images/Makerspace_Cover.png"  style="display:block; position: absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%); width: 100%;" />
                  

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

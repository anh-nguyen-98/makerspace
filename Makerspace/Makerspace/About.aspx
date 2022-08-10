<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Makerspace.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class="jumbotron">
        <h1>Welcome to FUV Makerspace!</h1>
        <p class="lead">A great place to build your projects.</p>
        <p><a href="https://outlook.office365.com/owa/calendar/Makerspacebooking@fulbright.edu.vn/bookings/" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Resources</h2>
            <p>
                Makerspace provides you with free tools to build your projects. The categories include Mechanics, Electronics,
                Printing, Textile Fabrication. 
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Resource">View Resource &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Booking</h2>
            <p>
                Make a booking with our assitants to get support for your projects. 
            </p>
            <p>
                <a class="btn btn-default" href="https://outlook.office365.com/owa/calendar/Makerspacebooking@fulbright.edu.vn/bookings/">Make a booking &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Project Gallery</h2>
            <p>
                To be featured soon at Makerspace!
            </p>
        </div>
        <div class="col-md-4">
            <h2>Student Projects</h2>
            <p>
                See all ongoing student-led engineering projects here:
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/EngineeringProjectMain">View Student Engineering Projects &raquo</a>
            </p>
        </div>
        

    </div>
</asp:Content>

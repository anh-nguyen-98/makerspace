<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Makerspace._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome to FUV Makerspace!</h1>
        <p class="lead">A great place to build your projects.</p>
        <p><a href="https://outlook.office365.com/owa/calendar/Makerspacebooking@fulbright.edu.vn/bookings/" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
 
        <div class="col-md-4">
            <h2>Membership</h2>
            <p>
                Join us now. Makerspace is the best hub at FUV to start your ideas. Become our member to have full access
                to 
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Account/Register">Sign Up &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Project Gallery</h2>
            <p>
                View great products/ projects built at Makerspace.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Project">View Projects&raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Equipment</h2>
            <p>
                Makerspace provides you with free tools to build your projects. The categories include Mechanics, Electronics,
                Printing, Textile Fabrication. 
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Equipment">View Equipment &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Support</h2>
            <p>
                Make a booking with our assitants to get support for your project. 
            </p>
            <p>
                <a class="btn btn-default" href="https://outlook.office365.com/owa/calendar/Makerspacebooking@fulbright.edu.vn/bookings/">Make a booking&raquo;</a>
            </p>
        </div>
        

    </div>

</asp:Content>

<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Makerspace.Login" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mb-3"></div>
    <div style="width: 100%; height: 550px; background: #f0f2f5; display: flex; align-items: center; border-radius: 10px">
        <div style="width: 520px; margin-left: auto; margin-right:auto;">
            <div style="background: #00196E; text-align: center; border-top-left-radius: 12px; border-top-right-radius: 12px;" class="py-4">
                <span style="color: white; font-weight: 600; line-height: 36px; font-size: 28px;">Teaching Assistant Login</span>
            </div>
            <div style="padding-top:30px; padding-bottom:20px; padding-left: 50px; padding-right:50px; border-bottom-left-radius: 12px; border-bottom-right-radius: 12px;background: white">
                <div class="input-group">
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="input-label" ID="EmailLabel">Fulbright email</asp:Label>
                    <asp:TextBox runat="server" ID="Email" CssClass="input-box" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:Label runat="server" CssClass="text-small text-red p-1" ID="EmailErrorMessage"></asp:Label>
   
                </div>
                <div class="input-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="input-label" ID="PasswordLabel">Password</asp:Label>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password"  CssClass="input-box" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:Label runat="server" CssClass="text-small text-red" ID="PasswordErrorMessage"></asp:Label>
                   
                </div>

               
                <div style="display: flex; justify-content:right">
                    
                    <asp:Button runat="server" Text="Log in" OnClick="LogIn" CssClass="login-btn"/>
                </div>
                <div class="mt-3"
                     style="color: #8A95BC; font-weight:500; font-size:14px; letter-spacing: 0.1px">Note: Please contact admin if you forget your password.
                </div>

            </div>
        </div>
        
    </div>
    
</asp:Content>
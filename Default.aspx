﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UWS_Boiler_Plate._Default" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <div class="hero" title="homepage banner" role="img">
    </div>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>Your application home page.</h3>
        <p>The main page for your application.</p>
    </main>


</asp:Content>

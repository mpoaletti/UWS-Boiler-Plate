<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="UWS_Boiler_Plate.Contact" %>
<%@ Register TagPrefix="uc" TagName="ContactForm" Src="~/ContactForm.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <address>
            One Microsoft Way<br />
            Redmond, WA 98052-6399<br />
            <abbr title="Phone">P:</abbr>
            425.555.0100
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
        </address>
        
        <div class="container contact-form">
        <h3>Send Us a Message</h3>
        <uc:ContactForm ID="cfMessage" runat="server" />
        <asp:Button Text="Send" ID="btnSend" runat="server" OnClick="btnSend_Click" />
        <p>
            <asp:Label ID="lblOutput" runat="server"></asp:Label>
        </p>
        </div>

        <div class="container message-box">
            <h3>View Sent Message</h3>
            <p>Enter your name: </p><asp:TextBox runat="server" ID="txtName2" />
            <asp:Button Text="Retrieve Message" ID="btnRetrieve" runat="server" OnClick="btnRetrieve_Click" />
            <p>
                <asp:Label ID="lblMessages" runat="server"></asp:Label>
            </p>
        </div>
    </main>
</asp:Content>

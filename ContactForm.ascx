<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactForm.ascx.cs" Inherits="UWS_Boiler_Plate.ContactForm" %>
        <table>
            <tr>
                <td><strong>Name </strong></td>
                <td aria-label="Enter your name" >
                    <asp:TextBox runat="server" ID="txtName" ToolTip="Enter your name" />
                </td>
            </tr>
            <tr>
                <td><strong>Message </strong></td>
                <td aria-label="Enter your message">
                    <asp:TextBox runat="server" ID="txtMessage" TextMode="MultiLine" ToolTip="Enter your message"/>
                </td>
            </tr>
        </table>
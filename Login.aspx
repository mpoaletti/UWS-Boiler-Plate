<%@ Page Title="Login Page" ValidateRequest="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UWS_Boiler_Plate.Login" %>

<asp:Content ID ="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
                <h2>&nbsp;</h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;">
                <tr>
                    <td class="text-left" style="width: 268px;" rowspan="3">
                        <img alt="University of Wisconsin Logo" src="/Images/swooshLOGOrevSmall.jpg" style="width: 175px; height: 110px" />
                    </td>
                    <td class="text-right" style="width: 268px; height: 22px">
                        <asp:Label ID="lblUsername" runat="server" Font-Names="Montserrat" Text="Username:" Font-Bold="True" Visible="True"></asp:Label>
							&nbsp;</td>
                    </td>
                    <td style="height: 22px; width: 265px">
							<asp:TextBox ID="txtboxUsername" runat="server" Width="200px" CausesValidation="True" ValidateRequestMode="Enabled" Visible="True"></asp:TextBox>
					</td>
					<td style="height: 22px"></td>
                </tr>
                <tr>
					<td class="text-right" style="width: 268px">
						<asp:Label ID="lblPassword" runat="server" Font-Names="Montserrat" Text="Password:" Font-Bold="True" Visible="True"></asp:Label>
					</td>
					<td style="width: 265px">
						<asp:TextBox ID="txtboxPassword" runat="server" TextMode="Password" Width="200px" CausesValidation="True" ValidateRequestMode="Enabled" Visible="True"></asp:TextBox>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
					<td>
						<asp:Label ID="lblErrorMessage" runat="server" Visible="False"></asp:Label>
						<br />
						<asp:Button ID="btnResendVerify" runat="server" Font-Names="Montserrat" Text="ReSend Verif Code" OnClick="btnResendVerify_Click" Visible="False" Width="144px" />
						<asp:Button ID="btnCancel" runat="server" Font-Names="Montserrat" OnClick="btnCancel_Click" Text="Cancel" Visible="False" />
					</td>
                </tr>
                <tr>
					<td style="width: 268px; height: 35px;" class="text-right">
						<asp:Label ID="lblVerification" runat="server" Font-Names="Montserrat" Text="Enter Verification Code Sent to Phone Ending :" Font-Bold="True" Visible="False"></asp:Label>
						&nbsp;&nbsp;<asp:TextBox ID="txtboxVerificationCode" runat="server" Width="200px" CausesValidation="True" ValidateRequestMode="Enabled" Visible="False"></asp:TextBox>
						&nbsp;&nbsp; </td>
					<td style="width: 265px; height: 35px;" class="text-justify">
						<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Visible="True" />
						<br />
						<asp:Button ID="btnVerify" runat="server" Font-Names="Montserrat" Text="Verify" OnClick="btnVerify_Click" Visible="False" />
					</td>
					<td style="height: 35px"></td>
				</tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

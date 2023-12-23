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
            <asp:ListView ID="lvMessages" runat="server" DataSourceID="MessageDS" DataKeyNames="MessageID" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF; color: #284775;">
                        <td>
                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Message") %>' runat="server" ID="MessageLabel" /></td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #999999;">
                        <td>
                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Message") %>' runat="server" ID="MessageTextBox" /></td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Message") %>' runat="server" ID="MessageTextBox" /></td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF; color: #333333;">
                        <td>
                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Message") %>' runat="server" ID="MessageLabel" /></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                        <th runat="server"></th>
                                        <th runat="server">Name</th>
                                        <th runat="server">Message</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                                <asp:DataPager runat="server" ID="DataPager1">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                        <td>
                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Message") %>' runat="server" ID="MessageLabel" /></td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="MessageDS" ConnectionString="Data Source=uwsboilerplate.database.windows.net;Initial Catalog=uwsboilerplate;Persist Security Info=True;User ID=uwsboilerplate-server-admin;Password=NU2Y7YPNPEW6UQ72$" DeleteCommand="DELETE FROM [tblContactFormMessages] WHERE [MessageID] = @MessageID" InsertCommand="INSERT INTO [tblContactFormMessages] ([Name], [Message]) VALUES (@Name, @Message)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblContactFormMessages]" UpdateCommand="UPDATE [tblContactFormMessages] SET [Name] = @Name, [Message] = @Message WHERE [MessageID] = @MessageID">
                <DeleteParameters>
                    <asp:Parameter Name="MessageID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Message" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Message" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        </div>

    </main>
</asp:Content>

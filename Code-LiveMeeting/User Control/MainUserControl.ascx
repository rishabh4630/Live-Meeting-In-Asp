<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainUserControl.ascx.cs" Inherits="User_Control_MainUserControl" %>
<table border="0" cellpadding="2" cellspacing="1" style="width: 100%">
    <tr>
        <td align="left" style="background-color: #d7d9cb">
         <asp:Menu ID="Menu3" runat="server" Font-Bold="True" ForeColor="#666666" Height="17px"
                Width="1px" BackColor="#E3EAEB" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="12px" StaticSubMenuIndent="10px" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem ImageUrl="~/images/Calander.jpg" NavigateUrl="~/Registration/RegisterUser/frmUserCalendarHome.aspx"
                        ToolTip="Calendar"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/AddNewContact.png" NavigateUrl="~/Registration/RegisterUser/frmComposeMail.aspx"
                        ToolTip="Compose"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Inbox.png" NavigateUrl="~/Registration/RegisterUser/frmUserInbox.aspx" ToolTip=" Inbox"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Drafts.png" NavigateUrl="~/Registration/RegisterUser/frmUserDraftItems.aspx" ToolTip=" Drafts"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Trash.png" NavigateUrl="~/Registration/RegisterUser/frmUserDeletedMail.aspx" ToolTip=" Trash"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Sent.png" NavigateUrl="~/Registration/RegisterUser/frmUserSentItems.aspx" ToolTip=" Sent"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/SaveItem.bmp" NavigateUrl="~/Registration/RegisterUser/frmUserSavedItem.aspx" ToolTip=" Saved Item"></asp:MenuItem>
                </Items>
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                <DynamicMenuStyle BackColor="#E3EAEB" />
                <StaticSelectedStyle BackColor="#1C5E55" />
                <DynamicSelectedStyle BackColor="#1C5E55" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#666666" ForeColor="White" />
            </asp:Menu>
        </td>
        <td align="left" style="background-color: #d7d9cb">
            <asp:Label ID="lblCount" runat="server" Font-Bold="True" ForeColor="Maroon" Width="105px"></asp:Label></td>
    </tr>
</table>

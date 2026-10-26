<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>
<%@ Import Namespace="ASPNETChat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Live Meeting - Chat Room</title>
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
    <link href="App_Themes/Default.css" rel="stylesheet" type="text/css" />
</head>
<body onunload="Leave()">
    <form id="form1" runat="server">
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" class="bordermain" style="background-color:#D3E5ED">
  <tr>
    <td  valign="top" >
   <img src="images/BannerSLMail.jpg" alt="" />
   </td>
  </tr>
  <tr>
  <td valign="top" align="center">
   <table align="center" width="800">
                <tr>
                    <td align="center" width="50%">
                    <asp:Menu ID="Menu2" runat="server" Font-Bold="True" ForeColor="Maroon" Orientation="Horizontal" Width="300">
                            <Items>
                                <asp:MenuItem NavigateUrl="~/Registration/frmUserHomePage.aspx" Text="Home" Value="Home">
                                </asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </td>
                    <td align="center" valign="top" width="50%">
                        <asp:LinkButton ID="lnkLogout" runat="server" Font-Bold="True" ForeColor="Maroon" OnClick="lnkLogout_Click"
                            >Logout</asp:LinkButton></td>
                </tr>
            </table>
  </td>
  </tr>
  <tr>
    <td  height="395" valign="top">
       <input id="hdnRoomID" type="hidden" name="hdnRoomID" runat="server"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server"  EnablePartialRendering="True" EnablePageMethods="True">
            <Scripts>
                <asp:ScriptReference Path="scripts.js" />
            </Scripts>
        </asp:ScriptManager>
        
        
        <table cellpadding="0" cellspacing="0" width="800">
            <tr>
                <td width="80%">
                            <asp:textbox runat="server" TextMode="MultiLine" id="txt" rows="16" Columns="79" Height="260px" Width="678px" ></asp:textbox>&nbsp;
                    <br />
                   <asp:TextBox id="txtMsg" Width="400" Runat="server"></asp:TextBox>&nbsp;&nbsp; <input id="btn" onclick="button_clicked()" type="button" value="SEND" class="btn"/>
                </td>
                <td width="20%" rowspan="2" valign="top">
                    Room Members <br />
                            &nbsp;
                            
                            <asp:ListBox runat="server" Width="100" ID="lstMembers" Enabled="false" Height="249px"></asp:ListBox>
                    
                </td>
            </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td height="30" bgcolor="#E9713F" class="content" align="center" style="text-align: center; color:White" >
        Live Meeting All Right Reserved &copy; 2009</td>
  </tr>
</table>
       
        

        
    </form>
</body>
</html>

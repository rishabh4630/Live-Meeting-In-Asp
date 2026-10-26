<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"  AutoEventWireup="true" CodeFile="frmCalendar.aspx.cs" Inherits="Registration_RegisterUser_frmCalendar" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
      <asp:Label ID="lblAppointment" runat="server" Font-Bold="True" ForeColor="Blue"
            Width="62px"></asp:Label>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="right" colspan="5" style="font-weight: bold; color: #ffffff">
                    <asp:Button ID="btnBack" runat="server" Text="Back<<" Width="67px" OnClick="btnBack_Click" CausesValidation="False" /></td>
            </tr>
            <tr>
                <td colspan="5" style="font-weight: bold; color: black">
                    Please Select Date To Add Appointment</td>
            </tr>
            <tr>
                <td colspan="5">
                    &nbsp; &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:Calendar ID="Calendar1" runat="server" Height="251px" OnSelectionChanged="Calendar1_SelectionChanged"
                        Width="530px" BackColor="White" SelectedDate="2008-01-31" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" NextPrevFormat="ShortMonth">
                        <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        
                        </asp:Calendar>
                   </td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:Panel ID="Panel1" runat="server" Width="100%">
                        
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td colspan="3" style="font-weight: bold; color: black">
                                        Add Your Note Below</td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:TextBox ID="txtAppointment" runat="server" Height="188px" TextMode="MultiLine" Width="500px" ValidationGroup="g1"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAppointment"
                                            ErrorMessage="Require" Font-Bold="True" SetFocusOnError="True"
                                            ToolTip="Enter Appointment" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="3" style="font-weight: bold; color: black" valign="middle">
                                        Appointment Time:
                                        <asp:DropDownList ID="ddlTime1" runat="server" ValidationGroup="g1">
                                        </asp:DropDownList><asp:DropDownList ID="ddlTime2" runat="server">
                                            <asp:ListItem>AM</asp:ListItem>
                                            <asp:ListItem>PM</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTime1"
                                            ErrorMessage="Choose Time" Font-Bold="True" ForeColor="Maroon" InitialValue="Choose Time.." ValidationGroup="g1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Large"
                                            ForeColor="Maroon"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="119px" OnClick="btnSave_Click" ValidationGroup="g1" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="119px" OnClick="btnCancel_Click" CausesValidation="False" /></td>
                                </tr>
                            </table>
                        
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


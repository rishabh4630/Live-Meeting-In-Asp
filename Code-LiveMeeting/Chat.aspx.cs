using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using ASPNETChat;
using System.Web.Script.Services;
using System.Web.Script;
using System.Collections.Generic;
 
public partial class Chat : System.Web.UI.Page
{

    UserRegistrationBL registration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
            Response.Redirect("Default.aspx");
        
        txtMsg.Attributes.Add("onkeypress", "return clickButton(event,'btn')");
        if (!IsPostBack)
			{
                     hdnRoomID.Value = Request.QueryString["rid"];
                     ChatRoom room = ChatEngine.GetRoom(hdnRoomID.Value);
					string prevMsgs=room.JoinRoom(Session["UserName"].ToString(),Session["UserName"].ToString() );
                    txt.Text = prevMsgs;
                    foreach (string s in room.GetRoomUsersNames())
                    {
                        lstMembers.Items.Add(new ListItem(s, s));
                    }
					
			}
			
        	
    }
   

    #region Script Callback functions

    /// <summary>
    /// This function is called from the client script 
    /// </summary>
    /// <param name="msg"></param>
    /// <param name="roomID"></param>
    /// <returns></returns>
    [WebMethod]
    static public string SendMessage(string msg, string roomID)
    {
        try
        {
            ChatRoom room = ChatEngine.GetRoom(roomID);
            string res = "";
            if (room != null)
            {
                res = room.SendMessage(msg, HttpContext.Current.Session["UserName"].ToString());
            }
            return res;
        }
        catch (Exception ex)
        {

        }
        return "";
    }


    /// <summary>
    /// This function is called peridically called from the user to update the messages
    /// </summary>
    /// <param name="otherUserID"></param>
    /// <returns></returns>
    [WebMethod]
    static public string UpdateUser(string roomID)
    {
        try
        {
            ChatRoom room = ChatEngine.GetRoom(roomID);
            if (room != null)
            {
                string res = "";
                if (room != null)
                {
                    res = room.UpdateUser(HttpContext.Current.Session["UserName"].ToString());
                }
                return res;
            }
        }
        catch (Exception ex)
        {

        }
        return "";
    }


    /// <summary>
    /// This function is called from the client when the user is about to leave the room
    /// </summary>
    /// <param name="otherUser"></param>
    /// <returns></returns>
    [WebMethod]
    static public string LeaveRoom(string roomID)
    {
        try
        {
            ChatRoom room = ChatEngine.GetRoom(roomID);
            if (room != null)
                room.LeaveRoom(HttpContext.Current.Session["UserName"].ToString());
        }
        catch (Exception ex)
        {

        }
        return "";
    }


    /// <summary>
    /// Returns a comma separated string containing the names of the users currently online
    /// </summary>
    /// <param name="roomID"></param>
    /// <returns></returns>
    [WebMethod]
    static public string UpdateRoomMembers(string roomID)
    {
        try
        {
            ChatRoom room = ChatEngine.GetRoom(roomID);
            if (room != null)
            {
                IEnumerable<string> users=room.GetRoomUsersNames ();
                string res="";

                foreach (string  s in users)
	            {
                    res+=s+",";
		    	}
                return res;
            }
        }
        catch (Exception ex)
        {
        }
        return "";
    }
    #endregion

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        registration.LoginName = Session["UserName"].ToString();
        registration.LogoutDate = System.DateTime.Now.Date;
        registration.LogoutTime = System.DateTime.Now.ToShortTimeString();
        registration.InsertUserLogoutHistory();
        Session.Abandon();
        Session.Remove("UserName");
        Response.Redirect("~/Default.aspx");
    }
}

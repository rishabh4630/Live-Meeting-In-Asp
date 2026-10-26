if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbl_State_Master_tbl_Country_Master]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbl_State_Master] DROP CONSTRAINT FK_tbl_State_Master_tbl_Country_Master
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbl_Appointment_tbl_User_LoginAccount]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbl_Appointment] DROP CONSTRAINT FK_tbl_Appointment_tbl_User_LoginAccount
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbl_Draft_tbl_User_LoginAccount]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbl_Draft] DROP CONSTRAINT FK_tbl_Draft_tbl_User_LoginAccount
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbl_OfficialAddressBook_tbl_User_LoginAccount]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbl_OfficialAddressBook] DROP CONSTRAINT FK_tbl_OfficialAddressBook_tbl_User_LoginAccount
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbl_UserFullInformation_tbl_User_LoginAccount]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbl_UserFullInformation] DROP CONSTRAINT FK_tbl_UserFullInformation_tbl_User_LoginAccount
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbl_UserLoginHistory_tbl_User_LoginAccount]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbl_UserLoginHistory] DROP CONSTRAINT FK_tbl_UserLoginHistory_tbl_User_LoginAccount
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbl_UserLogoutHistory_tbl_User_LoginAccount]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbl_UserLogoutHistory] DROP CONSTRAINT FK_tbl_UserLogoutHistory_tbl_User_LoginAccount
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_CheckAdminValidity]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_CheckAdminValidity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_CheckUserAvailability]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_CheckUserAvailability]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_CheckUserValidity]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_CheckUserValidity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Check_PasswordInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Check_PasswordInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Chenge_AdminPassword]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Chenge_AdminPassword]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Appointment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Appointment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_City]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_City]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Country]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Country]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Feedback]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Feedback]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Income]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Income]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Industry]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Industry]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Intrest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Intrest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Mail_FromDraft]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Mail_FromDraft]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Mail_FromInbox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Mail_FromInbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Mail_FromSentItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Mail_FromSentItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Mail_Permanently]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Mail_Permanently]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_Occupation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_Occupation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_OfficialContact]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_OfficialContact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_PersonalContact]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_PersonalContact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_State]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_State]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Delete_UserLogin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Delete_UserLogin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Inser_UserAppointment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Inser_UserAppointment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_InsertFeedback]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_InsertFeedback]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_InsertIntrest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_InsertIntrest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_InsertUserLoginInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_InsertUserLoginInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_City]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_City]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_Country]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_Country]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_In_DraftItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_In_DraftItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_In_UserInbox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_In_UserInbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_Income]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_Income]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_Industry]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_Industry]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_Occupation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_Occupation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_RegistrationInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_RegistrationInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_State]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_State]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_UserLoginHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_UserLoginHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Insert_UserLogoutHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Insert_UserLogoutHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Restore_Mail_ToInbox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Restore_Mail_ToInbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Select_AllAppointmentDate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Select_AllAppointmentDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Select_MonthFromAppointmentDate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Select_MonthFromAppointmentDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Select_Name]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Select_Name]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Select_Password]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Select_Password]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Set_New_FeedbackCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Set_New_FeedbackCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Set_New_MailCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Set_New_MailCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_AllIncome]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_AllIncome]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_AllIndustry]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_AllIndustry]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_AllIntrest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_AllIntrest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_AllMailInbox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_AllMailInbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_AllOccupation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_AllOccupation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_All_DeletedMail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_All_DeletedMail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_All_DeletedMailFromSent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_All_DeletedMailFromSent]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_All_DraftItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_All_DraftItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_All_SentMail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_All_SentMail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_AppointmentByDate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_AppointmentByDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_AppointmentDate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_AppointmentDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Appointment_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Appointment_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_City]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_City]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_City_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_City_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Country]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Country]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Country_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Country_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_DraftItem_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_DraftItem_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Income_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Income_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Industry_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Industry_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Intrest_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Intrest_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_MessgaeInfo_For_Reply]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_MessgaeInfo_For_Reply]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Occupation_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Occupation_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_Saved_Items]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_Saved_Items]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_State]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_State]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_State_ById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_State_ById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_UserFeedback_Inbox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_UserFeedback_Inbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_UserFullFeedback]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_UserFullFeedback]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_UserFullMessage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_UserFullMessage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_UserInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_UserInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_UserLoginHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_UserLoginHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_UserLogoutHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_UserLogoutHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_UserMail_Inbox]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_UserMail_Inbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Show_User_ByDate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Show_User_ByDate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Appointment]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Appointment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_City]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_City]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Country]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Country]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_DraftItem_Status]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_DraftItem_Status]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Draft_Status]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Draft_Status]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Feedback_ReadingStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Feedback_ReadingStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Income]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Income]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Industry]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Industry]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Intrest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Intrest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_MailSaveStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_MailSaveStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Mail_ReadingStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Mail_ReadingStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_New_Password]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_New_Password]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Occupation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Occupation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_Password]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_Password]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_State]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_State]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_Update_UserProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_Update_UserProfile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sp_View_AllUserToAdmin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Sp_View_AllUserToAdmin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_AdminLogin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_AdminLogin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Appointment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Appointment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_City_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_City_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Country_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Country_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Draft]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Draft]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Feedback]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Feedback]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Inbox]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Inbox]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Income_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Income_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Industry_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Industry_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Interest_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Interest_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_Occupation_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_Occupation_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_OfficialAddressBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_OfficialAddressBook]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_State_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_State_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_UserFullInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_UserFullInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_UserLoginHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_UserLoginHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_UserLogoutHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_UserLogoutHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbl_User_LoginAccount]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbl_User_LoginAccount]
GO

CREATE TABLE [dbo].[tbl_AdminLogin] (
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Appointment] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DateOfAppointment] [datetime] NULL ,
	[Appointment] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AppointmentTime] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_City_Master] (
	[CityId] [int] IDENTITY (1, 1) NOT NULL ,
	[CityName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Description] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StateId] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Country_Master] (
	[CountryId] [int] IDENTITY (1, 1) NOT NULL ,
	[CountryName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Description] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Draft] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[From] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[To] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Subject] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FullMessage] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Date] [datetime] NULL ,
	[Attachement] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Size] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [tinyint] NULL ,
	[MailStatus] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SendStatus] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SaveStatus] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Feedback] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[From] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[To] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Subject] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Feedback] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Date] [datetime] NULL ,
	[Attachment] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Size] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MailStatus] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Inbox] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[From] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[To] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Subject] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FullMessage] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Date] [datetime] NULL ,
	[Attachement] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Size] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [tinyint] NULL ,
	[MailStatus] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SendStatus] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SaveStatus] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Income_Master] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Income] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Industry_Master] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[IndustryType] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Interest_Master] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Interest] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_Occupation_Master] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Occupation] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_OfficialAddressBook] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CompanyName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Country] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[State] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Pincode] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Phone] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MobileNo] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FaxNo] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Website] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_State_Master] (
	[StateId] [int] IDENTITY (1, 1) NOT NULL ,
	[StateName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Description] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CountryId] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_UserFullInformation] (
	[LoginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[State] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PinCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Country] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Phone] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DOB] [datetime] NULL ,
	[Gender] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Language] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Income] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Occupation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IndustryType] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Interest] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_UserLoginHistory] (
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginDate] [datetime] NULL ,
	[LoginTime] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_UserLogoutHistory] (
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LogoutDate] [datetime] NULL ,
	[LogoutTime] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_User_LoginAccount] (
	[LoginName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Question] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Answer] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [tinyint] NULL ,
	[Date] [datetime] NULL 
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_CheckAdminValidity

	(
	@LoginName varchar(50),
	@Password varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	SELECT     count(*)
	FROM         tbl_AdminLogin
	where LoginName=@LoginName and  Password=@Password 
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_CheckUserAvailability
	
	(
	@LoginName varchar(50)
	OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	select count(LoginName) from tbl_User_LoginAccount where LoginName=@LoginName and Active=1

	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_CheckUserValidity

	(
	@LoginName varchar(50),
	@Password varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	SELECT     count(*)
	FROM         tbl_User_LoginAccount
	where LoginName=@LoginName and  Password=@Password and Active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Check_PasswordInfo
	
	(
	@LoginName varchar(50),
	@Question varchar(100),
	@Answer varchar(80) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	select count(*) from tbl_User_LoginAccount where LoginName=@LoginName and Question=@Question and Answer=@Answer
	and Active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Chenge_AdminPassword
	
	(
	@LoginName varchar(50),
	@Password varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	update tbl_AdminLogin set Password=@Password where LoginName=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Appointment
	
	(
	@Id int,
	@LoginName varchar(50)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	DELETE FROM tbl_Appointment
	where LoginName=@LoginName and id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_City
	
	(
	@CityId int
 OUTPUT
	)
	
AS
	
	DELETE FROM tbl_Cityy_Master
	where Cityid=@Cityid

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Country
	
	(
	@CountryId int
 OUTPUT
	)
	
AS
	
	DELETE FROM tbl_Country_Master
	where Countryid=@Countryid


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Feedback
	(
	@Id int
	OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_feedback
	SET              Active = 0
	WHERE     Id = @Id  and active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Income
	
	(
	@Id int
 OUTPUT
	)
	
AS
	
	DELETE FROM tbl_Income_Master
	where id=@id

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Industry
	
	(
	@Id int
 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	DELETE FROM tbl_Industry_Master
	where id=@id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Intrest
	
	(
	@Id int
 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	DELETE FROM tbl_Interest_Master
	where id=@id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Mail_FromDraft
	(
	@Id int,
	@From varchar(100)
	OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Draft
	SET              Active = 0
	WHERE     Id = @Id AND [From]=@From and active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Mail_FromInbox	
	(
	@Id int,
	@To varchar(100)
	OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Inbox
	SET              Active = 0
	WHERE     Id = @Id AND [TO]=@To and active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Mail_FromSentItem	
	(
	@Id int,
	@From varchar(100)
	OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	delete from tbl_Inbox
	WHERE     Id = @Id AND [From]=@From and active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Mail_Permanently
	(
	@Id int,
	@To varchar(100)
	OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	delete from   tbl_Inbox
	WHERE     Id = @Id AND [TO]=@To and active=0
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_Occupation
	
	(
	@Id int
 OUTPUT
	)
	
AS
	
	DELETE FROM tbl_Occupation_Master
	where id=@id

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_OfficialContact
	
	(
	@Id int,
	@LoginName varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	DELETE FROM tbl_OfficialAddressBook
	where id=@Id and LoginName=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_PersonalContact
	
	(
	@Id int,
	@LoginName varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	DELETE FROM tbl_AddressBook
	where id=@Id and LoginName=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_State
	
	(
	@StateId int
 OUTPUT
	)
	
AS
	
	DELETE FROM tbl_State_Master
	where Stateid=@Stateid

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Delete_UserLogin
	
	(
	@LoginName varchar(50)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_User_LoginAccount
	SET              Active =0
	where LoginName=@LoginName and active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Inser_UserAppointment

	(
	@LoginName varchar(50),
	@DateOfAppointment datetime,
	@Appointment varchar(100),
	@AppointmentTime varchar(30) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Appointment
	                      (LoginName, DateOfAppointment, Appointment,AppointmentTime)
	VALUES     (@LoginName,@DateOfAppointment,@Appointment,@AppointmentTime)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_InsertFeedback
	(
	@From varchar(100),
	@To varchar(100),
	@Subject varchar(100),
	@Feedback varchar(200),
	@Date datetime,
	@Attachement varchar(50),
	@Size varchar(20)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_feedback
	                      ([From],[To], Subject, Feedback, Date,Attachment, Size, MailStatus, Active)
	VALUES     (@From,@To,@Subject,@Feedback,@Date,@Attachement,@Size,'New',1)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_InsertIntrest
	
	(
	@Intrest varchar(80)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Interest_Master
	                      (Interest)
	VALUES     (@Intrest)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_InsertUserLoginInfo
	
	(
	@LoginName varchar(50),
	@Password varchar(50),
	@Question varchar(100),
	@Answer varchar(80)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_User_LoginAccount
	                      (LoginName, Password, Question, Answer,Active,Date)
	VALUES     (@LoginName,@Password,@Question,@Answer,1,getdate())
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Insert_City
	
	(
	@Name varchar(50) ,
	@Description varchar(80),
	@StateId int OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_City_Master
	                      (CityName, Description, StateId)
	VALUES     (@Name,@Description,@StateId)
	RETURN



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Insert_Country
	
	(
	@Name varchar(50) ,
	@Description varchar(80) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Country_Master
	                      (CountryName, Description)
	VALUES     (@Name,@Description)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_In_DraftItem

	(
	@LoginName varchar(50),
	@From varchar(100),
	@To varchar(100),
	@Subject varchar(100),
	@FullMessage varchar(500),
	@Date datetime,
	@Attachement varchar(50),
	@Size varchar(20)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Draft
	                      (LoginName,[From],[To], Subject, FullMessage, Date,Attachement, Size, Active, MailStatus,SendStatus,SaveStatus)
	VALUES     (@LoginName,@From,@To,@Subject,@FullMessage,@Date,@Attachement,@Size,1,'New','Not Sent','Saved')
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_In_UserInbox

	(
	@LoginName varchar(50),
	@From varchar(100),
	@To varchar(100),
	@Subject varchar(100),
	@FullMessage varchar(500),
	@Date datetime,
	@Attachement varchar(50),
	@Size varchar(20),
	@SendStatus char(10)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Inbox
	                      (LoginName,[From],[To], Subject, FullMessage, Date,Attachement, Size, Active, MailStatus,SendStatus,SaveStatus)
	VALUES     (@LoginName,@From,@To,@Subject,@FullMessage,@Date,@Attachement,@Size,1,'New',@SendStatus,'Not Saved')
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_Income
	
	(
	@Income varchar(80)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Income_Master
	                      (Income)
	VALUES     (@Income)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_Industry
	
	(
	@Industry varchar(80)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Industry_Master
	                      (IndustryType)
	VALUES     (@Industry)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_Occupation
	
	(
	@Occupation varchar(80)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_Occupation_Master
	                      (Occupation)
	VALUES     (@Occupation)
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_RegistrationInfo

	(
	@LoginId varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@Address varchar(100),
	@City varchar(50),
	@State varchar(50),
	@PinCode varchar(10),
	@Country varchar(50),
	@Email varchar(50),
	@Phone varchar(20),
	@DOB datetime,
	@Gender varchar(10),
	@Language varchar(50),
	@Income varchar(50),
	@Occupation varchar(50),
	@IndustryType varchar(1000),
	@Interest varchar(300),
@Date datetime
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 

	INSERT INTO tbl_UserFullInformation
	                      (LoginId, FirstName, LastName, Address, City, State, PinCode, Country, Email, Phone, DOB, Gender, Language, Income, Occupation, 
	                      IndustryType, Interest,Date)
	VALUES     (@LoginId,@FirstName,@LastName,@Address,@City,@State,@PinCode,@Country,@Email,@Phone,@DOB,@Gender
	,@Language,@Income,@Occupation,@IndustryType,@Interest,@Date)
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Insert_State
	
	(
	@Name varchar(50) ,
	@Description varchar(80),
	@CountryId int OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_State_Master
	                      (StateName, Description, CountryId)
	VALUES     (@Name,@Description,@CountryId)
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_UserLoginHistory
	
	(
	@LoginName varchar(50),
	@LoginDate datetime,
	@LoginTime varchar(20)
OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_UserLoginHistory
	                      (LoginName, LoginDate, LoginTime)
	VALUES     (@LoginName,@LoginDate,@LoginTime)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Insert_UserLogoutHistory
	
	(
	@LoginName varchar(50),
	@LogoutDate datetime,
	@LogoutTime varchar(20)
OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	INSERT INTO tbl_UserLogoutHistory
	                      (LoginName, LogoutDate, LogoutTime)
	VALUES     (@LoginName,@LogoutDate,@LogoutTime)
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Restore_Mail_ToInbox	
	(
	@Id int,
	@To varchar(100)
	OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Inbox
	SET              Active = 1
	WHERE     Id = @Id AND [TO]=@To and active=0
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Select_AllAppointmentDate

	(
	@LoginName varchar(50),
	@Month int
	
	output
	)
	
AS
	/* SET NOCOUNT ON */ 
declare @Mon int 
set @Mon=(select  datepart(month,getdate()) from tbl_Appointment where LoginName=@LoginName)
		select dateofappointment,id from tbl_Appointment where LoginName=@LoginName
		and @Month=@Mon
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Select_MonthFromAppointmentDate

	(
	@LoginName varchar(50)
	output
	)
	
AS
	/* SET NOCOUNT ON */ 
		(select distinct datepart(month,dateofappointment) from tbl_Appointment where LoginName=@LoginName)
			

	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Select_Name
	
	(
	@LoginName varchar(50)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT     FirstName, LastName
	 FROM         tbl_UserFullInformation
	 where LoginId=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Select_Password 
	
	(
	@LoginName varchar(50),
	@Question varchar(100),
	@Answer varchar(80) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	select password from tbl_User_LoginAccount where LoginName=@LoginName and Question=@Question and Answer=@Answer 
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Set_New_FeedbackCount
	
	(
	@To varchar(100)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	select count(*) FROM         tbl_Feedback where [to]=@To and MailStatus='New' and Active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Set_New_MailCount
	
	(
	@To varchar(100)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	select count(*) FROM         tbl_Inbox where [to]=@To and MailStatus='New' and Active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_AllIncome
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     Id, Income
	FROM         tbl_Income_Master

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_AllIndustry
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     Id, IndustryType
	FROM         tbl_Industry_Master
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_AllIntrest
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     Id, Interest
	FROM         tbl_Interest_Master
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_AllMailInbox
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     [From], Subject, Date, Size
	FROM         tbl_Inbox
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_AllOccupation
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     Id, Occupation
	FROM         tbl_Occupation_Master

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_All_DeletedMail
	
    (

	@To varchar(100)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	
	SELECT     Attachement, [From], Subject, Date, Size,Id
	FROM         tbl_Inbox
	where [To]=@To and Active=0
	
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_All_DeletedMailFromSent
	
    (

	@LoginName varchar(100)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	
	SELECT     Attachement, [To], Subject, Date, Size,Id
	FROM         tbl_Inbox
	where LoginName=@LoginName and Active=0
	
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_All_DraftItem
	
	(
	@LoginName varchar(50)
 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	SELECT     [From], [To], Subject, Date, Size,Id
	FROM         tbl_Draft
	where LoginName=@LoginName and SendStatus='Not Sent' and SaveStatus='Saved' and Active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_All_SentMail
	
(

	@From varchar(100)
	 OUTPUT
)
	
AS
	/* SET NOCOUNT ON */ 
	
	SELECT     Attachement, [To], Subject, Date, Size,Id
	FROM         tbl_Inbox
	where [From] =@From  and Active=1
	
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_AppointmentByDate
	
	(
	 @DateOfAppointment datetime,
	 @LoginName varchar(50)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	SELECT     DateOfAppointment,Appointment,AppointmentTime,Id
	FROM         tbl_Appointment
	where  LoginName=@LoginName  and DateOfAppointment=@DateOfAppointment
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_AppointmentDate
(
	@LoginName varchar(50)
	output
	)
	
AS
	/* SET NOCOUNT ON */ 
		(select dateofappointment,id from tbl_Appointment where LoginName=@LoginName)
			

	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Show_Appointment_ById
	
	(
	@Id int,
	@LoginName varchar(30) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
declare @AppointmentTime varchar(30)
set @AppointmentTime=(select AppointmentTime FROM  tbl_Appointment where id=@Id and LoginName=@LoginName)
	
	if(@AppointmentTime>='10PM')
	begin
	SELECT     Appointment, substring(AppointmentTime,1,2)
	FROM         tbl_Appointment
	where id=@Id and LoginName=@LoginName
	end
	
	else
	if(@AppointmentTime >='10AM')
	begin
	SELECT     Appointment, substring(AppointmentTime,1,2)
	FROM         tbl_Appointment
	where id=@Id and LoginName=@LoginName
	end
	
	else
   if(@AppointmentTime <='9PM')
	begin
	SELECT     Appointment, substring(AppointmentTime,1,1)
	FROM         tbl_Appointment
	where id=@Id and LoginName=@LoginName
	end
	
	else	
	 if(@AppointmentTime<='9AM')
	begin
	SELECT     Appointment, substring(AppointmentTime,1,1)
	FROM         tbl_Appointment
	where id=@Id and LoginName=@LoginName
	end
	
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Show_City
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     CityId, CityName,Description
	FROM         tbl_City_Master
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_City_ById
	
	(
	@CityId int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT     CityName,Description
	 FROM         tbl_City_Master
	 where cityId=@cityId

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Show_Country 
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	SELECT     CountryId, CountryName,description
	FROM         tbl_Country_Master 
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_Country_ById
	
	(
	@CountryId int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT     CountryName,Description
	 FROM         tbl_Country_Master
	 where countryId=@countryId

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_DraftItem_ById

	(
	@Id int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT      [To], Subject, FullMessage, Attachement, Size
	 FROM         tbl_Draft
	 where Id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_Income_ById
	
	(
	@Id int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT     Income
	 FROM         tbl_Income_Master
	 where id=@Id

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_Industry_ById
	
	(
	@Id int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT     Industrytype
	 FROM         tbl_Industry_Master
	 where id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_Intrest_ById
	
	(
	@Id int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT     Interest
	 FROM         tbl_Interest_Master
	 where id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_MessgaeInfo_For_Reply
	
	(
	@Id int OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	SELECT     Subject, FullMessage
	FROM         tbl_Inbox where id=@Id and active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_Occupation_ById
	
	(
	@Id int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 SELECT    Occupation
	 FROM         tbl_Occupation_Master
	 where id=@Id

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_Saved_Items
	
	(
	@To varchar(50)
	 OUTPUT
	)
	
AS
	SELECT     Attachement, [From], Subject, Date, Size,Id
	FROM         tbl_Inbox
	where [To] =@To  and Active=1 and savestatus='Saved'
	
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Show_State 
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     tbl_State_Master.StateId, tbl_State_Master.StateName, tbl_State_Master.Description, tbl_Country_Master.CountryName
	FROM         tbl_State_Master INNER JOIN
	                      tbl_Country_Master ON tbl_State_Master.CountryId = tbl_Country_Master.CountryId
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_State_ById
	
	(
	@StateId int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	SELECT     tbl_State_Master.StateName, tbl_State_Master.Description, tbl_Country_Master.CountryName
	FROM         tbl_State_Master INNER JOIN
	                      tbl_Country_Master ON tbl_State_Master.CountryId = tbl_Country_Master.CountryId
	 where StateId=@StateId


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_UserFeedback_Inbox
	
	(

	@To varchar(100)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	
	SELECT     Attachment, [From], Subject, Date, Size,Id
	FROM         tbl_Feedback
	where [To] =@To  and Active=1
	
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_UserFullFeedback
	
	(

	@To varchar(100),
	@Id int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	
	SELECT     Feedback,Attachment
	FROM         tbl_feedback
	where [To] =@To  and Active=1 and Id=@Id
	
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_UserFullMessage
	
	(

	@To varchar(100),
	@Id int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	
	SELECT     FullMessage,Attachement
	FROM         tbl_Inbox
	where [To] =@To  and Active=1 and Id=@Id
	
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_UserInfo
	
	(
	@LoginName varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	SELECT     FirstName, LastName, Address, City, State, PinCode, Country, Email, Phone, DOB, Gender, Language, Income, Occupation, IndustryType, 
	                      Interest
	FROM         tbl_UserFullInformation
	where LoginId=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_UserLoginHistory
	
	(
	@Date datetime,
	@Date1 datetime
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	SELECT    LoginName, LoginDate,LoginTime
	FROM         tbl_UserLoginHistory 
	where LoginDate between @Date and @Date1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_UserLogoutHistory
	
	(
	@Date datetime,
	@Date1 datetime
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	select LoginName,LogoutDate,LogoutTime from tbl_userlogouthistory
	where LogoutDate between @Date and @Date1
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_UserMail_Inbox
	
	(

	@To varchar(100)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	
	SELECT     Attachement, [From], Subject, Date, Size,Id
	FROM         tbl_Inbox
	where [To] =@To  and Active=1 and SaveStatus='Not Saved'
	
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Show_User_ByDate
	
	(
	@Date datetime,
	@Date1 datetime OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	SELECT     LoginId, FirstName,Gender,Address,City,State,Country
	FROM       tbl_UserFullInformation
	      where  date between @Date and @Date1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Appointment
	
	(
	@Id int,
	@LoginName varchar(50),
	@DateOfAppointment datetime,
	@Appointment varchar(100),
	@AppointmentTime varchar(30) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Appointment
	SET             DateOfAppointment = @DateOfAppointment, Appointment = @Appointment,AppointmentTime=@AppointmentTime
	where LoginName=@LoginName and Id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Update_City

	(
	@CityId int,
	@CityName varchar(50),
	@Description varchar(80)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_City_Master
	SET              CityName =@CityName, Description =@Description
	where CityId=@CityId
	RETURN


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Update_Country

	(
	@CountryId int,
	@CountryName varchar(50),
	@Description varchar(80)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Country_Master
	SET              CountryName =@CountryName, Description =@Description
	where countryid=@CountryId
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_DraftItem_Status
	
	(
	@Id int,
	@LoginName varchar(50)
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	update tbl_Draft set SendStatus='Sent' where SendStatus='Not Sent' and active=1 and id=@Id
	and LoginName=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Draft_Status
	(
	@LoginName varchar(50),
	@To varchar(100)
 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 UPDATE    tbl_Inbox
	 SET              SavDraftStatus ='Saved' where [to]=@To and SavDraftStatus ='NotSaved' and active=1 and LoginName=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Feedback_ReadingStatus
	
	(
	@Id int,
	@To varchar(100)
 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 UPDATE    tbl_Feedback
	 SET              MailStatus ='Read' where [to]=@To and MailStatus ='New' and active=1 and id=@Id
	RETURN
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Income
	
	(
	@Id int,
	@Income varchar(80) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Income_Master
	SET              Income =@Income
	where Id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Industry
	
	(
	@Id int,
	@Industry varchar(80) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Industry_Master
	SET              IndustryType =@Industry
	where Id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Intrest
	
	(
	@Id int,
	@Intrest varchar(80) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Interest_Master
	SET              Interest =@Intrest
	where Id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_MailSaveStatus
	
	(
	@Id int,
	@To varchar(50)OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Inbox
	SET     savestatus='Saved' where savestatus='Not Saved' and [To]=@To and Id=@Id and Active=1         
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Mail_ReadingStatus
	
	(
	@Id int,
	@To varchar(100)
 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */
	 UPDATE    tbl_Inbox
	 SET              MailStatus ='Read' where [to]=@To and MailStatus ='New' and active=1 and id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_New_Password

	(
	@LoginName varchar(50),
	@Password varchar(50),
	@Question varchar(100),
	@Answer varchar(80)
	  OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_User_LoginAccount
	SET              Password =@Password where LoginName=@LoginName and Question=@Question and Answer=@Answer
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Update_Occupation
	
	(
	@Id int,
	@Occupation varchar(80) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_Occupation_Master
	SET              Occupation =@Occupation
	where Id=@Id
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_Password 
	
	(
	@LoginName varchar(50),
	@Password varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_User_LoginAccount
	SET              Password =@Password where LoginName=@LoginName
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.Sp_Update_State

	(
	@StateId int,
	@StateName varchar(50),
	@Description varchar(80),
	@CountryId int
	 OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_State_Master
	SET         StateName =@StateName, Description =@Description,Countryid=@CountryId
	where StateId=@StateId
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_Update_UserProfile
	
	(
	@LoginId varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@Address varchar(100),
	@City varchar(50),
	@State varchar(50),
	@PinCode varchar(10),
	@Country varchar(50),
	@Email varchar(50),
	@Phone varchar(20),
	@DOB datetime,
	@Gender varchar(10),
	@Language varchar(50),
	@Income varchar(50),
	@Occupation varchar(50),
	@IndustryType varchar(1000),
	@Interest varchar(300)OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_UserFullInformation
	SET              FirstName =@FirstName, LastName =@LastName, Address =@Address, City =@City, 
	State =@State,PinCode =@PinCode, Country =@Country, Email =@Email, Phone =@Phone,
	 DOB =@DOB, Gender =@Gender, Language =@Language, Income =@Income, 
	                      Occupation =@Occupation, IndustryType =@IndustryType, Interest =@Interest
	                      where LoginId=@LoginId
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.Sp_View_AllUserToAdmin
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT     tbl_User_LoginAccount.LoginName, tbl_UserFullInformation.FirstName, tbl_UserFullInformation.Phone
	FROM         tbl_User_LoginAccount INNER JOIN
	                      tbl_UserFullInformation ON tbl_User_LoginAccount.LoginName = tbl_UserFullInformation.LoginId
	                      and active=1
	RETURN

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public class UserController
    {
        public static DataSet GetUserAddress(string username)
        {
            SqlParameter p = new SqlParameter("@username", username);
            return(SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(),CommandType.StoredProcedure,"spGetUserAddress",p));
        }

        public static int RegisterUser(string username, string password, string hintquestion, string answer, string firstname,string lastname,string email,string empid,string contact,string designation)
        {
            SqlParameter []p= new SqlParameter[10];
            p[0] = new SqlParameter("@FName", firstname);
            p[1] = new SqlParameter("@LName", lastname);
            p[2] = new SqlParameter("@Email", email);
            p[3] = new SqlParameter("@EmpID", empid);
            p[4] = new SqlParameter("@Designation", designation);
            p[5] = new SqlParameter("@ContactNo", contact);
            p[6] = new SqlParameter("@UName", username);
            p[7] = new SqlParameter("@Password", password);
            p[8] = new SqlParameter("@Question", hintquestion);
            p[9] = new SqlParameter("@Answer", answer);
            return (int.Parse(SqlHelper.ExecuteScalar(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spRegisterUser", p).ToString()));
        }

        public static int AuthenticateUser(string username, string password)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@UName", username);
            p[1] = new SqlParameter("@Password", password);
            return (int.Parse(SqlHelper.ExecuteScalar(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spAuthenticateUser", p).ToString()));
        }

        public static int GetUserCountByUsername(string username)
        {
            SqlParameter p = new SqlParameter("@UName", username);
            return (int.Parse(SqlHelper.ExecuteScalar(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetUserCountByUsername", p).ToString()));
        }

        public static string GetRoleByUsername(string username)
        {
            SqlParameter p = new SqlParameter("@UName", username);
            return (SqlHelper.ExecuteScalar(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetRoleByUsername", p).ToString());
        } 
    }
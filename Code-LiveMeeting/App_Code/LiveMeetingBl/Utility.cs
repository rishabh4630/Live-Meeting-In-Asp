using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public class Utility
    {
        public static DataSet GetAllCountries()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllCountries"));
        }
        public static DataSet GetAllStates()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllStates"));
        }
        public static DataSet GetAllStatesByCountryID(int CountryID)
        {
            SqlParameter p = new SqlParameter("@CountryID", CountryID);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllStatesByCountryID", p));
        }
        public static DataSet GetAllCities()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllCities"));
        }
        public static DataSet GetAllCitiesByStateID(int StateID)
        {
            SqlParameter p = new SqlParameter("@StateID", StateID);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllCitiesByStateID", p));
        }
        public static DataSet GetAllHintQuestion()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllHintQuestion"));
        }
        public static DataSet GetAllMenuByParentID(int ParentID)
        {
            SqlParameter p = new SqlParameter("@ParentID", ParentID);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllMenuByParentID",p));
        }
        public static DataSet GetAllMenu()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "spGetAllMenu"));
        }
    }
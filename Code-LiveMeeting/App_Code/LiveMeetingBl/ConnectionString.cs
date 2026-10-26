using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Data.SqlClient;
static class ConnectionString
{
    public static string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["CONSTR"].ConnectionString;
    }
}
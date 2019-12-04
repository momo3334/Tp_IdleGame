using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD_IdleGame2
{
    class SQLExecuter
    {
        SqlConnection m_cnx;

        public SQLExecuter()
        {
            String connectionString = "Server=J-C236-OL-11;Database=BD_IdleGame;User Id=sa;Password = Fgds5612; ";
            this.m_cnx = new SqlConnection(connectionString);
        }

        public String executeSpin(int p_charID, String p_actionString)
        {
            SqlCommand cmd = new SqlCommand("spSpin", this.m_cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CharID", p_charID);

            SqlParameter returnString = new SqlParameter("@actionString", SqlDbType.NVarChar, 2048);
            returnString.Value = p_actionString;
            returnString.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(returnString);

            m_cnx.Open();
            cmd.ExecuteNonQuery();
            p_actionString = (string) cmd.Parameters["@actionString"].Value;
            m_cnx.Close();

            return p_actionString;
        }
    }
}

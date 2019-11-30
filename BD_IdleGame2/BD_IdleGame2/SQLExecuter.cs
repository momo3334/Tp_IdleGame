using System;
using System.Collections.Generic;
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

        public void executeProc()
        {
            String sql = "SELECT * FROM fnSpin()";
            SqlDataReader dataReader;

            m_cnx.Open();
            SqlCommand cmd = new SqlCommand(sql, this.m_cnx);

            dataReader = cmd.ExecuteReader();

            while (dataReader.Read())
            {
                Debug.WriteLine(dataReader.GetValue(0) + "" +  dataReader.GetValue(1));
            }
            m_cnx.Close();
        }
    }
}

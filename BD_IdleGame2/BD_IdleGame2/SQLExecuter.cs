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
            String connectionString = "Server=DESKTOP-8JAK1AT;Database=BD_IdleGame;User Id=sa;Password = Fgds5612; ";
            //String connectionString = "Server=J-C236-OL-11;Database=BD_IdleGame;User Id=sa;Password = Fgds5612; ";
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

            Debug.WriteLine(p_actionString);

            return p_actionString;
        }

        //Executes a scalar Function with parameters
        public int executeScalFunc(String p_funName, List<sqlParameter> p_params)
        {
            String functionString = createFuncString(p_funName, p_params);

            SqlCommand cmd = new SqlCommand(functionString, this.m_cnx);

            //Adding the parameters received as arguments to the parameters array of the SqlCommand
            for (int i = 0; i < p_params.Count; i++)
            {
                sqlParameter p = p_params.ElementAt(i);
                SqlParameter param = new SqlParameter();
                param.ParameterName = p.Name;
                int paramValue = 0;
                if (!(Int32.TryParse(p.Value, out paramValue)))
                {
                    param.Value = p.Value;
                }
                param.Value = paramValue;
                cmd.Parameters.Add(param);
            }

            this.m_cnx.Open();
            int resultInt = Convert.ToInt32(cmd.ExecuteScalar());
            this.m_cnx.Close();

            return resultInt;
        }

        //Executes a procedure with parameters that returns a table
        public DataTable executeFuncTable(String p_funcName, List<sqlParameter> p_params)
        {
            String functionString = createTableFuncString(p_funcName, p_params);

            SqlCommand cmd = new SqlCommand(functionString, this.m_cnx);
            cmd.CommandType = CommandType.Text;
            //Adding the parameters received as arguments to the parameters array of the SqlCommand
            for (int i = 0; i < p_params.Count; i++)
            {
                sqlParameter p = p_params.ElementAt(i);
                SqlParameter param = new SqlParameter();
                param.ParameterName = p.Name;
                int paramValue = 0;
                if (!(Int32.TryParse(p.Value, out paramValue)))
                {
                    param.Value = p.Value;
                }
                param.Value = paramValue;
                cmd.Parameters.Add(param);
            }


            DataTable returnTable = new DataTable();
            this.m_cnx.Open();
            SqlDataReader dataReader = cmd.ExecuteReader();
            returnTable.Load(dataReader);
            this.m_cnx.Close();
            

            

            return returnTable;
        }

        //Parses a function string and returns the result
        private String createFuncString(String p_funName, List<sqlParameter> p_params)
        {
            String funcString = "";
            funcString = "SELECT " + p_funName + "(";

            for (int i = 0; i < p_params.Count; i++)
            {
                sqlParameter p = p_params.ElementAt(i);

                funcString += p.Name;
                if (i == p_params.Count - 1)
                {
                    funcString += ")";
                }
                else
                {
                    funcString += ", ";
                }
            }
            return funcString;
        }

        //Parses a function string for table function and returns the result
        private String createTableFuncString(String p_funName, List<sqlParameter> p_params)
        {
            String funcString = "";
            funcString = "SELECT * FROM " + p_funName + "(";

            for (int i = 0; i < p_params.Count; i++)
            {
                sqlParameter p = p_params.ElementAt(i);

                funcString += p.Name;
                if (i == p_params.Count - 1)
                {
                    funcString += ")";
                }
                else
                {
                    funcString += ", ";
                }
            }
            return funcString;
        }



        //Parses a procedure string and returns the result
        private String createProcString(String p_procName, List<sqlParameter> p_params)
        {
            String procString = "";
            procString = "SELECT " + p_procName ;

            for (int i = 0; i < p_params.Count; i++)
            {
                sqlParameter p = p_params.ElementAt(i);

                procString += p.Name;
                if (i == p_params.Count - 1)
                {
                    procString += ")";
                }
                else
                {
                    procString += ", ";
                }
            }
            return procString;
        }
    }
}

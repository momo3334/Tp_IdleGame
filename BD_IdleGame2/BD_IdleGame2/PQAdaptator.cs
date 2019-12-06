using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD_IdleGame2
{
    class PQAdaptor
    {
        SQLExecuter m_executer;
        int m_currentCharID;
        DataTable m_table;

        public PQAdaptor()
        {
            this.m_currentCharID = 1;
            this.m_executer = new SQLExecuter();
        }

        public object[] spin(int p_changed)
        {
            return m_executer.executeSpin(1, "", p_changed);
        }

        public int temp()
        {
            List<sqlParameter> parameters = new List<sqlParameter>();

            sqlParameter param = new sqlParameter();
            param.Name = "@CharID";
            param.Value = "1";

            parameters.Add(param);
            return m_executer.executeScalFunc("dbo.fnGetCharGoldPiece", parameters);
        }


        public DataTable getCurrentQuests(int p_charID)
        {
            List<sqlParameter> parameters = new List<sqlParameter>();

            sqlParameter param = new sqlParameter();
            param.Name = "@CharID";
            param.Value = p_charID.ToString();

            parameters.Add(param);
            DataTable dataTable = m_executer.executeFuncTable("dbo.fnGetAllCharQuestsFromID", parameters);
            return dataTable;
        }

        public DataTable getCurrentStats(int p_charID)
        {
            List<sqlParameter> parameters = new List<sqlParameter>();

            sqlParameter param = new sqlParameter();
            param.Name = "@CharID";
            param.Value = p_charID.ToString();

            parameters.Add(param);
            DataTable dataTable = m_executer.executeFuncTable("dbo.fnGetCharFromID", parameters);
            return dataTable;
        }

        public object[] getCurrentMonsterHP(int p_charID, int p_currrentHP, int p_maxHP)
        {
            return m_executer.getCurrentMonsterHP(p_charID, p_currrentHP, p_maxHP);
        }
    }
}

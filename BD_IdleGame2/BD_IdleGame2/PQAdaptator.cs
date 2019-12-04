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

        public String spin()
        {
            return m_executer.executeSpin(1, "");
        }
    }
}

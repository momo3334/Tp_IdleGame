﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BD_IdleGame2
{
    static class Program
    {
        /// <summary>
        /// Point d'entrée principal de l'application.
        /// </summary>
        [STAThread]

        

        static void Main()
        {
            PQAdaptor m_adaptor = new PQAdaptor();
            Debug.WriteLine(m_adaptor.spin());
            Debug.WriteLine(m_adaptor.spin());
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new IdleGameGUI());
        }
    }
}

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BD_IdleGame2
{
    struct sqlParameter
    {
        public string Name;
        public string Value;
    }

    //Enum that defines what values have changed and therefore need to be updated on the form
    public enum valueChanged { quest = 0, inventaire = 1, stats = 2, statsMonstre = 3}

    static class Program
    {
        /// <summary>
        /// Point d'entrée principal de l'application.
        /// </summary>
        [STAThread]

        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new IdleGameGUI());
        }

    }
}

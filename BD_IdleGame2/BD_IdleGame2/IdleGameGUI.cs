using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BD_IdleGame2
{
    public partial class IdleGameGUI : Form
    {
        PQAdaptor m_adaptor;
        Thread m_simulation;
        public IdleGameGUI()
        {
            InitializeComponent();
            this.m_adaptor = new PQAdaptor();
            this.m_simulation = new Thread(new ThreadStart(Spin));

            this.pgrbHealt.Value = 100;

            lsvQuest.Columns.Add("Quêtes", 240, HorizontalAlignment.Left);
            lsvQuest.Columns.Add("Status", -2, HorizontalAlignment.Right);
        }

        public void Spin()
        {
            MethodInvoker refresh;
            

            MethodInvoker updateTimer;

            long currentTime = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
            long prevTime = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
            long deltaTime = 0;


            int progress = 0;
            while (true)
            {
                currentTime = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;


                deltaTime = currentTime - prevTime;

                if (deltaTime >= 1000)
                {
                    Debug.WriteLine("Tick");
                    int changed = 5;

                    object[] returnedObj = m_adaptor.spin(changed);

                    String actionString = returnedObj[0].ToString();
                    changed = Convert.ToInt32(returnedObj[1]);

                    refresh = delegate { refreshGUI(actionString, changed); };
                    this.Invoke(refresh);
                    prevTime = currentTime;
                }

                int progression = (int)(((double)deltaTime / 1000.0) * 100);
                
                updateTimer = delegate { updateProgressBar(progression); };
                this.Invoke(updateTimer);
                progress++;
            }
        }

        public void updateProgressBar(int prog)
        {
            if (prog < 100)
            {
                if (prog + 1 > pgrbProgression.Maximum)
                {
                    pgrbProgression.Value = 0;
                    pgrbProgression.Refresh();
                }
                else
                {
                    pgrbProgression.Value = prog + 1;
                    pgrbProgression.Value -= 1;
                    pgrbProgression.Refresh();
                }
            }
        }

        public void refreshGUI(String p_actionString,int p_changed)
        {
            valueChanged changed = (valueChanged) p_changed;
            DataTable dataTable;

            lsvLog.Items.Add(p_actionString);
            lsvLog.TopIndex = lsvLog.Items.Count - 1;
            switch (changed)
            {
                case valueChanged.quest:
                    dataTable = m_adaptor.getCurrentQuests(1);
                    foreach (DataRow row in dataTable.Rows)
                    {
                        String questName = "";
                        questName = row[0].ToString();

                        ListViewItem newItem = new ListViewItem(questName);

                        String completed = row[1].ToString();
                        if (completed == "True")
                        {
                            completed = "Completée";
                        }
                        else
                        {
                            completed = "En cours";
                        }
                        newItem.SubItems.Add(completed);

                        ListViewItem test = lsvQuest.FindItemWithText(questName);
                        if (test == null)
                        {
                            lsvQuest.Items.Add(newItem);
                            Console.WriteLine(questName);
                        }
                        else
                        {
                            if (test.SubItems[1].Text != completed)
                            {
                                test.SubItems[1].Text = completed;
                            }
                        }
                    }
                    break;
                case valueChanged.inventaire:
                    break;
                case valueChanged.stats:
                    dataTable = m_adaptor.getCurrentStats(1);
                    int columnHP = dataTable.Columns.IndexOf("CharHP");
                    int columnMaxHP = dataTable.Columns.IndexOf("CharMaxHP");
                    int columnStrenght = dataTable.Columns.IndexOf("CharStr");
                    int columnDex = dataTable.Columns.IndexOf("CharDex");
                    int columnCon = dataTable.Columns.IndexOf("CharCon");
                    double currentHP;
                    double maxHP;
                    double strenght;
                    double dex;
                    double con;
                    Double.TryParse(dataTable.Rows[0][columnHP].ToString(), out currentHP);
                    Double.TryParse(dataTable.Rows[0][columnMaxHP].ToString(), out maxHP);
                    Double.TryParse(dataTable.Rows[0][columnStrenght].ToString(), out strenght);
                    Double.TryParse(dataTable.Rows[0][columnDex].ToString(), out dex);
                    Double.TryParse(dataTable.Rows[0][columnCon].ToString(), out con);

                    int hpPercent = (int)((currentHP / maxHP) * 100);

                    lblStr.Text = strenght.ToString();
                    lblDex.Text = dex.ToString();
                    lblConst.Text = con.ToString();

                    pgrbHealt.Value = hpPercent;
                    pgrbHealt.Refresh();


                    break;
                case valueChanged.statsMonstre:
                    int monsterCurrentHP = 0;
                    int monsterMaxHP = 0;
                    object[] monsterHPValues = m_adaptor.getCurrentMonsterHP(1, monsterCurrentHP, monsterMaxHP);

                    monsterCurrentHP = Convert.ToInt32(monsterHPValues[0]);
                    monsterMaxHP = Convert.ToInt32(monsterHPValues[1]);



                    if (monsterMaxHP > 0)
                    {
                        int MonsterHpPercent = (int)(((double)monsterCurrentHP / (double)monsterMaxHP) * 100.0);
                        pgrbMonsterHP.Value = MonsterHpPercent;
                    }
                    else
                    {
                        pgrbMonsterHP.Value = 0;
                    }

                    Console.WriteLine(monsterCurrentHP);
                    Console.WriteLine(monsterMaxHP);
                    break;
                default:
                    break;
            }
            
            //lblWeight.Text = "12";
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            this.m_simulation.Start();
        }
    }
}

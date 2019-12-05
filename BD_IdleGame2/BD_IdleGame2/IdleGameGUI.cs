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

            
            lsvQuest.Columns.Add("Quêtes", 240, HorizontalAlignment.Left);
            lsvQuest.Columns.Add("Status", -2, HorizontalAlignment.Right);
        }

        public void Spin()
        {
            MethodInvoker refresh;
            refresh = delegate { refreshGUI(); };

            MethodInvoker updateTimer;

            long currentTime = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
            long prevTime = 0;
            long deltaTime = 0;

            long deltaProgress = 0;
            long prevProgressTime = 0;

            while (true)
            {
                currentTime = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;


                deltaTime = currentTime - prevTime;
                deltaProgress = currentTime - prevProgressTime;


                if (deltaProgress >= 3 )
                {
                    updateTimer = delegate { updateProgressBar(); };
                    this.Invoke(updateTimer);
                    prevProgressTime = currentTime;
                }

                
                

                if (deltaTime >= 3000)
                {
                    this.Invoke(refresh);
                    prevTime = currentTime;
                    m_adaptor.spin();
                }





            }
        }

        public void updateProgressBar()
        {
            if (pgrbProgression.Value + 2 > pgrbProgression.Maximum)
            {
                pgrbProgression.Value = 0;
                pgrbProgression.Refresh();
            }
            else
            {
                pgrbProgression.Value += 2;
                pgrbProgression.Value -= 1;
                pgrbProgression.Refresh();
            }
            
        }

        public void refreshGUI()
        {
            DataTable dataTable = m_adaptor.getCurrentQuests(1);

            ////IMGLIST TO HOLD IMGS
            //ImageList imgs = new ImageList();
            //imgs.ImageSize = new Size(50, 50);

            ////LOAD IMGS FROM FILE. SPECIFY YOUR PATH FOR IMAGES
            //imgs.Images.Add(Image.FromFile(@"..\..\CheckMark.png"));

            ////BIND IMGS TO LISTVIEW
            //lsvQuest.SmallImageList = imgs;
            //ListViewItem newItem = new ListViewItem("test", 0);
            //lsvQuest.Items.Add(newItem);


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

            }
            //lblWeight.Text = "12";
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            this.m_simulation.Start();
        }
    }
}

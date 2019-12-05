using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
            while (true)
            {
                refresh = delegate { refreshGUI(); };
                this.Invoke(refresh);

                Thread.Sleep(1000);

                
                //m_adaptor.spin();
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
                String temp = "";
                temp = row[0].ToString();

                ListViewItem newItem = new ListViewItem(temp);
                newItem.SubItems.Add(row[1].ToString());
                ListViewItem test = lsvQuest.FindItemWithText(temp);
                if (test == null)
                {
                    lsvQuest.Items.Add(newItem);
                    Console.WriteLine(temp);
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

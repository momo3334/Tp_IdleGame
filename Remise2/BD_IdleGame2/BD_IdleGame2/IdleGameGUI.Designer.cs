namespace BD_IdleGame2
{
    partial class IdleGameGUI
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.lsvQuest = new System.Windows.Forms.ListView();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.lsvInventory = new System.Windows.Forms.ListView();
            this.pgrbEncombrement = new System.Windows.Forms.ProgressBar();
            this.label4 = new System.Windows.Forms.Label();
            this.lblWeight = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.pgrbProgression = new System.Windows.Forms.ProgressBar();
            this.button1 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.pgrbHealt = new System.Windows.Forms.ProgressBar();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.pgrbXp = new System.Windows.Forms.ProgressBar();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.lblStr = new System.Windows.Forms.Label();
            this.lblDex = new System.Windows.Forms.Label();
            this.lblConst = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.pgrbMonsterHP = new System.Windows.Forms.ProgressBar();
            this.lsvLog = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(18, 674);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(236, 26);
            this.label1.TabIndex = 1;
            this.label1.Text = "Journal de l\'aventure";
            // 
            // lsvQuest
            // 
            this.lsvQuest.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold);
            this.lsvQuest.HideSelection = false;
            this.lsvQuest.Location = new System.Drawing.Point(22, 51);
            this.lsvQuest.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.lsvQuest.Name = "lsvQuest";
            this.lsvQuest.Size = new System.Drawing.Size(550, 516);
            this.lsvQuest.TabIndex = 2;
            this.lsvQuest.UseCompatibleStateImageBehavior = false;
            this.lsvQuest.View = System.Windows.Forms.View.Details;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(16, 14);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(97, 31);
            this.label2.TabIndex = 3;
            this.label2.Text = "Quêtes";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(789, 14);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(134, 31);
            this.label3.TabIndex = 5;
            this.label3.Text = "Inventaire";
            // 
            // lsvInventory
            // 
            this.lsvInventory.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold);
            this.lsvInventory.HideSelection = false;
            this.lsvInventory.Location = new System.Drawing.Point(795, 51);
            this.lsvInventory.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.lsvInventory.Name = "lsvInventory";
            this.lsvInventory.Size = new System.Drawing.Size(382, 822);
            this.lsvInventory.TabIndex = 4;
            this.lsvInventory.UseCompatibleStateImageBehavior = false;
            this.lsvInventory.View = System.Windows.Forms.View.List;
            // 
            // pgrbEncombrement
            // 
            this.pgrbEncombrement.Location = new System.Drawing.Point(795, 911);
            this.pgrbEncombrement.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pgrbEncombrement.Name = "pgrbEncombrement";
            this.pgrbEncombrement.Size = new System.Drawing.Size(384, 35);
            this.pgrbEncombrement.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(795, 880);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(163, 26);
            this.label4.TabIndex = 7;
            this.label4.Text = "Encombrement";
            // 
            // lblWeight
            // 
            this.lblWeight.AutoSize = true;
            this.lblWeight.Font = new System.Drawing.Font("MV Boli", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblWeight.Location = new System.Drawing.Point(1090, 880);
            this.lblWeight.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblWeight.Name = "lblWeight";
            this.lblWeight.Size = new System.Drawing.Size(85, 22);
            this.lblWeight.TabIndex = 8;
            this.lblWeight.Text = "0 / 100";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(18, 603);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(127, 26);
            this.label6.TabIndex = 10;
            this.label6.Text = "Progression";
            // 
            // pgrbProgression
            // 
            this.pgrbProgression.Location = new System.Drawing.Point(20, 634);
            this.pgrbProgression.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pgrbProgression.MarqueeAnimationSpeed = 500;
            this.pgrbProgression.Name = "pgrbProgression";
            this.pgrbProgression.Size = new System.Drawing.Size(766, 35);
            this.pgrbProgression.Step = 1;
            this.pgrbProgression.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbProgression.TabIndex = 9;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold);
            this.button1.Location = new System.Drawing.Point(1185, 880);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(555, 73);
            this.button1.TabIndex = 11;
            this.button1.Text = "Commencer l\'aventure";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(1184, 14);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(70, 31);
            this.label5.TabIndex = 12;
            this.label5.Text = "Héro";
            // 
            // pgrbHealt
            // 
            this.pgrbHealt.Location = new System.Drawing.Point(1185, 194);
            this.pgrbHealt.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pgrbHealt.MarqueeAnimationSpeed = 500;
            this.pgrbHealt.Name = "pgrbHealt";
            this.pgrbHealt.Size = new System.Drawing.Size(554, 35);
            this.pgrbHealt.Step = 1;
            this.pgrbHealt.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbHealt.TabIndex = 13;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(1185, 163);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(141, 26);
            this.label7.TabIndex = 14;
            this.label7.Text = "Point de vie";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(1185, 234);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(119, 26);
            this.label8.TabIndex = 16;
            this.label8.Text = "Expérience";
            // 
            // pgrbXp
            // 
            this.pgrbXp.Location = new System.Drawing.Point(1185, 265);
            this.pgrbXp.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pgrbXp.MarqueeAnimationSpeed = 500;
            this.pgrbXp.Name = "pgrbXp";
            this.pgrbXp.Size = new System.Drawing.Size(554, 35);
            this.pgrbXp.Step = 1;
            this.pgrbXp.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbXp.TabIndex = 15;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(1185, 51);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(86, 26);
            this.label9.TabIndex = 17;
            this.label9.Text = "Force :";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(1185, 87);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(141, 26);
            this.label10.TabIndex = 18;
            this.label10.Text = "Dextéritée :";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(1185, 124);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(161, 26);
            this.label11.TabIndex = 19;
            this.label11.Text = "Constitution :";
            // 
            // lblStr
            // 
            this.lblStr.AutoSize = true;
            this.lblStr.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStr.Location = new System.Drawing.Point(1279, 51);
            this.lblStr.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblStr.Name = "lblStr";
            this.lblStr.Size = new System.Drawing.Size(0, 26);
            this.lblStr.TabIndex = 20;
            // 
            // lblDex
            // 
            this.lblDex.AutoSize = true;
            this.lblDex.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDex.Location = new System.Drawing.Point(1334, 87);
            this.lblDex.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblDex.Name = "lblDex";
            this.lblDex.Size = new System.Drawing.Size(0, 26);
            this.lblDex.TabIndex = 21;
            // 
            // lblConst
            // 
            this.lblConst.AutoSize = true;
            this.lblConst.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblConst.Location = new System.Drawing.Point(1354, 124);
            this.lblConst.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblConst.Name = "lblConst";
            this.lblConst.Size = new System.Drawing.Size(0, 26);
            this.lblConst.TabIndex = 22;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(1185, 784);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(173, 26);
            this.label12.TabIndex = 24;
            this.label12.Text = "Vie du monstre";
            // 
            // pgrbMonsterHP
            // 
            this.pgrbMonsterHP.Location = new System.Drawing.Point(1185, 815);
            this.pgrbMonsterHP.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pgrbMonsterHP.MarqueeAnimationSpeed = 500;
            this.pgrbMonsterHP.Name = "pgrbMonsterHP";
            this.pgrbMonsterHP.Size = new System.Drawing.Size(554, 35);
            this.pgrbMonsterHP.Step = 1;
            this.pgrbMonsterHP.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbMonsterHP.TabIndex = 23;
            // 
            // lsvLog
            // 
            this.lsvLog.Font = new System.Drawing.Font("MV Boli", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lsvLog.FormattingEnabled = true;
            this.lsvLog.ItemHeight = 29;
            this.lsvLog.Location = new System.Drawing.Point(20, 703);
            this.lsvLog.Name = "lsvLog";
            this.lsvLog.Size = new System.Drawing.Size(766, 236);
            this.lsvLog.TabIndex = 25;
            // 
            // IdleGameGUI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1752, 965);
            this.Controls.Add(this.lsvLog);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.pgrbMonsterHP);
            this.Controls.Add(this.lblConst);
            this.Controls.Add(this.lblDex);
            this.Controls.Add(this.lblStr);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.pgrbXp);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.pgrbHealt);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.pgrbProgression);
            this.Controls.Add(this.lblWeight);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.pgrbEncombrement);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lsvInventory);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lsvQuest);
            this.Controls.Add(this.label1);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "IdleGameGUI";
            this.Text = "IdleGame";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListView lsvQuest;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ListView lsvInventory;
        private System.Windows.Forms.ProgressBar pgrbEncombrement;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label lblWeight;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ProgressBar pgrbProgression;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ProgressBar pgrbHealt;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ProgressBar pgrbXp;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label lblStr;
        private System.Windows.Forms.Label lblDex;
        private System.Windows.Forms.Label lblConst;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.ProgressBar pgrbMonsterHP;
        private System.Windows.Forms.ListBox lsvLog;
    }
}


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
            this.label1.Location = new System.Drawing.Point(12, 438);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(156, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Journal de l\'aventure";
            // 
            // lsvQuest
            // 
            this.lsvQuest.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold);
            this.lsvQuest.HideSelection = false;
            this.lsvQuest.Location = new System.Drawing.Point(15, 33);
            this.lsvQuest.Name = "lsvQuest";
            this.lsvQuest.Size = new System.Drawing.Size(368, 337);
            this.lsvQuest.TabIndex = 2;
            this.lsvQuest.UseCompatibleStateImageBehavior = false;
            this.lsvQuest.View = System.Windows.Forms.View.Details;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(11, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 21);
            this.label2.TabIndex = 3;
            this.label2.Text = "Quêtes";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(430, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(94, 21);
            this.label3.TabIndex = 5;
            this.label3.Text = "Inventaire";
            // 
            // lsvInventory
            // 
            this.lsvInventory.Font = new System.Drawing.Font("MV Boli", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lsvInventory.HideSelection = false;
            this.lsvInventory.Location = new System.Drawing.Point(429, 33);
            this.lsvInventory.Name = "lsvInventory";
            this.lsvInventory.Size = new System.Drawing.Size(357, 376);
            this.lsvInventory.TabIndex = 4;
            this.lsvInventory.UseCompatibleStateImageBehavior = false;
            this.lsvInventory.View = System.Windows.Forms.View.Details;
            // 
            // pgrbEncombrement
            // 
            this.pgrbEncombrement.Location = new System.Drawing.Point(530, 432);
            this.pgrbEncombrement.Name = "pgrbEncombrement";
            this.pgrbEncombrement.Size = new System.Drawing.Size(256, 23);
            this.pgrbEncombrement.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(530, 412);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(109, 17);
            this.label4.TabIndex = 7;
            this.label4.Text = "Encombrement";
            // 
            // lblWeight
            // 
            this.lblWeight.AutoSize = true;
            this.lblWeight.Font = new System.Drawing.Font("MV Boli", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblWeight.Location = new System.Drawing.Point(727, 412);
            this.lblWeight.Name = "lblWeight";
            this.lblWeight.Size = new System.Drawing.Size(59, 16);
            this.lblWeight.TabIndex = 8;
            this.lblWeight.Text = "0 / 100";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(12, 392);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(86, 17);
            this.label6.TabIndex = 10;
            this.label6.Text = "Progression";
            // 
            // pgrbProgression
            // 
            this.pgrbProgression.Location = new System.Drawing.Point(13, 412);
            this.pgrbProgression.MarqueeAnimationSpeed = 500;
            this.pgrbProgression.Name = "pgrbProgression";
            this.pgrbProgression.Size = new System.Drawing.Size(511, 23);
            this.pgrbProgression.Step = 1;
            this.pgrbProgression.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbProgression.TabIndex = 9;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold);
            this.button1.Location = new System.Drawing.Point(790, 572);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(370, 47);
            this.button1.TabIndex = 11;
            this.button1.Text = "Commencer l\'aventure";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(789, 9);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(49, 21);
            this.label5.TabIndex = 12;
            this.label5.Text = "Héro";
            // 
            // pgrbHealt
            // 
            this.pgrbHealt.Location = new System.Drawing.Point(790, 126);
            this.pgrbHealt.MarqueeAnimationSpeed = 500;
            this.pgrbHealt.Name = "pgrbHealt";
            this.pgrbHealt.Size = new System.Drawing.Size(369, 23);
            this.pgrbHealt.Step = 1;
            this.pgrbHealt.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbHealt.TabIndex = 13;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(790, 106);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(93, 17);
            this.label7.TabIndex = 14;
            this.label7.Text = "Point de vie";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(790, 152);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(79, 17);
            this.label8.TabIndex = 16;
            this.label8.Text = "Expérience";
            // 
            // pgrbXp
            // 
            this.pgrbXp.Location = new System.Drawing.Point(790, 172);
            this.pgrbXp.MarqueeAnimationSpeed = 500;
            this.pgrbXp.Name = "pgrbXp";
            this.pgrbXp.Size = new System.Drawing.Size(369, 23);
            this.pgrbXp.Step = 1;
            this.pgrbXp.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbXp.TabIndex = 15;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(790, 33);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(58, 17);
            this.label9.TabIndex = 17;
            this.label9.Text = "Force :";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(790, 57);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(93, 17);
            this.label10.TabIndex = 18;
            this.label10.Text = "Dextéritée :";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(790, 81);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(108, 17);
            this.label11.TabIndex = 19;
            this.label11.Text = "Constitution :";
            // 
            // lblStr
            // 
            this.lblStr.AutoSize = true;
            this.lblStr.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStr.Location = new System.Drawing.Point(853, 33);
            this.lblStr.Name = "lblStr";
            this.lblStr.Size = new System.Drawing.Size(0, 17);
            this.lblStr.TabIndex = 20;
            // 
            // lblDex
            // 
            this.lblDex.AutoSize = true;
            this.lblDex.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDex.Location = new System.Drawing.Point(889, 57);
            this.lblDex.Name = "lblDex";
            this.lblDex.Size = new System.Drawing.Size(0, 17);
            this.lblDex.TabIndex = 21;
            // 
            // lblConst
            // 
            this.lblConst.AutoSize = true;
            this.lblConst.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblConst.Location = new System.Drawing.Point(903, 81);
            this.lblConst.Name = "lblConst";
            this.lblConst.Size = new System.Drawing.Size(0, 17);
            this.lblConst.TabIndex = 22;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(790, 510);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(114, 17);
            this.label12.TabIndex = 24;
            this.label12.Text = "Vie du monstre";
            // 
            // pgrbMonsterHP
            // 
            this.pgrbMonsterHP.Location = new System.Drawing.Point(790, 530);
            this.pgrbMonsterHP.MarqueeAnimationSpeed = 500;
            this.pgrbMonsterHP.Name = "pgrbMonsterHP";
            this.pgrbMonsterHP.Size = new System.Drawing.Size(369, 23);
            this.pgrbMonsterHP.Step = 1;
            this.pgrbMonsterHP.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pgrbMonsterHP.TabIndex = 23;
            // 
            // lsvLog
            // 
            this.lsvLog.Font = new System.Drawing.Font("MV Boli", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lsvLog.FormattingEnabled = true;
            this.lsvLog.ItemHeight = 17;
            this.lsvLog.Location = new System.Drawing.Point(13, 457);
            this.lsvLog.Margin = new System.Windows.Forms.Padding(2);
            this.lsvLog.Name = "lsvLog";
            this.lsvLog.Size = new System.Drawing.Size(773, 140);
            this.lsvLog.TabIndex = 25;
            // 
            // IdleGameGUI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1168, 627);
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


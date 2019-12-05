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
            this.lsvLog = new System.Windows.Forms.ListView();
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
            this.SuspendLayout();
            // 
            // lsvLog
            // 
            this.lsvLog.Font = new System.Drawing.Font("MV Boli", 12F, System.Drawing.FontStyle.Bold);
            this.lsvLog.HideSelection = false;
            this.lsvLog.Location = new System.Drawing.Point(18, 705);
            this.lsvLog.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.lsvLog.Name = "lsvLog";
            this.lsvLog.Size = new System.Drawing.Size(766, 239);
            this.lsvLog.TabIndex = 0;
            this.lsvLog.UseCompatibleStateImageBehavior = false;
            this.lsvLog.View = System.Windows.Forms.View.List;
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
            this.pgrbProgression.Name = "pgrbProgression";
            this.pgrbProgression.Size = new System.Drawing.Size(766, 35);
            this.pgrbProgression.TabIndex = 9;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(1477, 831);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(263, 122);
            this.button1.TabIndex = 11;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // IdleGameGUI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1752, 965);
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
            this.Controls.Add(this.lsvLog);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "IdleGameGUI";
            this.Text = "IdleGame";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView lsvLog;
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
    }
}


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
            this.SuspendLayout();
            // 
            // lsvLog
            // 
            this.lsvLog.HideSelection = false;
            this.lsvLog.Location = new System.Drawing.Point(12, 458);
            this.lsvLog.Name = "lsvLog";
            this.lsvLog.Size = new System.Drawing.Size(512, 157);
            this.lsvLog.TabIndex = 0;
            this.lsvLog.UseCompatibleStateImageBehavior = false;
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
            this.lsvQuest.HideSelection = false;
            this.lsvQuest.Location = new System.Drawing.Point(15, 33);
            this.lsvQuest.Name = "lsvQuest";
            this.lsvQuest.Size = new System.Drawing.Size(256, 337);
            this.lsvQuest.TabIndex = 2;
            this.lsvQuest.UseCompatibleStateImageBehavior = false;
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
            this.label3.Location = new System.Drawing.Point(526, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(94, 21);
            this.label3.TabIndex = 5;
            this.label3.Text = "Inventaire";
            // 
            // lsvInventory
            // 
            this.lsvInventory.HideSelection = false;
            this.lsvInventory.Location = new System.Drawing.Point(530, 33);
            this.lsvInventory.Name = "lsvInventory";
            this.lsvInventory.Size = new System.Drawing.Size(256, 536);
            this.lsvInventory.TabIndex = 4;
            this.lsvInventory.UseCompatibleStateImageBehavior = false;
            // 
            // pgrbEncombrement
            // 
            this.pgrbEncombrement.Location = new System.Drawing.Point(530, 592);
            this.pgrbEncombrement.Name = "pgrbEncombrement";
            this.pgrbEncombrement.Size = new System.Drawing.Size(256, 23);
            this.pgrbEncombrement.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("MV Boli", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(530, 572);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(109, 17);
            this.label4.TabIndex = 7;
            this.label4.Text = "Encombrement";
            // 
            // lblWeight
            // 
            this.lblWeight.AutoSize = true;
            this.lblWeight.Font = new System.Drawing.Font("MV Boli", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblWeight.Location = new System.Drawing.Point(727, 572);
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
            this.pgrbProgression.Name = "pgrbProgression";
            this.pgrbProgression.Size = new System.Drawing.Size(511, 23);
            this.pgrbProgression.TabIndex = 9;
            // 
            // IdleGameGUI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1168, 627);
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
    }
}


namespace FrbaHotel.AbmRegimen
{
    partial class Regimen_Modificacion
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.regimenBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.gD1C2018DataSet = new FrbaHotel.GD1C2018DataSet();
            this.regimenTableAdapter = new FrbaHotel.GD1C2018DataSetTableAdapters.regimenTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.regimenBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).BeginInit();
            this.SuspendLayout();
            // 
            // regimenBindingSource
            // 
            this.regimenBindingSource.DataMember = "regimen";
            this.regimenBindingSource.DataSource = this.gD1C2018DataSet;
            // 
            // gD1C2018DataSet
            // 
            this.gD1C2018DataSet.DataSetName = "GD1C2018DataSet";
            this.gD1C2018DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // regimenTableAdapter
            // 
            this.regimenTableAdapter.ClearBeforeFill = true;
            // 
            // Regimen_Modificacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(671, 534);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "Regimen_Modificacion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Modificar un Régimen de Estadía";
            //this.Load += new System.EventHandler(this.Regimen_Modificacion_Load);
            ((System.ComponentModel.ISupportInitialize)(this.regimenBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private GD1C2018DataSet gD1C2018DataSet;
        private System.Windows.Forms.BindingSource regimenBindingSource;
        private GD1C2018DataSetTableAdapters.regimenTableAdapter regimenTableAdapter;
    }
}
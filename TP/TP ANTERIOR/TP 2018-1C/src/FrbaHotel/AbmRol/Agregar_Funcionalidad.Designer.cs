namespace FrbaHotel.AbmRol
{
    partial class Agregar_Funcionalidad
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
            this.cmb_agregar_func = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btn_agregarFunc = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmb_agregar_func
            // 
            this.cmb_agregar_func.FormattingEnabled = true;
            this.cmb_agregar_func.Location = new System.Drawing.Point(354, 33);
            this.cmb_agregar_func.Name = "cmb_agregar_func";
            this.cmb_agregar_func.Size = new System.Drawing.Size(285, 24);
            this.cmb_agregar_func.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(27, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(309, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Seleccione la funcionalidad que desee agregar:";
            // 
            // btn_agregarFunc
            // 
            this.btn_agregarFunc.Location = new System.Drawing.Point(233, 75);
            this.btn_agregarFunc.Name = "btn_agregarFunc";
            this.btn_agregarFunc.Size = new System.Drawing.Size(203, 40);
            this.btn_agregarFunc.TabIndex = 4;
            this.btn_agregarFunc.Text = "Agregar Funcionalidad";
            this.btn_agregarFunc.UseVisualStyleBackColor = true;
            this.btn_agregarFunc.Click += new System.EventHandler(this.btn_agregarFunc_Click);
            // 
            // Agregar_Funcionalidad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(672, 141);
            this.Controls.Add(this.btn_agregarFunc);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmb_agregar_func);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "Agregar_Funcionalidad";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Agregar Funcionalidades";
            this.Load += new System.EventHandler(this.Rol_Modificacion_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmb_agregar_func;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btn_agregarFunc;

    }
}
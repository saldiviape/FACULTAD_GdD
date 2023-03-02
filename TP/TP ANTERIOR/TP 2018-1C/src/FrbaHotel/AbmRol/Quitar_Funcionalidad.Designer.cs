namespace FrbaHotel.AbmRol
{
    partial class Quitar_Funcionalidad
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
            this.cmb_eliminar_func = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_quitarFunc = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cmb_eliminar_func
            // 
            this.cmb_eliminar_func.FormattingEnabled = true;
            this.cmb_eliminar_func.Location = new System.Drawing.Point(353, 30);
            this.cmb_eliminar_func.Name = "cmb_eliminar_func";
            this.cmb_eliminar_func.Size = new System.Drawing.Size(285, 24);
            this.cmb_eliminar_func.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(27, 33);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(308, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Seleccione la funcionalidad que desee eliminar:";
            // 
            // btn_quitarFunc
            // 
            this.btn_quitarFunc.Location = new System.Drawing.Point(233, 80);
            this.btn_quitarFunc.Name = "btn_quitarFunc";
            this.btn_quitarFunc.Size = new System.Drawing.Size(203, 40);
            this.btn_quitarFunc.TabIndex = 5;
            this.btn_quitarFunc.Text = "Quitar Funcionalidad";
            this.btn_quitarFunc.UseVisualStyleBackColor = true;
            this.btn_quitarFunc.Click += new System.EventHandler(this.btn_quitarFunc_Click);
            // 
            // Quitar_Funcionalidad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(672, 150);
            this.Controls.Add(this.btn_quitarFunc);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cmb_eliminar_func);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "Quitar_Funcionalidad";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Quitar Funcionalidades";
            this.Load += new System.EventHandler(this.Rol_Modificacion_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmb_eliminar_func;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_quitarFunc;

    }
}
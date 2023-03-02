namespace FrbaHotel.RegistrarConsumible
{
    partial class RegistrarConsumible
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
            this.lab_descripcion = new System.Windows.Forms.Label();
            this.txt_descripcion = new System.Windows.Forms.TextBox();
            this.lab_precioUnitario = new System.Windows.Forms.Label();
            this.txt_precioUnitario = new System.Windows.Forms.TextBox();
            this.btn_Limpiar = new System.Windows.Forms.Button();
            this.btn_Guardar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lab_descripcion
            // 
            this.lab_descripcion.AutoSize = true;
            this.lab_descripcion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_descripcion.Location = new System.Drawing.Point(41, 33);
            this.lab_descripcion.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_descripcion.Name = "lab_descripcion";
            this.lab_descripcion.Size = new System.Drawing.Size(99, 20);
            this.lab_descripcion.TabIndex = 47;
            this.lab_descripcion.Text = "Descripción";
            this.lab_descripcion.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_descripcion
            // 
            this.txt_descripcion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_descripcion.Location = new System.Drawing.Point(45, 57);
            this.txt_descripcion.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_descripcion.Name = "txt_descripcion";
            this.txt_descripcion.Size = new System.Drawing.Size(281, 26);
            this.txt_descripcion.TabIndex = 0;
            // 
            // lab_precioUnitario
            // 
            this.lab_precioUnitario.AutoSize = true;
            this.lab_precioUnitario.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_precioUnitario.Location = new System.Drawing.Point(347, 33);
            this.lab_precioUnitario.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_precioUnitario.Name = "lab_precioUnitario";
            this.lab_precioUnitario.Size = new System.Drawing.Size(120, 20);
            this.lab_precioUnitario.TabIndex = 49;
            this.lab_precioUnitario.Text = "Precio Unitario";
            this.lab_precioUnitario.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_precioUnitario
            // 
            this.txt_precioUnitario.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_precioUnitario.Location = new System.Drawing.Point(351, 57);
            this.txt_precioUnitario.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_precioUnitario.Name = "txt_precioUnitario";
            this.txt_precioUnitario.Size = new System.Drawing.Size(123, 26);
            this.txt_precioUnitario.TabIndex = 1;
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(45, 108);
            this.btn_Limpiar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(208, 50);
            this.btn_Limpiar.TabIndex = 3;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Guardar
            // 
            this.btn_Guardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Guardar.Location = new System.Drawing.Point(267, 108);
            this.btn_Guardar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_Guardar.Name = "btn_Guardar";
            this.btn_Guardar.Size = new System.Drawing.Size(208, 50);
            this.btn_Guardar.TabIndex = 2;
            this.btn_Guardar.Text = "Guardar";
            this.btn_Guardar.UseVisualStyleBackColor = true;
            // 
            // RegistrarConsumible
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(519, 192);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.btn_Guardar);
            this.Controls.Add(this.lab_precioUnitario);
            this.Controls.Add(this.txt_precioUnitario);
            this.Controls.Add(this.lab_descripcion);
            this.Controls.Add(this.txt_descripcion);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "RegistrarConsumible";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Registrar Consumibles";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lab_descripcion;
        private System.Windows.Forms.TextBox txt_descripcion;
        private System.Windows.Forms.Label lab_precioUnitario;
        private System.Windows.Forms.TextBox txt_precioUnitario;
        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Guardar;
    }
}
namespace FrbaHotel.AbmHabitacion
{
    partial class Habitacion_Alta
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
            this.label2 = new System.Windows.Forms.Label();
            this.btn_Limpiar = new System.Windows.Forms.Button();
            this.btn_Guardar = new System.Windows.Forms.Button();
            this.cmb_tipo = new System.Windows.Forms.ComboBox();
            this.lab_ubicacion = new System.Windows.Forms.Label();
            this.lab_tipo = new System.Windows.Forms.Label();
            this.lab_direccionHotel = new System.Windows.Forms.Label();
            this.txt_piso = new System.Windows.Forms.TextBox();
            this.lab_piso = new System.Windows.Forms.Label();
            this.txt_numero = new System.Windows.Forms.TextBox();
            this.lab_numero = new System.Windows.Forms.Label();
            this.cmb_direccionHotel = new System.Windows.Forms.ComboBox();
            this.cmb_ubicacion = new System.Windows.Forms.ComboBox();
            this.chk_mantenimiento = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(513, 41);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(15, 20);
            this.label2.TabIndex = 58;
            this.label2.Text = "*";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(29, 230);
            this.btn_Limpiar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(229, 50);
            this.btn_Limpiar.TabIndex = 8;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Guardar
            // 
            this.btn_Guardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Guardar.Location = new System.Drawing.Point(280, 230);
            this.btn_Guardar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_Guardar.Name = "btn_Guardar";
            this.btn_Guardar.Size = new System.Drawing.Size(229, 50);
            this.btn_Guardar.TabIndex = 7;
            this.btn_Guardar.Text = "Guardar";
            this.btn_Guardar.UseVisualStyleBackColor = true;
            this.btn_Guardar.Click += new System.EventHandler(this.btn_Guardar_Click);
            // 
            // cmb_tipo
            // 
            this.cmb_tipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_tipo.FormattingEnabled = true;
            this.cmb_tipo.Location = new System.Drawing.Point(87, 37);
            this.cmb_tipo.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.cmb_tipo.Name = "cmb_tipo";
            this.cmb_tipo.Size = new System.Drawing.Size(421, 28);
            this.cmb_tipo.TabIndex = 1;
            this.cmb_tipo.SelectedIndexChanged += new System.EventHandler(this.cmb_tipo_SelectedIndexChanged);
            // 
            // lab_ubicacion
            // 
            this.lab_ubicacion.AutoSize = true;
            this.lab_ubicacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_ubicacion.Location = new System.Drawing.Point(324, 126);
            this.lab_ubicacion.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_ubicacion.Name = "lab_ubicacion";
            this.lab_ubicacion.Size = new System.Drawing.Size(83, 20);
            this.lab_ubicacion.TabIndex = 44;
            this.lab_ubicacion.Text = "Ubicación";
            this.lab_ubicacion.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_tipo
            // 
            this.lab_tipo.AutoSize = true;
            this.lab_tipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_tipo.Location = new System.Drawing.Point(25, 40);
            this.lab_tipo.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_tipo.Name = "lab_tipo";
            this.lab_tipo.Size = new System.Drawing.Size(41, 20);
            this.lab_tipo.TabIndex = 41;
            this.lab_tipo.Text = "Tipo";
            this.lab_tipo.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_direccionHotel
            // 
            this.lab_direccionHotel.AutoSize = true;
            this.lab_direccionHotel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_direccionHotel.Location = new System.Drawing.Point(25, 82);
            this.lab_direccionHotel.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_direccionHotel.Name = "lab_direccionHotel";
            this.lab_direccionHotel.Size = new System.Drawing.Size(49, 20);
            this.lab_direccionHotel.TabIndex = 36;
            this.lab_direccionHotel.Text = "Hotel";
            this.lab_direccionHotel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_piso
            // 
            this.txt_piso.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_piso.Location = new System.Drawing.Point(237, 122);
            this.txt_piso.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_piso.Name = "txt_piso";
            this.txt_piso.Size = new System.Drawing.Size(49, 26);
            this.txt_piso.TabIndex = 4;
            // 
            // lab_piso
            // 
            this.lab_piso.AutoSize = true;
            this.lab_piso.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_piso.Location = new System.Drawing.Point(187, 126);
            this.lab_piso.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_piso.Name = "lab_piso";
            this.lab_piso.Size = new System.Drawing.Size(42, 20);
            this.lab_piso.TabIndex = 32;
            this.lab_piso.Text = "Piso";
            this.lab_piso.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_numero
            // 
            this.txt_numero.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_numero.Location = new System.Drawing.Point(104, 122);
            this.txt_numero.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_numero.Name = "txt_numero";
            this.txt_numero.Size = new System.Drawing.Size(49, 26);
            this.txt_numero.TabIndex = 3;
            // 
            // lab_numero
            // 
            this.lab_numero.AutoSize = true;
            this.lab_numero.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_numero.Location = new System.Drawing.Point(25, 126);
            this.lab_numero.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_numero.Name = "lab_numero";
            this.lab_numero.Size = new System.Drawing.Size(68, 20);
            this.lab_numero.TabIndex = 29;
            this.lab_numero.Text = "Número";
            this.lab_numero.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // cmb_direccionHotel
            // 
            this.cmb_direccionHotel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_direccionHotel.FormattingEnabled = true;
            this.cmb_direccionHotel.Location = new System.Drawing.Point(87, 79);
            this.cmb_direccionHotel.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.cmb_direccionHotel.Name = "cmb_direccionHotel";
            this.cmb_direccionHotel.Size = new System.Drawing.Size(421, 28);
            this.cmb_direccionHotel.TabIndex = 2;
            this.cmb_direccionHotel.SelectedIndexChanged += new System.EventHandler(this.cmb_direccionHotel_SelectedIndexChanged);
            // 
            // cmb_ubicacion
            // 
            this.cmb_ubicacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_ubicacion.FormattingEnabled = true;
            this.cmb_ubicacion.Items.AddRange(new object[] {
            "N",
            "S"});
            this.cmb_ubicacion.Location = new System.Drawing.Point(420, 122);
            this.cmb_ubicacion.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.cmb_ubicacion.Name = "cmb_ubicacion";
            this.cmb_ubicacion.Size = new System.Drawing.Size(88, 28);
            this.cmb_ubicacion.TabIndex = 5;
            // 
            // chk_mantenimiento
            // 
            this.chk_mantenimiento.AutoSize = true;
            this.chk_mantenimiento.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_mantenimiento.Location = new System.Drawing.Point(56, 169);
            this.chk_mantenimiento.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.chk_mantenimiento.Name = "chk_mantenimiento";
            this.chk_mantenimiento.Size = new System.Drawing.Size(165, 24);
            this.chk_mantenimiento.TabIndex = 6;
            this.chk_mantenimiento.Text = "En Mantenimiento";
            this.chk_mantenimiento.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(491, 190);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(15, 20);
            this.label5.TabIndex = 65;
            this.label5.Text = "*";
            this.label5.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(332, 191);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(146, 18);
            this.label6.TabIndex = 64;
            this.label6.Text = "Campos obligatorios";
            this.label6.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // Habitacion_Alta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(551, 313);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.chk_mantenimiento);
            this.Controls.Add(this.cmb_ubicacion);
            this.Controls.Add(this.cmb_direccionHotel);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.btn_Guardar);
            this.Controls.Add(this.cmb_tipo);
            this.Controls.Add(this.lab_ubicacion);
            this.Controls.Add(this.lab_tipo);
            this.Controls.Add(this.lab_direccionHotel);
            this.Controls.Add(this.txt_piso);
            this.Controls.Add(this.lab_piso);
            this.Controls.Add(this.txt_numero);
            this.Controls.Add(this.lab_numero);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximizeBox = false;
            this.Name = "Habitacion_Alta";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Nueva Habitación";
            this.Load += new System.EventHandler(this.Habitacion_Alta_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Guardar;
        private System.Windows.Forms.ComboBox cmb_tipo;
        private System.Windows.Forms.Label lab_ubicacion;
        private System.Windows.Forms.Label lab_tipo;
        private System.Windows.Forms.Label lab_direccionHotel;
        private System.Windows.Forms.TextBox txt_piso;
        private System.Windows.Forms.Label lab_piso;
        private System.Windows.Forms.TextBox txt_numero;
        private System.Windows.Forms.Label lab_numero;
        private System.Windows.Forms.ComboBox cmb_direccionHotel;
        private System.Windows.Forms.ComboBox cmb_ubicacion;
        private System.Windows.Forms.CheckBox chk_mantenimiento;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
    }
}
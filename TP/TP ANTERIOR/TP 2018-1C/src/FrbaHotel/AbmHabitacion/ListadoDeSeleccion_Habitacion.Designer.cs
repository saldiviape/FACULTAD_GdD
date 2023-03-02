namespace FrbaHotel.AbmHabitacion
{
    partial class ListadoDeSeleccion_Habitacion
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
            this.cmb_ubicacion = new System.Windows.Forms.ComboBox();
            this.cmb_direccionHotel = new System.Windows.Forms.ComboBox();
            this.cmb_tipo = new System.Windows.Forms.ComboBox();
            this.lab_ubicacion = new System.Windows.Forms.Label();
            this.lab_tipo = new System.Windows.Forms.Label();
            this.lab_direccionHotel = new System.Windows.Forms.Label();
            this.txt_piso = new System.Windows.Forms.TextBox();
            this.lab_piso = new System.Windows.Forms.Label();
            this.txt_numero = new System.Windows.Forms.TextBox();
            this.lab_numero = new System.Windows.Forms.Label();
            this.btn_Limpiar = new System.Windows.Forms.Button();
            this.btn_Buscar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.chk_exacto_num = new System.Windows.Forms.CheckBox();
            this.chk_exacto_piso = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // cmb_ubicacion
            // 
            this.cmb_ubicacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_ubicacion.FormattingEnabled = true;
            this.cmb_ubicacion.Items.AddRange(new object[] {
            "N",
            "S"});
            this.cmb_ubicacion.Location = new System.Drawing.Point(350, 157);
            this.cmb_ubicacion.Name = "cmb_ubicacion";
            this.cmb_ubicacion.Size = new System.Drawing.Size(67, 24);
            this.cmb_ubicacion.TabIndex = 63;
            // 
            // cmb_direccionHotel
            // 
            this.cmb_direccionHotel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_direccionHotel.FormattingEnabled = true;
            this.cmb_direccionHotel.Location = new System.Drawing.Point(100, 99);
            this.cmb_direccionHotel.Name = "cmb_direccionHotel";
            this.cmb_direccionHotel.Size = new System.Drawing.Size(317, 24);
            this.cmb_direccionHotel.TabIndex = 60;
            // 
            // cmb_tipo
            // 
            this.cmb_tipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_tipo.FormattingEnabled = true;
            this.cmb_tipo.Location = new System.Drawing.Point(100, 65);
            this.cmb_tipo.Name = "cmb_tipo";
            this.cmb_tipo.Size = new System.Drawing.Size(317, 24);
            this.cmb_tipo.TabIndex = 59;
            // 
            // lab_ubicacion
            // 
            this.lab_ubicacion.AutoSize = true;
            this.lab_ubicacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_ubicacion.Location = new System.Drawing.Point(278, 160);
            this.lab_ubicacion.Name = "lab_ubicacion";
            this.lab_ubicacion.Size = new System.Drawing.Size(69, 16);
            this.lab_ubicacion.TabIndex = 68;
            this.lab_ubicacion.Text = "Ubicación";
            this.lab_ubicacion.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_tipo
            // 
            this.lab_tipo.AutoSize = true;
            this.lab_tipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_tipo.Location = new System.Drawing.Point(54, 67);
            this.lab_tipo.Name = "lab_tipo";
            this.lab_tipo.Size = new System.Drawing.Size(36, 16);
            this.lab_tipo.TabIndex = 67;
            this.lab_tipo.Text = "Tipo";
            this.lab_tipo.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_direccionHotel
            // 
            this.lab_direccionHotel.AutoSize = true;
            this.lab_direccionHotel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_direccionHotel.Location = new System.Drawing.Point(54, 102);
            this.lab_direccionHotel.Name = "lab_direccionHotel";
            this.lab_direccionHotel.Size = new System.Drawing.Size(40, 16);
            this.lab_direccionHotel.TabIndex = 66;
            this.lab_direccionHotel.Text = "Hotel";
            this.lab_direccionHotel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_piso
            // 
            this.txt_piso.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_piso.Location = new System.Drawing.Point(113, 162);
            this.txt_piso.Name = "txt_piso";
            this.txt_piso.Size = new System.Drawing.Size(38, 22);
            this.txt_piso.TabIndex = 62;
            // 
            // lab_piso
            // 
            this.lab_piso.AutoSize = true;
            this.lab_piso.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_piso.Location = new System.Drawing.Point(75, 165);
            this.lab_piso.Name = "lab_piso";
            this.lab_piso.Size = new System.Drawing.Size(35, 16);
            this.lab_piso.TabIndex = 65;
            this.lab_piso.Text = "Piso";
            this.lab_piso.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_numero
            // 
            this.txt_numero.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_numero.Location = new System.Drawing.Point(113, 134);
            this.txt_numero.Name = "txt_numero";
            this.txt_numero.Size = new System.Drawing.Size(38, 22);
            this.txt_numero.TabIndex = 61;
            // 
            // lab_numero
            // 
            this.lab_numero.AutoSize = true;
            this.lab_numero.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_numero.Location = new System.Drawing.Point(54, 137);
            this.lab_numero.Name = "lab_numero";
            this.lab_numero.Size = new System.Drawing.Size(56, 16);
            this.lab_numero.TabIndex = 64;
            this.lab_numero.Text = "Número";
            this.lab_numero.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(31, 206);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(176, 41);
            this.btn_Limpiar.TabIndex = 72;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Buscar
            // 
            this.btn_Buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Buscar.Location = new System.Drawing.Point(241, 206);
            this.btn_Buscar.Name = "btn_Buscar";
            this.btn_Buscar.Size = new System.Drawing.Size(176, 41);
            this.btn_Buscar.TabIndex = 71;
            this.btn_Buscar.Text = "Buscar";
            this.btn_Buscar.UseVisualStyleBackColor = true;
            this.btn_Buscar.Click += new System.EventHandler(this.btn_Buscar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(28, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(139, 18);
            this.label1.TabIndex = 70;
            this.label1.Text = "Filtros de Búsqueda";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(31, 266);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(386, 225);
            this.dataGridView1.TabIndex = 73;
            // 
            // chk_exacto_num
            // 
            this.chk_exacto_num.AutoSize = true;
            this.chk_exacto_num.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_exacto_num.Location = new System.Drawing.Point(157, 136);
            this.chk_exacto_num.Name = "chk_exacto_num";
            this.chk_exacto_num.Size = new System.Drawing.Size(104, 20);
            this.chk_exacto_num.TabIndex = 74;
            this.chk_exacto_num.Text = "Texto exacto";
            this.chk_exacto_num.UseVisualStyleBackColor = true;
            // 
            // chk_exacto_piso
            // 
            this.chk_exacto_piso.AutoSize = true;
            this.chk_exacto_piso.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_exacto_piso.Location = new System.Drawing.Point(157, 162);
            this.chk_exacto_piso.Name = "chk_exacto_piso";
            this.chk_exacto_piso.Size = new System.Drawing.Size(104, 20);
            this.chk_exacto_piso.TabIndex = 75;
            this.chk_exacto_piso.Text = "Texto exacto";
            this.chk_exacto_piso.UseVisualStyleBackColor = true;
            // 
            // ListadoDeSeleccion_Habitacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(457, 518);
            this.Controls.Add(this.chk_exacto_piso);
            this.Controls.Add(this.chk_exacto_num);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.btn_Buscar);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmb_ubicacion);
            this.Controls.Add(this.cmb_direccionHotel);
            this.Controls.Add(this.cmb_tipo);
            this.Controls.Add(this.lab_ubicacion);
            this.Controls.Add(this.lab_tipo);
            this.Controls.Add(this.lab_direccionHotel);
            this.Controls.Add(this.txt_piso);
            this.Controls.Add(this.lab_piso);
            this.Controls.Add(this.txt_numero);
            this.Controls.Add(this.lab_numero);
            this.MaximizeBox = false;
            this.Name = "ListadoDeSeleccion_Habitacion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Búsqueda de Habitación";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmb_ubicacion;
        private System.Windows.Forms.ComboBox cmb_direccionHotel;
        private System.Windows.Forms.ComboBox cmb_tipo;
        private System.Windows.Forms.Label lab_ubicacion;
        private System.Windows.Forms.Label lab_tipo;
        private System.Windows.Forms.Label lab_direccionHotel;
        private System.Windows.Forms.TextBox txt_piso;
        private System.Windows.Forms.Label lab_piso;
        private System.Windows.Forms.TextBox txt_numero;
        private System.Windows.Forms.Label lab_numero;
        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Buscar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.CheckBox chk_exacto_num;
        private System.Windows.Forms.CheckBox chk_exacto_piso;
    }
}
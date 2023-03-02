namespace FrbaHotel.ListadoEstadistico
{
    partial class ListadoEstadistico
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.dtp_año = new System.Windows.Forms.DateTimePicker();
            this.cmb_trimestre = new System.Windows.Forms.ComboBox();
            this.lab_año = new System.Windows.Forms.Label();
            this.lab_trimestre = new System.Windows.Forms.Label();
            this.btn_Limpiar = new System.Windows.Forms.Button();
            this.btn_Consultar = new System.Windows.Forms.Button();
            this.rbt_consulta5 = new System.Windows.Forms.RadioButton();
            this.rbt_consulta4 = new System.Windows.Forms.RadioButton();
            this.rbt_consulta3 = new System.Windows.Forms.RadioButton();
            this.rbt_consulta2 = new System.Windows.Forms.RadioButton();
            this.rbt_consulta1 = new System.Windows.Forms.RadioButton();
            this.lab_funcionalidadAConsultar = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(30, 304);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(605, 278);
            this.dataGridView1.TabIndex = 11;
            // 
            // dtp_año
            // 
            this.dtp_año.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtp_año.CustomFormat = "yyyy";
            this.dtp_año.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtp_año.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtp_año.Location = new System.Drawing.Point(114, 36);
            this.dtp_año.Name = "dtp_año";
            this.dtp_año.Size = new System.Drawing.Size(79, 22);
            this.dtp_año.TabIndex = 17;
            this.dtp_año.ValueChanged += new System.EventHandler(this.dtp_año_ValueChanged);
            // 
            // cmb_trimestre
            // 
            this.cmb_trimestre.Enabled = false;
            this.cmb_trimestre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_trimestre.FormattingEnabled = true;
            this.cmb_trimestre.Items.AddRange(new object[] {
            "(...)",
            "1º Trimestre",
            "2º Trimestre",
            "3º Trimestre",
            "4º Trimestre"});
            this.cmb_trimestre.Location = new System.Drawing.Point(280, 34);
            this.cmb_trimestre.Name = "cmb_trimestre";
            this.cmb_trimestre.Size = new System.Drawing.Size(189, 24);
            this.cmb_trimestre.TabIndex = 75;
            this.cmb_trimestre.Text = "(...)";
            this.cmb_trimestre.SelectedIndexChanged += new System.EventHandler(this.cmb_trimestre_SelectedIndexChanged);
            // 
            // lab_año
            // 
            this.lab_año.AutoSize = true;
            this.lab_año.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_año.Location = new System.Drawing.Point(80, 39);
            this.lab_año.Name = "lab_año";
            this.lab_año.Size = new System.Drawing.Size(32, 16);
            this.lab_año.TabIndex = 76;
            this.lab_año.Text = "Año";
            this.lab_año.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_trimestre
            // 
            this.lab_trimestre.AutoSize = true;
            this.lab_trimestre.Enabled = false;
            this.lab_trimestre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_trimestre.Location = new System.Drawing.Point(213, 38);
            this.lab_trimestre.Name = "lab_trimestre";
            this.lab_trimestre.Size = new System.Drawing.Size(65, 16);
            this.lab_trimestre.TabIndex = 78;
            this.lab_trimestre.Text = "Trimestre";
            this.lab_trimestre.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(31, 245);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(294, 41);
            this.btn_Limpiar.TabIndex = 80;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Consultar
            // 
            this.btn_Consultar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Consultar.Location = new System.Drawing.Point(341, 245);
            this.btn_Consultar.Name = "btn_Consultar";
            this.btn_Consultar.Size = new System.Drawing.Size(294, 41);
            this.btn_Consultar.TabIndex = 79;
            this.btn_Consultar.Text = "Consultar";
            this.btn_Consultar.UseVisualStyleBackColor = true;
            this.btn_Consultar.Click += new System.EventHandler(this.btn_Consultar_Click);
            // 
            // rbt_consulta5
            // 
            this.rbt_consulta5.Enabled = false;
            this.rbt_consulta5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbt_consulta5.Location = new System.Drawing.Point(197, 192);
            this.rbt_consulta5.Name = "rbt_consulta5";
            this.rbt_consulta5.Size = new System.Drawing.Size(438, 38);
            this.rbt_consulta5.TabIndex = 90;
            this.rbt_consulta5.TabStop = true;
            this.rbt_consulta5.Text = "El cliente con mayor cantidad de puntos de la sumatoria de todas las facturacione" +
    "s que haya tenido dentro de un período.";
            this.rbt_consulta5.TextAlign = System.Drawing.ContentAlignment.TopLeft;
            this.rbt_consulta5.UseVisualStyleBackColor = true;
            // 
            // rbt_consulta4
            // 
            this.rbt_consulta4.Enabled = false;
            this.rbt_consulta4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbt_consulta4.Location = new System.Drawing.Point(197, 151);
            this.rbt_consulta4.Name = "rbt_consulta4";
            this.rbt_consulta4.Size = new System.Drawing.Size(438, 38);
            this.rbt_consulta4.TabIndex = 89;
            this.rbt_consulta4.TabStop = true;
            this.rbt_consulta4.Text = "Las 5 habitaciones con mayor cantidad de días, la cantidad de veces que fueron oc" +
    "upadas, y a qué hotel pertenecen.";
            this.rbt_consulta4.TextAlign = System.Drawing.ContentAlignment.TopLeft;
            this.rbt_consulta4.UseVisualStyleBackColor = true;
            // 
            // rbt_consulta3
            // 
            this.rbt_consulta3.AutoSize = true;
            this.rbt_consulta3.Enabled = false;
            this.rbt_consulta3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbt_consulta3.Location = new System.Drawing.Point(197, 127);
            this.rbt_consulta3.Name = "rbt_consulta3";
            this.rbt_consulta3.Size = new System.Drawing.Size(379, 20);
            this.rbt_consulta3.TabIndex = 88;
            this.rbt_consulta3.TabStop = true;
            this.rbt_consulta3.Text = "Los 5 hoteles con mayor cantidad de días fuera de servicio.";
            this.rbt_consulta3.UseVisualStyleBackColor = true;
            // 
            // rbt_consulta2
            // 
            this.rbt_consulta2.AutoSize = true;
            this.rbt_consulta2.Enabled = false;
            this.rbt_consulta2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbt_consulta2.Location = new System.Drawing.Point(197, 102);
            this.rbt_consulta2.Name = "rbt_consulta2";
            this.rbt_consulta2.Size = new System.Drawing.Size(393, 20);
            this.rbt_consulta2.TabIndex = 87;
            this.rbt_consulta2.TabStop = true;
            this.rbt_consulta2.Text = "Los 5 hoteles con mayor cantidad de consumibles facturados.";
            this.rbt_consulta2.UseVisualStyleBackColor = true;
            // 
            // rbt_consulta1
            // 
            this.rbt_consulta1.AutoSize = true;
            this.rbt_consulta1.Enabled = false;
            this.rbt_consulta1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbt_consulta1.Location = new System.Drawing.Point(197, 77);
            this.rbt_consulta1.Name = "rbt_consulta1";
            this.rbt_consulta1.Size = new System.Drawing.Size(378, 20);
            this.rbt_consulta1.TabIndex = 86;
            this.rbt_consulta1.TabStop = true;
            this.rbt_consulta1.Text = "Los 5 hoteles con mayor cantidad de reservas canceladas.";
            this.rbt_consulta1.UseVisualStyleBackColor = true;
            // 
            // lab_funcionalidadAConsultar
            // 
            this.lab_funcionalidadAConsultar.AutoSize = true;
            this.lab_funcionalidadAConsultar.Enabled = false;
            this.lab_funcionalidadAConsultar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_funcionalidadAConsultar.Location = new System.Drawing.Point(28, 79);
            this.lab_funcionalidadAConsultar.Name = "lab_funcionalidadAConsultar";
            this.lab_funcionalidadAConsultar.Size = new System.Drawing.Size(164, 16);
            this.lab_funcionalidadAConsultar.TabIndex = 91;
            this.lab_funcionalidadAConsultar.Text = "Funcionalidad a consultar:";
            this.lab_funcionalidadAConsultar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // ListadoEstadistico
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(668, 614);
            this.Controls.Add(this.lab_funcionalidadAConsultar);
            this.Controls.Add(this.rbt_consulta5);
            this.Controls.Add(this.rbt_consulta4);
            this.Controls.Add(this.rbt_consulta3);
            this.Controls.Add(this.rbt_consulta2);
            this.Controls.Add(this.rbt_consulta1);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.btn_Consultar);
            this.Controls.Add(this.lab_trimestre);
            this.Controls.Add(this.lab_año);
            this.Controls.Add(this.cmb_trimestre);
            this.Controls.Add(this.dtp_año);
            this.Controls.Add(this.dataGridView1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ListadoEstadistico";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Listado Estadístico";
            this.Load += new System.EventHandler(this.ListadoEstadistico_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DateTimePicker dtp_año;
        private System.Windows.Forms.ComboBox cmb_trimestre;
        private System.Windows.Forms.Label lab_año;
        private System.Windows.Forms.Label lab_trimestre;
        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Consultar;
        private System.Windows.Forms.RadioButton rbt_consulta5;
        private System.Windows.Forms.RadioButton rbt_consulta4;
        private System.Windows.Forms.RadioButton rbt_consulta3;
        private System.Windows.Forms.RadioButton rbt_consulta2;
        private System.Windows.Forms.RadioButton rbt_consulta1;
        private System.Windows.Forms.Label lab_funcionalidadAConsultar;
    }
}
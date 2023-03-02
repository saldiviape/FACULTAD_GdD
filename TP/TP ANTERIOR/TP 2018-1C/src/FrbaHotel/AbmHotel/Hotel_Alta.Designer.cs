namespace FrbaHotel.AbmHotel
{
    partial class Hotel_Alta
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
            this.btn_Limpiar = new System.Windows.Forms.Button();
            this.btn_Guardar = new System.Windows.Forms.Button();
            this.cmb_estrellas = new System.Windows.Forms.ComboBox();
            this.txt_pais = new System.Windows.Forms.TextBox();
            this.lab_pais = new System.Windows.Forms.Label();
            this.txt_ciudad = new System.Windows.Forms.TextBox();
            this.lab_ciudad = new System.Windows.Forms.Label();
            this.txt_direccion = new System.Windows.Forms.TextBox();
            this.lab_direccion = new System.Windows.Forms.Label();
            this.txt_telefono = new System.Windows.Forms.TextBox();
            this.lab_telefono = new System.Windows.Forms.Label();
            this.lab_fechaCreacion = new System.Windows.Forms.Label();
            this.lab_estrellas = new System.Windows.Forms.Label();
            this.txt_nombre = new System.Windows.Forms.TextBox();
            this.lab_nombre = new System.Windows.Forms.Label();
            this.txt_mail = new System.Windows.Forms.TextBox();
            this.lab_mail = new System.Windows.Forms.Label();
            this.cmb_recargaEstrellas = new System.Windows.Forms.ComboBox();
            this.lab_recargaEstrellas = new System.Windows.Forms.Label();
            this.dtp_fechaCreacion = new System.Windows.Forms.DateTimePicker();
            this.regimenBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.gD1C2018DataSet = new FrbaHotel.GD1C2018DataSet();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.codRegimenDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.descripcionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.precioBaseDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.regimenBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.gD1C2018DataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.regimenTableAdapter = new FrbaHotel.GD1C2018DataSetTableAdapters.regimenTableAdapter();
            this.lbl_seleccionRegimenes = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.regimenBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.regimenBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSetBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(52, 518);
            this.btn_Limpiar.Margin = new System.Windows.Forms.Padding(4);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(256, 50);
            this.btn_Limpiar.TabIndex = 10;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Guardar
            // 
            this.btn_Guardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Guardar.Location = new System.Drawing.Point(319, 518);
            this.btn_Guardar.Margin = new System.Windows.Forms.Padding(4);
            this.btn_Guardar.Name = "btn_Guardar";
            this.btn_Guardar.Size = new System.Drawing.Size(256, 50);
            this.btn_Guardar.TabIndex = 9;
            this.btn_Guardar.Text = "Guardar";
            this.btn_Guardar.UseVisualStyleBackColor = true;
            this.btn_Guardar.Click += new System.EventHandler(this.btn_Guardar_Click);
            // 
            // cmb_estrellas
            // 
            this.cmb_estrellas.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_estrellas.FormattingEnabled = true;
            this.cmb_estrellas.Items.AddRange(new object[] {
            "1",
            "2",
            "3",
            "4",
            "5"});
            this.cmb_estrellas.Location = new System.Drawing.Point(207, 73);
            this.cmb_estrellas.Margin = new System.Windows.Forms.Padding(4);
            this.cmb_estrellas.Name = "cmb_estrellas";
            this.cmb_estrellas.Size = new System.Drawing.Size(85, 28);
            this.cmb_estrellas.TabIndex = 1;
            this.cmb_estrellas.SelectedIndexChanged += new System.EventHandler(this.cmb_estrellas_SelectedIndexChanged);
            // 
            // txt_pais
            // 
            this.txt_pais.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_pais.Location = new System.Drawing.Point(207, 249);
            this.txt_pais.Margin = new System.Windows.Forms.Padding(4);
            this.txt_pais.Name = "txt_pais";
            this.txt_pais.Size = new System.Drawing.Size(351, 26);
            this.txt_pais.TabIndex = 7;
            // 
            // lab_pais
            // 
            this.lab_pais.AutoSize = true;
            this.lab_pais.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_pais.Location = new System.Drawing.Point(152, 252);
            this.lab_pais.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_pais.Name = "lab_pais";
            this.lab_pais.Size = new System.Drawing.Size(42, 20);
            this.lab_pais.TabIndex = 55;
            this.lab_pais.Text = "País";
            this.lab_pais.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_ciudad
            // 
            this.txt_ciudad.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_ciudad.Location = new System.Drawing.Point(207, 214);
            this.txt_ciudad.Margin = new System.Windows.Forms.Padding(4);
            this.txt_ciudad.Name = "txt_ciudad";
            this.txt_ciudad.Size = new System.Drawing.Size(351, 26);
            this.txt_ciudad.TabIndex = 6;
            // 
            // lab_ciudad
            // 
            this.lab_ciudad.AutoSize = true;
            this.lab_ciudad.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_ciudad.Location = new System.Drawing.Point(132, 218);
            this.lab_ciudad.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_ciudad.Name = "lab_ciudad";
            this.lab_ciudad.Size = new System.Drawing.Size(61, 20);
            this.lab_ciudad.TabIndex = 54;
            this.lab_ciudad.Text = "Ciudad";
            this.lab_ciudad.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_direccion
            // 
            this.txt_direccion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_direccion.Location = new System.Drawing.Point(207, 178);
            this.txt_direccion.Margin = new System.Windows.Forms.Padding(4);
            this.txt_direccion.Name = "txt_direccion";
            this.txt_direccion.Size = new System.Drawing.Size(351, 26);
            this.txt_direccion.TabIndex = 5;
            // 
            // lab_direccion
            // 
            this.lab_direccion.AutoSize = true;
            this.lab_direccion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_direccion.Location = new System.Drawing.Point(113, 182);
            this.lab_direccion.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_direccion.Name = "lab_direccion";
            this.lab_direccion.Size = new System.Drawing.Size(81, 20);
            this.lab_direccion.TabIndex = 51;
            this.lab_direccion.Text = "Dirección";
            this.lab_direccion.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_telefono
            // 
            this.txt_telefono.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_telefono.Location = new System.Drawing.Point(207, 144);
            this.txt_telefono.Margin = new System.Windows.Forms.Padding(4);
            this.txt_telefono.Name = "txt_telefono";
            this.txt_telefono.Size = new System.Drawing.Size(351, 26);
            this.txt_telefono.TabIndex = 4;
            // 
            // lab_telefono
            // 
            this.lab_telefono.AutoSize = true;
            this.lab_telefono.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_telefono.Location = new System.Drawing.Point(119, 148);
            this.lab_telefono.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_telefono.Name = "lab_telefono";
            this.lab_telefono.Size = new System.Drawing.Size(73, 20);
            this.lab_telefono.TabIndex = 47;
            this.lab_telefono.Text = "Teléfono";
            this.lab_telefono.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_fechaCreacion
            // 
            this.lab_fechaCreacion.AutoSize = true;
            this.lab_fechaCreacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_fechaCreacion.Location = new System.Drawing.Point(36, 287);
            this.lab_fechaCreacion.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_fechaCreacion.Name = "lab_fechaCreacion";
            this.lab_fechaCreacion.Size = new System.Drawing.Size(150, 20);
            this.lab_fechaCreacion.TabIndex = 44;
            this.lab_fechaCreacion.Text = "Fecha de Creación";
            this.lab_fechaCreacion.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_estrellas
            // 
            this.lab_estrellas.AutoSize = true;
            this.lab_estrellas.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_estrellas.Location = new System.Drawing.Point(119, 76);
            this.lab_estrellas.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_estrellas.Name = "lab_estrellas";
            this.lab_estrellas.Size = new System.Drawing.Size(75, 20);
            this.lab_estrellas.TabIndex = 41;
            this.lab_estrellas.Text = "Estrellas";
            this.lab_estrellas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_nombre
            // 
            this.txt_nombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_nombre.Location = new System.Drawing.Point(207, 38);
            this.txt_nombre.Margin = new System.Windows.Forms.Padding(4);
            this.txt_nombre.Name = "txt_nombre";
            this.txt_nombre.Size = new System.Drawing.Size(351, 26);
            this.txt_nombre.TabIndex = 0;
            // 
            // lab_nombre
            // 
            this.lab_nombre.AutoSize = true;
            this.lab_nombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_nombre.Location = new System.Drawing.Point(123, 42);
            this.lab_nombre.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_nombre.Name = "lab_nombre";
            this.lab_nombre.Size = new System.Drawing.Size(68, 20);
            this.lab_nombre.TabIndex = 38;
            this.lab_nombre.Text = "Nombre";
            this.lab_nombre.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_mail
            // 
            this.txt_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_mail.Location = new System.Drawing.Point(207, 110);
            this.txt_mail.Margin = new System.Windows.Forms.Padding(4);
            this.txt_mail.Name = "txt_mail";
            this.txt_mail.Size = new System.Drawing.Size(351, 26);
            this.txt_mail.TabIndex = 3;
            // 
            // lab_mail
            // 
            this.lab_mail.AutoSize = true;
            this.lab_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_mail.Location = new System.Drawing.Point(155, 113);
            this.lab_mail.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_mail.Name = "lab_mail";
            this.lab_mail.Size = new System.Drawing.Size(40, 20);
            this.lab_mail.TabIndex = 32;
            this.lab_mail.Text = "Mail";
            this.lab_mail.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // cmb_recargaEstrellas
            // 
            this.cmb_recargaEstrellas.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_recargaEstrellas.FormattingEnabled = true;
            this.cmb_recargaEstrellas.Items.AddRange(new object[] {
            "1",
            "2",
            "3",
            "4",
            "5"});
            this.cmb_recargaEstrellas.Location = new System.Drawing.Point(439, 74);
            this.cmb_recargaEstrellas.Margin = new System.Windows.Forms.Padding(4);
            this.cmb_recargaEstrellas.Name = "cmb_recargaEstrellas";
            this.cmb_recargaEstrellas.Size = new System.Drawing.Size(119, 26);
            this.cmb_recargaEstrellas.TabIndex = 2;
            // 
            // lab_recargaEstrellas
            // 
            this.lab_recargaEstrellas.AutoSize = true;
            this.lab_recargaEstrellas.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_recargaEstrellas.Location = new System.Drawing.Point(316, 78);
            this.lab_recargaEstrellas.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_recargaEstrellas.Name = "lab_recargaEstrellas";
            this.lab_recargaEstrellas.Size = new System.Drawing.Size(106, 20);
            this.lab_recargaEstrellas.TabIndex = 65;
            this.lab_recargaEstrellas.Text = "Recarga Est.";
            this.lab_recargaEstrellas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // dtp_fechaCreacion
            // 
            this.dtp_fechaCreacion.CustomFormat = "yyyy/MM/dd HH:mm:ss";
            this.dtp_fechaCreacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtp_fechaCreacion.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtp_fechaCreacion.Location = new System.Drawing.Point(207, 283);
            this.dtp_fechaCreacion.Margin = new System.Windows.Forms.Padding(4);
            this.dtp_fechaCreacion.Name = "dtp_fechaCreacion";
            this.dtp_fechaCreacion.Size = new System.Drawing.Size(351, 26);
            this.dtp_fechaCreacion.TabIndex = 8;
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
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToResizeColumns = false;
            this.dataGridView1.AllowUserToResizeRows = false;
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codRegimenDataGridViewTextBoxColumn,
            this.descripcionDataGridViewTextBoxColumn,
            this.precioBaseDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.regimenBindingSource1;
            this.dataGridView1.Location = new System.Drawing.Point(22, 349);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(593, 153);
            this.dataGridView1.TabIndex = 66;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // codRegimenDataGridViewTextBoxColumn
            // 
            this.codRegimenDataGridViewTextBoxColumn.DataPropertyName = "codRegimen";
            this.codRegimenDataGridViewTextBoxColumn.HeaderText = "codRegimen";
            this.codRegimenDataGridViewTextBoxColumn.Name = "codRegimenDataGridViewTextBoxColumn";
            this.codRegimenDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // descripcionDataGridViewTextBoxColumn
            // 
            this.descripcionDataGridViewTextBoxColumn.DataPropertyName = "descripcion";
            this.descripcionDataGridViewTextBoxColumn.HeaderText = "descripcion";
            this.descripcionDataGridViewTextBoxColumn.Name = "descripcionDataGridViewTextBoxColumn";
            // 
            // precioBaseDataGridViewTextBoxColumn
            // 
            this.precioBaseDataGridViewTextBoxColumn.DataPropertyName = "precioBase";
            this.precioBaseDataGridViewTextBoxColumn.HeaderText = "precioBase";
            this.precioBaseDataGridViewTextBoxColumn.Name = "precioBaseDataGridViewTextBoxColumn";
            // 
            // regimenBindingSource1
            // 
            this.regimenBindingSource1.DataMember = "regimen";
            this.regimenBindingSource1.DataSource = this.gD1C2018DataSetBindingSource;
            // 
            // gD1C2018DataSetBindingSource
            // 
            this.gD1C2018DataSetBindingSource.DataSource = this.gD1C2018DataSet;
            this.gD1C2018DataSetBindingSource.Position = 0;
            // 
            // regimenTableAdapter
            // 
            this.regimenTableAdapter.ClearBeforeFill = true;
            // 
            // lbl_seleccionRegimenes
            // 
            this.lbl_seleccionRegimenes.AutoSize = true;
            this.lbl_seleccionRegimenes.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_seleccionRegimenes.Location = new System.Drawing.Point(18, 326);
            this.lbl_seleccionRegimenes.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_seleccionRegimenes.Name = "lbl_seleccionRegimenes";
            this.lbl_seleccionRegimenes.Size = new System.Drawing.Size(193, 20);
            this.lbl_seleccionRegimenes.TabIndex = 67;
            this.lbl_seleccionRegimenes.Text = "Seleccion de regimenes:";
            this.lbl_seleccionRegimenes.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // Hotel_Alta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(641, 585);
            this.Controls.Add(this.lbl_seleccionRegimenes);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.dtp_fechaCreacion);
            this.Controls.Add(this.cmb_recargaEstrellas);
            this.Controls.Add(this.lab_recargaEstrellas);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.btn_Guardar);
            this.Controls.Add(this.cmb_estrellas);
            this.Controls.Add(this.txt_pais);
            this.Controls.Add(this.lab_pais);
            this.Controls.Add(this.txt_ciudad);
            this.Controls.Add(this.lab_ciudad);
            this.Controls.Add(this.txt_direccion);
            this.Controls.Add(this.lab_direccion);
            this.Controls.Add(this.txt_telefono);
            this.Controls.Add(this.lab_telefono);
            this.Controls.Add(this.lab_fechaCreacion);
            this.Controls.Add(this.lab_estrellas);
            this.Controls.Add(this.txt_nombre);
            this.Controls.Add(this.lab_nombre);
            this.Controls.Add(this.txt_mail);
            this.Controls.Add(this.lab_mail);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "Hotel_Alta";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Nuevo Hotel";
            this.Load += new System.EventHandler(this.Hotel_Alta_Load);
            ((System.ComponentModel.ISupportInitialize)(this.regimenBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.regimenBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSetBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Guardar;
        private System.Windows.Forms.ComboBox cmb_estrellas;
        private System.Windows.Forms.TextBox txt_pais;
        private System.Windows.Forms.Label lab_pais;
        private System.Windows.Forms.TextBox txt_ciudad;
        private System.Windows.Forms.Label lab_ciudad;
        private System.Windows.Forms.TextBox txt_direccion;
        private System.Windows.Forms.Label lab_direccion;
        private System.Windows.Forms.TextBox txt_telefono;
        private System.Windows.Forms.Label lab_telefono;
        private System.Windows.Forms.Label lab_fechaCreacion;
        private System.Windows.Forms.Label lab_estrellas;
        private System.Windows.Forms.TextBox txt_nombre;
        private System.Windows.Forms.Label lab_nombre;
        private System.Windows.Forms.TextBox txt_mail;
        private System.Windows.Forms.Label lab_mail;
        private System.Windows.Forms.ComboBox cmb_recargaEstrellas;
        private System.Windows.Forms.Label lab_recargaEstrellas;
        private System.Windows.Forms.DateTimePicker dtp_fechaCreacion;
        private System.Windows.Forms.BindingSource regimenBindingSource;
        private GD1C2018DataSet gD1C2018DataSet;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.BindingSource gD1C2018DataSetBindingSource;
        private System.Windows.Forms.BindingSource regimenBindingSource1;
        private GD1C2018DataSetTableAdapters.regimenTableAdapter regimenTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn codRegimenDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn descripcionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn precioBaseDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label lbl_seleccionRegimenes;
    }
}
namespace FrbaHotel.AbmUsuario
{
    partial class Usuario_Alta
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
            this.txt_usuario = new System.Windows.Forms.TextBox();
            this.lab_usuario = new System.Windows.Forms.Label();
            this.txt_apellido = new System.Windows.Forms.TextBox();
            this.lab_apellido = new System.Windows.Forms.Label();
            this.txt_contraseña = new System.Windows.Forms.TextBox();
            this.lab_contraseña = new System.Windows.Forms.Label();
            this.txt_nombre = new System.Windows.Forms.TextBox();
            this.lab_nombre = new System.Windows.Forms.Label();
            this.chk_mostrarContraseña = new System.Windows.Forms.CheckBox();
            this.lab_fechaNac = new System.Windows.Forms.Label();
            this.txt_direccion = new System.Windows.Forms.TextBox();
            this.lab_direccion = new System.Windows.Forms.Label();
            this.txt_telefono = new System.Windows.Forms.TextBox();
            this.lab_telefono = new System.Windows.Forms.Label();
            this.txt_mail = new System.Windows.Forms.TextBox();
            this.lab_mail = new System.Windows.Forms.Label();
            this.txt_docNum = new System.Windows.Forms.TextBox();
            this.lab_docNum = new System.Windows.Forms.Label();
            this.lab_docTipo = new System.Windows.Forms.Label();
            this.cmb_docTipo = new System.Windows.Forms.ComboBox();
            this.lab_datosPersonales = new System.Windows.Forms.Label();
            this.dtp_fechaNac = new System.Windows.Forms.DateTimePicker();
            this.dgv_roles = new System.Windows.Forms.DataGridView();
            this.rolBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dgv_hoteles = new System.Windows.Forms.DataGridView();
            this.hotelBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lbl_seleccionRoles = new System.Windows.Forms.Label();
            this.lbl_seleccionHoteles = new System.Windows.Forms.Label();
            this.idHotelDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombreDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.direccionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ciudadDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gD1C2018DataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.gD1C2018DataSet = new FrbaHotel.GD1C2018DataSet();
            this.rolDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.rolTableAdapter = new FrbaHotel.GD1C2018DataSetTableAdapters.rolTableAdapter();
            this.hotelTableAdapter = new FrbaHotel.GD1C2018DataSetTableAdapters.hotelTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_roles)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rolBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_hoteles)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.hotelBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).BeginInit();
            this.SuspendLayout();
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(376, 430);
            this.btn_Limpiar.Margin = new System.Windows.Forms.Padding(4);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(265, 50);
            this.btn_Limpiar.TabIndex = 12;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Guardar
            // 
            this.btn_Guardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Guardar.Location = new System.Drawing.Point(664, 430);
            this.btn_Guardar.Margin = new System.Windows.Forms.Padding(4);
            this.btn_Guardar.Name = "btn_Guardar";
            this.btn_Guardar.Size = new System.Drawing.Size(265, 50);
            this.btn_Guardar.TabIndex = 11;
            this.btn_Guardar.Text = "Guardar";
            this.btn_Guardar.UseVisualStyleBackColor = true;
            this.btn_Guardar.Click += new System.EventHandler(this.btn_Guardar_Click);
            // 
            // txt_usuario
            // 
            this.txt_usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_usuario.Location = new System.Drawing.Point(239, 32);
            this.txt_usuario.Margin = new System.Windows.Forms.Padding(4);
            this.txt_usuario.Name = "txt_usuario";
            this.txt_usuario.Size = new System.Drawing.Size(343, 26);
            this.txt_usuario.TabIndex = 0;
            // 
            // lab_usuario
            // 
            this.lab_usuario.AutoSize = true;
            this.lab_usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_usuario.Location = new System.Drawing.Point(63, 36);
            this.lab_usuario.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_usuario.Name = "lab_usuario";
            this.lab_usuario.Size = new System.Drawing.Size(154, 20);
            this.lab_usuario.TabIndex = 38;
            this.lab_usuario.Text = "Nombre de Usuario";
            this.lab_usuario.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.lab_usuario.Click += new System.EventHandler(this.lab_nombre_Click);
            // 
            // txt_apellido
            // 
            this.txt_apellido.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_apellido.Location = new System.Drawing.Point(307, 183);
            this.txt_apellido.Margin = new System.Windows.Forms.Padding(4);
            this.txt_apellido.Name = "txt_apellido";
            this.txt_apellido.Size = new System.Drawing.Size(279, 26);
            this.txt_apellido.TabIndex = 4;
            // 
            // lab_apellido
            // 
            this.lab_apellido.AutoSize = true;
            this.lab_apellido.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_apellido.Location = new System.Drawing.Point(223, 187);
            this.lab_apellido.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_apellido.Name = "lab_apellido";
            this.lab_apellido.Size = new System.Drawing.Size(68, 20);
            this.lab_apellido.TabIndex = 36;
            this.lab_apellido.Text = "Apellido";
            this.lab_apellido.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_contraseña
            // 
            this.txt_contraseña.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_contraseña.Location = new System.Drawing.Point(239, 66);
            this.txt_contraseña.Margin = new System.Windows.Forms.Padding(4);
            this.txt_contraseña.Name = "txt_contraseña";
            this.txt_contraseña.PasswordChar = '●';
            this.txt_contraseña.Size = new System.Drawing.Size(343, 26);
            this.txt_contraseña.TabIndex = 1;
            // 
            // lab_contraseña
            // 
            this.lab_contraseña.AutoSize = true;
            this.lab_contraseña.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_contraseña.Location = new System.Drawing.Point(128, 70);
            this.lab_contraseña.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_contraseña.Name = "lab_contraseña";
            this.lab_contraseña.Size = new System.Drawing.Size(95, 20);
            this.lab_contraseña.TabIndex = 29;
            this.lab_contraseña.Text = "Contraseña";
            this.lab_contraseña.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.lab_contraseña.Click += new System.EventHandler(this.lab_numID_Click);
            // 
            // txt_nombre
            // 
            this.txt_nombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_nombre.Location = new System.Drawing.Point(307, 149);
            this.txt_nombre.Margin = new System.Windows.Forms.Padding(4);
            this.txt_nombre.Name = "txt_nombre";
            this.txt_nombre.Size = new System.Drawing.Size(279, 26);
            this.txt_nombre.TabIndex = 3;
            // 
            // lab_nombre
            // 
            this.lab_nombre.AutoSize = true;
            this.lab_nombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_nombre.Location = new System.Drawing.Point(223, 153);
            this.lab_nombre.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_nombre.Name = "lab_nombre";
            this.lab_nombre.Size = new System.Drawing.Size(68, 20);
            this.lab_nombre.TabIndex = 62;
            this.lab_nombre.Text = "Nombre";
            this.lab_nombre.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // chk_mostrarContraseña
            // 
            this.chk_mostrarContraseña.AutoSize = true;
            this.chk_mostrarContraseña.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_mostrarContraseña.Location = new System.Drawing.Point(277, 97);
            this.chk_mostrarContraseña.Margin = new System.Windows.Forms.Padding(4);
            this.chk_mostrarContraseña.Name = "chk_mostrarContraseña";
            this.chk_mostrarContraseña.Size = new System.Drawing.Size(177, 24);
            this.chk_mostrarContraseña.TabIndex = 2;
            this.chk_mostrarContraseña.Text = "Mostrar contraseña";
            this.chk_mostrarContraseña.UseVisualStyleBackColor = true;
            this.chk_mostrarContraseña.CheckedChanged += new System.EventHandler(this.chk_mostrarContraseña_CheckedChanged);
            // 
            // lab_fechaNac
            // 
            this.lab_fechaNac.AutoSize = true;
            this.lab_fechaNac.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_fechaNac.Location = new System.Drawing.Point(171, 362);
            this.lab_fechaNac.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_fechaNac.Name = "lab_fechaNac";
            this.lab_fechaNac.Size = new System.Drawing.Size(117, 20);
            this.lab_fechaNac.TabIndex = 66;
            this.lab_fechaNac.Text = "Fecha de Nac.";
            this.lab_fechaNac.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_direccion
            // 
            this.txt_direccion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_direccion.Location = new System.Drawing.Point(307, 324);
            this.txt_direccion.Margin = new System.Windows.Forms.Padding(4);
            this.txt_direccion.Name = "txt_direccion";
            this.txt_direccion.Size = new System.Drawing.Size(279, 26);
            this.txt_direccion.TabIndex = 9;
            // 
            // lab_direccion
            // 
            this.lab_direccion.AutoSize = true;
            this.lab_direccion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_direccion.Location = new System.Drawing.Point(212, 327);
            this.lab_direccion.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_direccion.Name = "lab_direccion";
            this.lab_direccion.Size = new System.Drawing.Size(81, 20);
            this.lab_direccion.TabIndex = 69;
            this.lab_direccion.Text = "Dirección";
            this.lab_direccion.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_telefono
            // 
            this.txt_telefono.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_telefono.Location = new System.Drawing.Point(307, 289);
            this.txt_telefono.Margin = new System.Windows.Forms.Padding(4);
            this.txt_telefono.Name = "txt_telefono";
            this.txt_telefono.Size = new System.Drawing.Size(279, 26);
            this.txt_telefono.TabIndex = 8;
            this.txt_telefono.TextChanged += new System.EventHandler(this.txt_telefono_TextChanged);
            // 
            // lab_telefono
            // 
            this.lab_telefono.AutoSize = true;
            this.lab_telefono.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_telefono.Location = new System.Drawing.Point(217, 293);
            this.lab_telefono.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_telefono.Name = "lab_telefono";
            this.lab_telefono.Size = new System.Drawing.Size(73, 20);
            this.lab_telefono.TabIndex = 66;
            this.lab_telefono.Text = "Teléfono";
            this.lab_telefono.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_mail
            // 
            this.txt_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_mail.Location = new System.Drawing.Point(307, 255);
            this.txt_mail.Margin = new System.Windows.Forms.Padding(4);
            this.txt_mail.Name = "txt_mail";
            this.txt_mail.Size = new System.Drawing.Size(279, 26);
            this.txt_mail.TabIndex = 7;
            // 
            // lab_mail
            // 
            this.lab_mail.AutoSize = true;
            this.lab_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_mail.Location = new System.Drawing.Point(255, 259);
            this.lab_mail.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_mail.Name = "lab_mail";
            this.lab_mail.Size = new System.Drawing.Size(40, 20);
            this.lab_mail.TabIndex = 65;
            this.lab_mail.Text = "Mail";
            this.lab_mail.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_docNum
            // 
            this.txt_docNum.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_docNum.Location = new System.Drawing.Point(483, 218);
            this.txt_docNum.Margin = new System.Windows.Forms.Padding(4);
            this.txt_docNum.Name = "txt_docNum";
            this.txt_docNum.Size = new System.Drawing.Size(103, 26);
            this.txt_docNum.TabIndex = 6;
            // 
            // lab_docNum
            // 
            this.lab_docNum.AutoSize = true;
            this.lab_docNum.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_docNum.Location = new System.Drawing.Point(404, 222);
            this.lab_docNum.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_docNum.Name = "lab_docNum";
            this.lab_docNum.Size = new System.Drawing.Size(68, 20);
            this.lab_docNum.TabIndex = 65;
            this.lab_docNum.Text = "Número";
            this.lab_docNum.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_docTipo
            // 
            this.lab_docTipo.AutoSize = true;
            this.lab_docTipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_docTipo.Location = new System.Drawing.Point(196, 222);
            this.lab_docTipo.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_docTipo.Name = "lab_docTipo";
            this.lab_docTipo.Size = new System.Drawing.Size(95, 20);
            this.lab_docTipo.TabIndex = 67;
            this.lab_docTipo.Text = "Documento";
            this.lab_docTipo.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // cmb_docTipo
            // 
            this.cmb_docTipo.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_docTipo.FormattingEnabled = true;
            this.cmb_docTipo.Items.AddRange(new object[] {
            "pasaporte",
            "documento"});
            this.cmb_docTipo.Location = new System.Drawing.Point(307, 218);
            this.cmb_docTipo.Margin = new System.Windows.Forms.Padding(4);
            this.cmb_docTipo.Name = "cmb_docTipo";
            this.cmb_docTipo.Size = new System.Drawing.Size(73, 28);
            this.cmb_docTipo.TabIndex = 5;
            this.cmb_docTipo.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // lab_datosPersonales
            // 
            this.lab_datosPersonales.AutoSize = true;
            this.lab_datosPersonales.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_datosPersonales.Location = new System.Drawing.Point(44, 153);
            this.lab_datosPersonales.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lab_datosPersonales.Name = "lab_datosPersonales";
            this.lab_datosPersonales.Size = new System.Drawing.Size(148, 20);
            this.lab_datosPersonales.TabIndex = 70;
            this.lab_datosPersonales.Text = "Datos Personales:";
            this.lab_datosPersonales.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // dtp_fechaNac
            // 
            this.dtp_fechaNac.CustomFormat = "yyyy/MM/dd HH:mm:ss";
            this.dtp_fechaNac.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtp_fechaNac.Location = new System.Drawing.Point(307, 362);
            this.dtp_fechaNac.Name = "dtp_fechaNac";
            this.dtp_fechaNac.Size = new System.Drawing.Size(279, 22);
            this.dtp_fechaNac.TabIndex = 71;
            // 
            // dgv_roles
            // 
            this.dgv_roles.AllowUserToAddRows = false;
            this.dgv_roles.AllowUserToDeleteRows = false;
            this.dgv_roles.AutoGenerateColumns = false;
            this.dgv_roles.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_roles.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.rolDataGridViewTextBoxColumn});
            this.dgv_roles.DataSource = this.rolBindingSource;
            this.dgv_roles.Location = new System.Drawing.Point(820, 37);
            this.dgv_roles.Name = "dgv_roles";
            this.dgv_roles.RowTemplate.Height = 24;
            this.dgv_roles.Size = new System.Drawing.Size(336, 150);
            this.dgv_roles.TabIndex = 72;
            this.dgv_roles.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // rolBindingSource
            // 
            this.rolBindingSource.DataMember = "rol";
            this.rolBindingSource.DataSource = this.gD1C2018DataSetBindingSource;
            // 
            // dgv_hoteles
            // 
            this.dgv_hoteles.AllowUserToAddRows = false;
            this.dgv_hoteles.AllowUserToDeleteRows = false;
            this.dgv_hoteles.AutoGenerateColumns = false;
            this.dgv_hoteles.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_hoteles.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.idHotelDataGridViewTextBoxColumn,
            this.nombreDataGridViewTextBoxColumn,
            this.direccionDataGridViewTextBoxColumn,
            this.ciudadDataGridViewTextBoxColumn});
            this.dgv_hoteles.DataSource = this.hotelBindingSource;
            this.dgv_hoteles.Location = new System.Drawing.Point(641, 224);
            this.dgv_hoteles.Name = "dgv_hoteles";
            this.dgv_hoteles.RowTemplate.Height = 24;
            this.dgv_hoteles.Size = new System.Drawing.Size(683, 176);
            this.dgv_hoteles.TabIndex = 73;
            this.dgv_hoteles.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_hoteles_CellContentClick);
            // 
            // hotelBindingSource
            // 
            this.hotelBindingSource.DataMember = "hotel";
            this.hotelBindingSource.DataSource = this.gD1C2018DataSetBindingSource;
            // 
            // lbl_seleccionRoles
            // 
            this.lbl_seleccionRoles.AutoSize = true;
            this.lbl_seleccionRoles.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_seleccionRoles.Location = new System.Drawing.Point(637, 36);
            this.lbl_seleccionRoles.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_seleccionRoles.Name = "lbl_seleccionRoles";
            this.lbl_seleccionRoles.Size = new System.Drawing.Size(152, 20);
            this.lbl_seleccionRoles.TabIndex = 74;
            this.lbl_seleccionRoles.Text = "Seleccion de roles:";
            this.lbl_seleccionRoles.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lbl_seleccionHoteles
            // 
            this.lbl_seleccionHoteles.AutoSize = true;
            this.lbl_seleccionHoteles.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_seleccionHoteles.Location = new System.Drawing.Point(637, 201);
            this.lbl_seleccionHoteles.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_seleccionHoteles.Name = "lbl_seleccionHoteles";
            this.lbl_seleccionHoteles.Size = new System.Drawing.Size(169, 20);
            this.lbl_seleccionHoteles.TabIndex = 75;
            this.lbl_seleccionHoteles.Text = "Seleccion de hoteles:";
            this.lbl_seleccionHoteles.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // idHotelDataGridViewTextBoxColumn
            // 
            this.idHotelDataGridViewTextBoxColumn.DataPropertyName = "idHotel";
            this.idHotelDataGridViewTextBoxColumn.HeaderText = "idHotel";
            this.idHotelDataGridViewTextBoxColumn.Name = "idHotelDataGridViewTextBoxColumn";
            this.idHotelDataGridViewTextBoxColumn.ReadOnly = true;
            this.idHotelDataGridViewTextBoxColumn.Width = 50;
            // 
            // nombreDataGridViewTextBoxColumn
            // 
            this.nombreDataGridViewTextBoxColumn.DataPropertyName = "nombre";
            this.nombreDataGridViewTextBoxColumn.HeaderText = "nombre";
            this.nombreDataGridViewTextBoxColumn.Name = "nombreDataGridViewTextBoxColumn";
            // 
            // direccionDataGridViewTextBoxColumn
            // 
            this.direccionDataGridViewTextBoxColumn.DataPropertyName = "direccion";
            this.direccionDataGridViewTextBoxColumn.HeaderText = "direccion";
            this.direccionDataGridViewTextBoxColumn.Name = "direccionDataGridViewTextBoxColumn";
            // 
            // ciudadDataGridViewTextBoxColumn
            // 
            this.ciudadDataGridViewTextBoxColumn.DataPropertyName = "ciudad";
            this.ciudadDataGridViewTextBoxColumn.HeaderText = "ciudad";
            this.ciudadDataGridViewTextBoxColumn.Name = "ciudadDataGridViewTextBoxColumn";
            // 
            // gD1C2018DataSetBindingSource
            // 
            this.gD1C2018DataSetBindingSource.DataSource = this.gD1C2018DataSet;
            this.gD1C2018DataSetBindingSource.Position = 0;
            // 
            // gD1C2018DataSet
            // 
            this.gD1C2018DataSet.DataSetName = "GD1C2018DataSet";
            this.gD1C2018DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // rolDataGridViewTextBoxColumn
            // 
            this.rolDataGridViewTextBoxColumn.DataPropertyName = "rol";
            this.rolDataGridViewTextBoxColumn.HeaderText = "rol";
            this.rolDataGridViewTextBoxColumn.Name = "rolDataGridViewTextBoxColumn";
            // 
            // rolTableAdapter
            // 
            this.rolTableAdapter.ClearBeforeFill = true;
            // 
            // hotelTableAdapter
            // 
            this.hotelTableAdapter.ClearBeforeFill = true;
            // 
            // Usuario_Alta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1351, 499);
            this.Controls.Add(this.lbl_seleccionHoteles);
            this.Controls.Add(this.lbl_seleccionRoles);
            this.Controls.Add(this.dgv_hoteles);
            this.Controls.Add(this.dgv_roles);
            this.Controls.Add(this.dtp_fechaNac);
            this.Controls.Add(this.lab_datosPersonales);
            this.Controls.Add(this.lab_fechaNac);
            this.Controls.Add(this.txt_direccion);
            this.Controls.Add(this.chk_mostrarContraseña);
            this.Controls.Add(this.lab_direccion);
            this.Controls.Add(this.txt_telefono);
            this.Controls.Add(this.lab_telefono);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.txt_mail);
            this.Controls.Add(this.btn_Guardar);
            this.Controls.Add(this.lab_mail);
            this.Controls.Add(this.txt_usuario);
            this.Controls.Add(this.txt_docNum);
            this.Controls.Add(this.lab_usuario);
            this.Controls.Add(this.lab_docNum);
            this.Controls.Add(this.txt_contraseña);
            this.Controls.Add(this.lab_docTipo);
            this.Controls.Add(this.lab_contraseña);
            this.Controls.Add(this.cmb_docTipo);
            this.Controls.Add(this.txt_nombre);
            this.Controls.Add(this.lab_nombre);
            this.Controls.Add(this.lab_apellido);
            this.Controls.Add(this.txt_apellido);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "Usuario_Alta";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Nuevo Usuario";
            this.Load += new System.EventHandler(this.Usuario_Alta_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_roles)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rolBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_hoteles)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.hotelBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Guardar;
        private System.Windows.Forms.TextBox txt_usuario;
        private System.Windows.Forms.Label lab_usuario;
        private System.Windows.Forms.TextBox txt_apellido;
        private System.Windows.Forms.Label lab_apellido;
        private System.Windows.Forms.TextBox txt_contraseña;
        private System.Windows.Forms.Label lab_contraseña;
        private System.Windows.Forms.TextBox txt_nombre;
        private System.Windows.Forms.Label lab_nombre;
        private System.Windows.Forms.CheckBox chk_mostrarContraseña;
        private System.Windows.Forms.Label lab_docTipo;
        private System.Windows.Forms.ComboBox cmb_docTipo;
        private System.Windows.Forms.Label lab_docNum;
        private System.Windows.Forms.TextBox txt_mail;
        private System.Windows.Forms.Label lab_mail;
        private System.Windows.Forms.TextBox txt_docNum;
        private System.Windows.Forms.Label lab_fechaNac;
        private System.Windows.Forms.TextBox txt_direccion;
        private System.Windows.Forms.Label lab_direccion;
        private System.Windows.Forms.TextBox txt_telefono;
        private System.Windows.Forms.Label lab_telefono;
        private System.Windows.Forms.Label lab_datosPersonales;
        private System.Windows.Forms.DateTimePicker dtp_fechaNac;
        private System.Windows.Forms.DataGridView dgv_roles;
        private System.Windows.Forms.BindingSource gD1C2018DataSetBindingSource;
        private GD1C2018DataSet gD1C2018DataSet;
        private System.Windows.Forms.BindingSource rolBindingSource;
        private GD1C2018DataSetTableAdapters.rolTableAdapter rolTableAdapter;
        private System.Windows.Forms.DataGridView dgv_hoteles;
        private System.Windows.Forms.BindingSource hotelBindingSource;
        private GD1C2018DataSetTableAdapters.hotelTableAdapter hotelTableAdapter;
        private System.Windows.Forms.Label lbl_seleccionRoles;
        private System.Windows.Forms.Label lbl_seleccionHoteles;
        private System.Windows.Forms.DataGridViewTextBoxColumn rolDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn idHotelDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombreDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn direccionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ciudadDataGridViewTextBoxColumn;
    }
}
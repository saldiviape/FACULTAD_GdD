namespace FrbaHotel.GenerarModificacionReserva
{
    partial class GenerarReserva
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
            this.txt_nombre = new System.Windows.Forms.TextBox();
            this.cmb_hotel = new System.Windows.Forms.ComboBox();
            this.lab_hotel = new System.Windows.Forms.Label();
            this.lab_regimen = new System.Windows.Forms.Label();
            this.cmb_regimen = new System.Windows.Forms.ComboBox();
            this.lab_tipoHabitacion = new System.Windows.Forms.Label();
            this.cmb_tipoHabitacion = new System.Windows.Forms.ComboBox();
            this.lab_usuario = new System.Windows.Forms.Label();
            this.btn_Limpiar = new System.Windows.Forms.Button();
            this.btn_Guardar = new System.Windows.Forms.Button();
            this.lab_desde = new System.Windows.Forms.Label();
            this.dtp_desde = new System.Windows.Forms.DateTimePicker();
            this.dtp_hasta = new System.Windows.Forms.DateTimePicker();
            this.lab_hasta = new System.Windows.Forms.Label();
            this.lab_mailCliente = new System.Windows.Forms.Label();
            this.txt_idCliente = new System.Windows.Forms.TextBox();
            this.lab_idCliente = new System.Windows.Forms.Label();
            this.txt_mailCliente = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // txt_nombre
            // 
            this.txt_nombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_nombre.Location = new System.Drawing.Point(162, 29);
            this.txt_nombre.Name = "txt_nombre";
            this.txt_nombre.Size = new System.Drawing.Size(267, 22);
            this.txt_nombre.TabIndex = 0;
            // 
            // cmb_hotel
            // 
            this.cmb_hotel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_hotel.FormattingEnabled = true;
            this.cmb_hotel.Items.AddRange(new object[] {
            "(...)"});
            this.cmb_hotel.Location = new System.Drawing.Point(162, 57);
            this.cmb_hotel.Name = "cmb_hotel";
            this.cmb_hotel.Size = new System.Drawing.Size(267, 24);
            this.cmb_hotel.TabIndex = 1;
            // 
            // lab_hotel
            // 
            this.lab_hotel.AutoSize = true;
            this.lab_hotel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_hotel.Location = new System.Drawing.Point(116, 60);
            this.lab_hotel.Name = "lab_hotel";
            this.lab_hotel.Size = new System.Drawing.Size(40, 16);
            this.lab_hotel.TabIndex = 40;
            this.lab_hotel.Text = "Hotel";
            this.lab_hotel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_regimen
            // 
            this.lab_regimen.AutoSize = true;
            this.lab_regimen.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_regimen.Location = new System.Drawing.Point(25, 174);
            this.lab_regimen.Name = "lab_regimen";
            this.lab_regimen.Size = new System.Drawing.Size(131, 16);
            this.lab_regimen.TabIndex = 41;
            this.lab_regimen.Text = "Régimen de Estadía";
            this.lab_regimen.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // cmb_regimen
            // 
            this.cmb_regimen.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_regimen.FormattingEnabled = true;
            this.cmb_regimen.Items.AddRange(new object[] {
            "(...)",
            "Pension Completa",
            "Media Pensión",
            "All Inclusive moderado",
            "All inclusive"});
            this.cmb_regimen.Location = new System.Drawing.Point(162, 169);
            this.cmb_regimen.Name = "cmb_regimen";
            this.cmb_regimen.Size = new System.Drawing.Size(267, 24);
            this.cmb_regimen.TabIndex = 4;
            this.cmb_regimen.SelectedIndexChanged += new System.EventHandler(this.cmb_regimen_SelectedIndexChanged);
            // 
            // lab_tipoHabitacion
            // 
            this.lab_tipoHabitacion.AutoSize = true;
            this.lab_tipoHabitacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_tipoHabitacion.Location = new System.Drawing.Point(33, 201);
            this.lab_tipoHabitacion.Name = "lab_tipoHabitacion";
            this.lab_tipoHabitacion.Size = new System.Drawing.Size(123, 16);
            this.lab_tipoHabitacion.TabIndex = 43;
            this.lab_tipoHabitacion.Text = "Tipo de Habitación";
            this.lab_tipoHabitacion.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // cmb_tipoHabitacion
            // 
            this.cmb_tipoHabitacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmb_tipoHabitacion.FormattingEnabled = true;
            this.cmb_tipoHabitacion.Items.AddRange(new object[] {
            "(...)",
            "Base Simple",
            "Base Doble",
            "Base Triple",
            "Base Cuadruple",
            "King"});
            this.cmb_tipoHabitacion.Location = new System.Drawing.Point(162, 199);
            this.cmb_tipoHabitacion.Name = "cmb_tipoHabitacion";
            this.cmb_tipoHabitacion.Size = new System.Drawing.Size(267, 24);
            this.cmb_tipoHabitacion.TabIndex = 5;
            // 
            // lab_usuario
            // 
            this.lab_usuario.AutoSize = true;
            this.lab_usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_usuario.Location = new System.Drawing.Point(101, 32);
            this.lab_usuario.Name = "lab_usuario";
            this.lab_usuario.Size = new System.Drawing.Size(55, 16);
            this.lab_usuario.TabIndex = 45;
            this.lab_usuario.Text = "Usuario";
            this.lab_usuario.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(28, 308);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(196, 41);
            this.btn_Limpiar.TabIndex = 9;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Guardar
            // 
            this.btn_Guardar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Guardar.Location = new System.Drawing.Point(233, 308);
            this.btn_Guardar.Name = "btn_Guardar";
            this.btn_Guardar.Size = new System.Drawing.Size(196, 41);
            this.btn_Guardar.TabIndex = 8;
            this.btn_Guardar.Text = "Guardar";
            this.btn_Guardar.UseVisualStyleBackColor = true;
            // 
            // lab_desde
            // 
            this.lab_desde.AutoSize = true;
            this.lab_desde.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_desde.Location = new System.Drawing.Point(111, 232);
            this.lab_desde.Name = "lab_desde";
            this.lab_desde.Size = new System.Drawing.Size(49, 16);
            this.lab_desde.TabIndex = 65;
            this.lab_desde.Text = "Desde";
            this.lab_desde.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // dtp_desde
            // 
            this.dtp_desde.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtp_desde.Location = new System.Drawing.Point(162, 229);
            this.dtp_desde.Name = "dtp_desde";
            this.dtp_desde.Size = new System.Drawing.Size(267, 22);
            this.dtp_desde.TabIndex = 6;
            // 
            // dtp_hasta
            // 
            this.dtp_hasta.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtp_hasta.Location = new System.Drawing.Point(162, 257);
            this.dtp_hasta.Name = "dtp_hasta";
            this.dtp_hasta.Size = new System.Drawing.Size(267, 22);
            this.dtp_hasta.TabIndex = 7;
            // 
            // lab_hasta
            // 
            this.lab_hasta.AutoSize = true;
            this.lab_hasta.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_hasta.Location = new System.Drawing.Point(116, 262);
            this.lab_hasta.Name = "lab_hasta";
            this.lab_hasta.Size = new System.Drawing.Size(44, 16);
            this.lab_hasta.TabIndex = 67;
            this.lab_hasta.Text = "Hasta";
            this.lab_hasta.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_mailCliente
            // 
            this.lab_mailCliente.AutoSize = true;
            this.lab_mailCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_mailCliente.Location = new System.Drawing.Point(62, 128);
            this.lab_mailCliente.Name = "lab_mailCliente";
            this.lab_mailCliente.Size = new System.Drawing.Size(99, 16);
            this.lab_mailCliente.TabIndex = 73;
            this.lab_mailCliente.Text = "Mail del Cliente";
            this.lab_mailCliente.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_idCliente
            // 
            this.txt_idCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_idCliente.Location = new System.Drawing.Point(162, 97);
            this.txt_idCliente.Name = "txt_idCliente";
            this.txt_idCliente.Size = new System.Drawing.Size(267, 22);
            this.txt_idCliente.TabIndex = 2;
            // 
            // lab_idCliente
            // 
            this.lab_idCliente.AutoSize = true;
            this.lab_idCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_idCliente.Location = new System.Drawing.Point(74, 100);
            this.lab_idCliente.Name = "lab_idCliente";
            this.lab_idCliente.Size = new System.Drawing.Size(87, 16);
            this.lab_idCliente.TabIndex = 72;
            this.lab_idCliente.Text = "ID del Cliente";
            this.lab_idCliente.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_mailCliente
            // 
            this.txt_mailCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_mailCliente.Location = new System.Drawing.Point(162, 125);
            this.txt_mailCliente.Name = "txt_mailCliente";
            this.txt_mailCliente.Size = new System.Drawing.Size(267, 22);
            this.txt_mailCliente.TabIndex = 3;
            // 
            // GenerarReserva
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(458, 375);
            this.Controls.Add(this.lab_mailCliente);
            this.Controls.Add(this.txt_idCliente);
            this.Controls.Add(this.lab_idCliente);
            this.Controls.Add(this.dtp_hasta);
            this.Controls.Add(this.txt_mailCliente);
            this.Controls.Add(this.lab_hasta);
            this.Controls.Add(this.dtp_desde);
            this.Controls.Add(this.lab_desde);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.btn_Guardar);
            this.Controls.Add(this.lab_usuario);
            this.Controls.Add(this.cmb_tipoHabitacion);
            this.Controls.Add(this.lab_tipoHabitacion);
            this.Controls.Add(this.cmb_regimen);
            this.Controls.Add(this.lab_regimen);
            this.Controls.Add(this.cmb_hotel);
            this.Controls.Add(this.lab_hotel);
            this.Controls.Add(this.txt_nombre);
            this.MaximizeBox = false;
            this.Name = "GenerarReserva";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Generar Reserva";
            this.Load += new System.EventHandler(this.Reserva_Alta_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txt_nombre;
        private System.Windows.Forms.ComboBox cmb_hotel;
        private System.Windows.Forms.Label lab_hotel;
        private System.Windows.Forms.Label lab_regimen;
        private System.Windows.Forms.ComboBox cmb_regimen;
        private System.Windows.Forms.Label lab_tipoHabitacion;
        private System.Windows.Forms.ComboBox cmb_tipoHabitacion;
        private System.Windows.Forms.Label lab_usuario;
        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Guardar;
        private System.Windows.Forms.Label lab_desde;
        private System.Windows.Forms.DateTimePicker dtp_desde;
        private System.Windows.Forms.DateTimePicker dtp_hasta;
        private System.Windows.Forms.Label lab_hasta;
        private System.Windows.Forms.Label lab_mailCliente;
        private System.Windows.Forms.TextBox txt_idCliente;
        private System.Windows.Forms.Label lab_idCliente;
        private System.Windows.Forms.TextBox txt_mailCliente;
    }
}
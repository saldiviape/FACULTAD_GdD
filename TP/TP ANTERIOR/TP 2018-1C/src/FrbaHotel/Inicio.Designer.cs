namespace FrbaHotel
{
    partial class frm_Inicio
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.lab_FRBAHOTEL = new System.Windows.Forms.Label();
            this.btn_Ingresar = new System.Windows.Forms.Button();
            this.btn_generarReserva = new System.Windows.Forms.Button();
            this.btn_modificarReserva = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lab_FRBAHOTEL
            // 
            this.lab_FRBAHOTEL.AutoSize = true;
            this.lab_FRBAHOTEL.Font = new System.Drawing.Font("Calibri", 48F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_FRBAHOTEL.ForeColor = System.Drawing.Color.Black;
            this.lab_FRBAHOTEL.Location = new System.Drawing.Point(19, 18);
            this.lab_FRBAHOTEL.Name = "lab_FRBAHOTEL";
            this.lab_FRBAHOTEL.Size = new System.Drawing.Size(358, 78);
            this.lab_FRBAHOTEL.TabIndex = 1;
            this.lab_FRBAHOTEL.Text = "FRBA HOTEL";
            // 
            // btn_Ingresar
            // 
            this.btn_Ingresar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Ingresar.Location = new System.Drawing.Point(33, 164);
            this.btn_Ingresar.Name = "btn_Ingresar";
            this.btn_Ingresar.Size = new System.Drawing.Size(331, 36);
            this.btn_Ingresar.TabIndex = 2;
            this.btn_Ingresar.Text = "Ingresar al Sistema";
            this.btn_Ingresar.UseVisualStyleBackColor = true;
            this.btn_Ingresar.Click += new System.EventHandler(this.btn_IngresarAlSistema_Click);
            // 
            // btn_generarReserva
            // 
            this.btn_generarReserva.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_generarReserva.Location = new System.Drawing.Point(32, 117);
            this.btn_generarReserva.Name = "btn_generarReserva";
            this.btn_generarReserva.Size = new System.Drawing.Size(163, 36);
            this.btn_generarReserva.TabIndex = 0;
            this.btn_generarReserva.Text = "Generar Reserva";
            this.btn_generarReserva.UseVisualStyleBackColor = true;
            this.btn_generarReserva.Click += new System.EventHandler(this.button1_Click);
            // 
            // btn_modificarReserva
            // 
            this.btn_modificarReserva.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_modificarReserva.Location = new System.Drawing.Point(201, 117);
            this.btn_modificarReserva.Name = "btn_modificarReserva";
            this.btn_modificarReserva.Size = new System.Drawing.Size(163, 36);
            this.btn_modificarReserva.TabIndex = 1;
            this.btn_modificarReserva.Text = "Modificar Reserva";
            this.btn_modificarReserva.UseVisualStyleBackColor = true;
            this.btn_modificarReserva.Click += new System.EventHandler(this.button2_Click);
            // 
            // frm_Inicio
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(396, 235);
            this.Controls.Add(this.btn_modificarReserva);
            this.Controls.Add(this.btn_generarReserva);
            this.Controls.Add(this.btn_Ingresar);
            this.Controls.Add(this.lab_FRBAHOTEL);
            this.MaximizeBox = false;
            this.Name = "frm_Inicio";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Inicio";
            this.Load += new System.EventHandler(this.frm_Inicio_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lab_FRBAHOTEL;
        private System.Windows.Forms.Button btn_Ingresar;
        private System.Windows.Forms.Button btn_generarReserva;
        private System.Windows.Forms.Button btn_modificarReserva;
    }
}


namespace FrbaHotel.Login
{
    partial class Login
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
            this.lab_Usuario = new System.Windows.Forms.Label();
            this.lab_Contraseña = new System.Windows.Forms.Label();
            this.txt_Usuario = new System.Windows.Forms.TextBox();
            this.txt_Contraseña = new System.Windows.Forms.TextBox();
            this.chk_MostrarContraseña = new System.Windows.Forms.CheckBox();
            this.btn_IniciarSesion = new System.Windows.Forms.Button();
            this.btn_Volver = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lab_Usuario
            // 
            this.lab_Usuario.AutoSize = true;
            this.lab_Usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_Usuario.Location = new System.Drawing.Point(43, 27);
            this.lab_Usuario.Name = "lab_Usuario";
            this.lab_Usuario.Size = new System.Drawing.Size(55, 16);
            this.lab_Usuario.TabIndex = 1;
            this.lab_Usuario.Text = "Usuario";
            this.lab_Usuario.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // lab_Contraseña
            // 
            this.lab_Contraseña.AutoSize = true;
            this.lab_Contraseña.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_Contraseña.Location = new System.Drawing.Point(21, 59);
            this.lab_Contraseña.Name = "lab_Contraseña";
            this.lab_Contraseña.Size = new System.Drawing.Size(77, 16);
            this.lab_Contraseña.TabIndex = 2;
            this.lab_Contraseña.Text = "Contraseña";
            // 
            // txt_Usuario
            // 
            this.txt_Usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_Usuario.Location = new System.Drawing.Point(99, 24);
            this.txt_Usuario.Name = "txt_Usuario";
            this.txt_Usuario.Size = new System.Drawing.Size(149, 22);
            this.txt_Usuario.TabIndex = 0;
            this.txt_Usuario.TextChanged += new System.EventHandler(this.txt_Usuario_TextChanged);
            // 
            // txt_Contraseña
            // 
            this.txt_Contraseña.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_Contraseña.Location = new System.Drawing.Point(99, 56);
            this.txt_Contraseña.Name = "txt_Contraseña";
            this.txt_Contraseña.PasswordChar = '●';
            this.txt_Contraseña.Size = new System.Drawing.Size(149, 22);
            this.txt_Contraseña.TabIndex = 1;
            this.txt_Contraseña.TextChanged += new System.EventHandler(this.txt_Contraseña_TextChanged);
            // 
            // chk_MostrarContraseña
            // 
            this.chk_MostrarContraseña.AutoSize = true;
            this.chk_MostrarContraseña.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_MostrarContraseña.Location = new System.Drawing.Point(99, 84);
            this.chk_MostrarContraseña.Name = "chk_MostrarContraseña";
            this.chk_MostrarContraseña.Size = new System.Drawing.Size(142, 20);
            this.chk_MostrarContraseña.TabIndex = 2;
            this.chk_MostrarContraseña.Text = "Mostrar contraseña";
            this.chk_MostrarContraseña.UseVisualStyleBackColor = true;
            this.chk_MostrarContraseña.CheckedChanged += new System.EventHandler(this.chk_MostrarContraseña_CheckedChanged);
            // 
            // btn_IniciarSesion
            // 
            this.btn_IniciarSesion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_IniciarSesion.Location = new System.Drawing.Point(144, 123);
            this.btn_IniciarSesion.Name = "btn_IniciarSesion";
            this.btn_IniciarSesion.Size = new System.Drawing.Size(104, 55);
            this.btn_IniciarSesion.TabIndex = 4;
            this.btn_IniciarSesion.Text = "Iniciar Sesión";
            this.btn_IniciarSesion.UseVisualStyleBackColor = true;
            this.btn_IniciarSesion.Click += new System.EventHandler(this.btn_Ingresar_Click);
            // 
            // btn_Volver
            // 
            this.btn_Volver.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Volver.Location = new System.Drawing.Point(24, 123);
            this.btn_Volver.Name = "btn_Volver";
            this.btn_Volver.Size = new System.Drawing.Size(104, 55);
            this.btn_Volver.TabIndex = 3;
            this.btn_Volver.Text = "Volver al Menú Inicial";
            this.btn_Volver.UseVisualStyleBackColor = true;
            this.btn_Volver.Click += new System.EventHandler(this.btn_Volver_Click);
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(273, 198);
            this.Controls.Add(this.btn_Volver);
            this.Controls.Add(this.btn_IniciarSesion);
            this.Controls.Add(this.chk_MostrarContraseña);
            this.Controls.Add(this.txt_Contraseña);
            this.Controls.Add(this.txt_Usuario);
            this.Controls.Add(this.lab_Contraseña);
            this.Controls.Add(this.lab_Usuario);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.Load += new System.EventHandler(this.Login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lab_Usuario;
        private System.Windows.Forms.Label lab_Contraseña;
        private System.Windows.Forms.TextBox txt_Usuario;
        private System.Windows.Forms.TextBox txt_Contraseña;
        private System.Windows.Forms.CheckBox chk_MostrarContraseña;
        private System.Windows.Forms.Button btn_IniciarSesion;
        private System.Windows.Forms.Button btn_Volver;
    }
}
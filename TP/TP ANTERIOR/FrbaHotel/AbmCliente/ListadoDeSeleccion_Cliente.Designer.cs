namespace FrbaHotel.AbmCliente
{
    partial class ListadoDeSeleccion_Cliente
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
            this.txt_nombre = new System.Windows.Forms.TextBox();
            this.lab_nombre = new System.Windows.Forms.Label();
            this.txt_apellido = new System.Windows.Forms.TextBox();
            this.lab_apellido = new System.Windows.Forms.Label();
            this.txt_mail = new System.Windows.Forms.TextBox();
            this.lab_mail = new System.Windows.Forms.Label();
            this.txt_numID = new System.Windows.Forms.TextBox();
            this.lab_numID = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btn_Limpiar = new System.Windows.Forms.Button();
            this.btn_Buscar = new System.Windows.Forms.Button();
            this.chk_exacto_nom = new System.Windows.Forms.CheckBox();
            this.chk_exacto_numID = new System.Windows.Forms.CheckBox();
            this.chk_exacto_mail = new System.Windows.Forms.CheckBox();
            this.chk_exacto_ape = new System.Windows.Forms.CheckBox();
            this.gD1C2018DataSet = new FrbaHotel.GD1C2018DataSet();
            this.gD1C2018DataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // txt_nombre
            // 
            this.txt_nombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_nombre.Location = new System.Drawing.Point(119, 57);
            this.txt_nombre.Name = "txt_nombre";
            this.txt_nombre.Size = new System.Drawing.Size(264, 22);
            this.txt_nombre.TabIndex = 26;
            // 
            // lab_nombre
            // 
            this.lab_nombre.AutoSize = true;
            this.lab_nombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_nombre.Location = new System.Drawing.Point(57, 60);
            this.lab_nombre.Name = "lab_nombre";
            this.lab_nombre.Size = new System.Drawing.Size(57, 16);
            this.lab_nombre.TabIndex = 34;
            this.lab_nombre.Text = "Nombre";
            this.lab_nombre.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_apellido
            // 
            this.txt_apellido.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_apellido.Location = new System.Drawing.Point(119, 85);
            this.txt_apellido.Name = "txt_apellido";
            this.txt_apellido.Size = new System.Drawing.Size(264, 22);
            this.txt_apellido.TabIndex = 27;
            // 
            // lab_apellido
            // 
            this.lab_apellido.AutoSize = true;
            this.lab_apellido.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_apellido.Location = new System.Drawing.Point(56, 88);
            this.lab_apellido.Name = "lab_apellido";
            this.lab_apellido.Size = new System.Drawing.Size(58, 16);
            this.lab_apellido.TabIndex = 32;
            this.lab_apellido.Text = "Apellido";
            this.lab_apellido.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_mail
            // 
            this.txt_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_mail.Location = new System.Drawing.Point(119, 141);
            this.txt_mail.Name = "txt_mail";
            this.txt_mail.Size = new System.Drawing.Size(264, 22);
            this.txt_mail.TabIndex = 31;
            // 
            // lab_mail
            // 
            this.lab_mail.AutoSize = true;
            this.lab_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_mail.Location = new System.Drawing.Point(80, 144);
            this.lab_mail.Name = "lab_mail";
            this.lab_mail.Size = new System.Drawing.Size(33, 16);
            this.lab_mail.TabIndex = 29;
            this.lab_mail.Text = "Mail";
            this.lab_mail.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // txt_numID
            // 
            this.txt_numID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_numID.Location = new System.Drawing.Point(119, 113);
            this.txt_numID.Name = "txt_numID";
            this.txt_numID.Size = new System.Drawing.Size(264, 22);
            this.txt_numID.TabIndex = 30;
            // 
            // lab_numID
            // 
            this.lab_numID.AutoSize = true;
            this.lab_numID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lab_numID.Location = new System.Drawing.Point(22, 116);
            this.lab_numID.Name = "lab_numID";
            this.lab_numID.Size = new System.Drawing.Size(92, 16);
            this.lab_numID.TabIndex = 25;
            this.lab_numID.Text = "Número de Id.";
            this.lab_numID.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(20, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(139, 18);
            this.label1.TabIndex = 35;
            this.label1.Text = "Filtros de Búsqueda";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // btn_Limpiar
            // 
            this.btn_Limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Limpiar.Location = new System.Drawing.Point(23, 182);
            this.btn_Limpiar.Name = "btn_Limpiar";
            this.btn_Limpiar.Size = new System.Drawing.Size(176, 41);
            this.btn_Limpiar.TabIndex = 37;
            this.btn_Limpiar.Text = "Limpiar";
            this.btn_Limpiar.UseVisualStyleBackColor = true;
            this.btn_Limpiar.Click += new System.EventHandler(this.btn_Limpiar_Click);
            // 
            // btn_Buscar
            // 
            this.btn_Buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Buscar.Location = new System.Drawing.Point(320, 182);
            this.btn_Buscar.Name = "btn_Buscar";
            this.btn_Buscar.Size = new System.Drawing.Size(176, 41);
            this.btn_Buscar.TabIndex = 36;
            this.btn_Buscar.Text = "Buscar";
            this.btn_Buscar.UseVisualStyleBackColor = true;
            this.btn_Buscar.Click += new System.EventHandler(this.btn_Buscar_Click);
            // 
            // chk_exacto_nom
            // 
            this.chk_exacto_nom.AutoSize = true;
            this.chk_exacto_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_exacto_nom.Location = new System.Drawing.Point(392, 59);
            this.chk_exacto_nom.Name = "chk_exacto_nom";
            this.chk_exacto_nom.Size = new System.Drawing.Size(104, 20);
            this.chk_exacto_nom.TabIndex = 38;
            this.chk_exacto_nom.Text = "Texto exacto";
            this.chk_exacto_nom.UseVisualStyleBackColor = true;
            // 
            // chk_exacto_numID
            // 
            this.chk_exacto_numID.AutoSize = true;
            this.chk_exacto_numID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_exacto_numID.Location = new System.Drawing.Point(392, 115);
            this.chk_exacto_numID.Name = "chk_exacto_numID";
            this.chk_exacto_numID.Size = new System.Drawing.Size(104, 20);
            this.chk_exacto_numID.TabIndex = 39;
            this.chk_exacto_numID.Text = "Texto exacto";
            this.chk_exacto_numID.UseVisualStyleBackColor = true;
            // 
            // chk_exacto_mail
            // 
            this.chk_exacto_mail.AutoSize = true;
            this.chk_exacto_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_exacto_mail.Location = new System.Drawing.Point(392, 143);
            this.chk_exacto_mail.Name = "chk_exacto_mail";
            this.chk_exacto_mail.Size = new System.Drawing.Size(104, 20);
            this.chk_exacto_mail.TabIndex = 40;
            this.chk_exacto_mail.Text = "Texto exacto";
            this.chk_exacto_mail.UseVisualStyleBackColor = true;
            // 
            // chk_exacto_ape
            // 
            this.chk_exacto_ape.AutoSize = true;
            this.chk_exacto_ape.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chk_exacto_ape.Location = new System.Drawing.Point(392, 87);
            this.chk_exacto_ape.Name = "chk_exacto_ape";
            this.chk_exacto_ape.Size = new System.Drawing.Size(104, 20);
            this.chk_exacto_ape.TabIndex = 41;
            this.chk_exacto_ape.Text = "Texto exacto";
            this.chk_exacto_ape.UseVisualStyleBackColor = true;
            // 
            // gD1C2018DataSet
            // 
            this.gD1C2018DataSet.DataSetName = "GD1C2018DataSet";
            this.gD1C2018DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // gD1C2018DataSetBindingSource
            // 
            this.gD1C2018DataSetBindingSource.DataSource = this.gD1C2018DataSet;
            this.gD1C2018DataSetBindingSource.Position = 0;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(23, 246);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(473, 180);
            this.dataGridView1.TabIndex = 42;
            // 
            // ListadoDeSeleccion_Cliente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(522, 451);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.chk_exacto_ape);
            this.Controls.Add(this.chk_exacto_mail);
            this.Controls.Add(this.chk_exacto_numID);
            this.Controls.Add(this.chk_exacto_nom);
            this.Controls.Add(this.btn_Limpiar);
            this.Controls.Add(this.btn_Buscar);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txt_nombre);
            this.Controls.Add(this.lab_nombre);
            this.Controls.Add(this.txt_apellido);
            this.Controls.Add(this.lab_apellido);
            this.Controls.Add(this.txt_mail);
            this.Controls.Add(this.lab_mail);
            this.Controls.Add(this.txt_numID);
            this.Controls.Add(this.lab_numID);
            this.MaximizeBox = false;
            this.Name = "ListadoDeSeleccion_Cliente";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Búsqueda de Cliente";
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gD1C2018DataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txt_nombre;
        private System.Windows.Forms.Label lab_nombre;
        private System.Windows.Forms.TextBox txt_apellido;
        private System.Windows.Forms.Label lab_apellido;
        private System.Windows.Forms.TextBox txt_mail;
        private System.Windows.Forms.Label lab_mail;
        private System.Windows.Forms.TextBox txt_numID;
        private System.Windows.Forms.Label lab_numID;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btn_Limpiar;
        private System.Windows.Forms.Button btn_Buscar;
        private System.Windows.Forms.CheckBox chk_exacto_nom;
        private System.Windows.Forms.CheckBox chk_exacto_numID;
        private System.Windows.Forms.CheckBox chk_exacto_mail;
        private System.Windows.Forms.CheckBox chk_exacto_ape;
        private GD1C2018DataSet gD1C2018DataSet;
        private System.Windows.Forms.BindingSource gD1C2018DataSetBindingSource;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}
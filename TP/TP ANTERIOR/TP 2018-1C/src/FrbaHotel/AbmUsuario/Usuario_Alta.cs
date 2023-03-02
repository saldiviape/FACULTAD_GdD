using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using libreria;

namespace FrbaHotel.AbmUsuario
{
    public partial class Usuario_Alta : Form
    {
        public Usuario_Alta()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lab_nombre_Click(object sender, EventArgs e)
        {

        }

        private void lab_numID_Click(object sender, EventArgs e)
        {

        }

        private void txt_telefono_TextChanged(object sender, EventArgs e)
        {

        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private bool altaUsuario()
        {
            if (Convert.ToDateTime(dtp_fechaNac.Value) < Properties.Settings.Default.FechaDelSistema)
                try
                {
                    string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.altaUsuario '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}'", txt_usuario.Text.Trim(), txt_contraseña.Text.Trim(), txt_nombre.Text.Trim(), txt_apellido.Text.Trim(), cmb_docTipo.Text.Trim(), txt_docNum.Text.Trim(), txt_mail.Text.Trim(), txt_telefono.Text.Trim(), txt_direccion.Text.Trim(), Convert.ToDateTime(dtp_fechaNac.Value.ToString()));
                    Utilidades.ejecutar(cmd);

                    foreach (DataGridViewRow row in dgv_roles.Rows)
                    {
                        var cell = row.Cells[1];
                        if (cell != null)
                        {
                            var value = cell.Value;
                            if (value != null && (bool)value == true)
                            {
                                string cmd1 = string.Format("EXEC DEVOLVESELA_A_MESSI.asignarUsuarioRol '{0}', '{1}'", txt_usuario.Text.Trim(), row.Cells[0].Value.ToString());
                                Utilidades.ejecutar(cmd1);
                            }
                        }
                    }

                    foreach (DataGridViewRow row in this.dgv_hoteles.Rows)
                    {
                        var cell = row.Cells[4];
                        if (cell != null)
                        {
                            var value = cell.Value;
                            if (value != null && (bool)value == true)
                            {
                                string cmd1 = string.Format("EXEC DEVOLVESELA_A_MESSI.asignarUsuarioHotel '{0}', '{1}'", row.Cells[0].Value.ToString(), txt_usuario.Text.Trim());
                                Utilidades.ejecutar(cmd1);
                            }
                        }
                    }

                    MessageBox.Show("Se ha creado correctamente el nuevo usuario");
                    return true;
                }
                catch (Exception error)
                {
                    MessageBox.Show("Ha ocurrido un error: " + error.Message);
                    return false;
                }
            else
                MessageBox.Show("Fecha de nacimiento invalida");
                return false;
        }

        private void btn_Guardar_Click(object sender, EventArgs e)
        {
            this.altaUsuario();
        }

        private void chk_mostrarContraseña_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_mostrarContraseña.Checked) txt_contraseña.PasswordChar = '\0';
            else txt_contraseña.PasswordChar = '●'; 
        }

        private void Usuario_Alta_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'gD1C2018DataSet.hotel' Puede moverla o quitarla según sea necesario.
            this.hotelTableAdapter.Fill(this.gD1C2018DataSet.hotel);
            this.agregarCheckBox(dgv_hoteles);
            // TODO: esta línea de código carga datos en la tabla 'gD1C2018DataSet.rol' Puede moverla o quitarla según sea necesario.
            this.rolTableAdapter.Fill(this.gD1C2018DataSet.rol);
            this.agregarCheckBox(dgv_roles);
         }

        private void agregarCheckBox(DataGridView dgv)
        {
            DataGridViewCheckBoxColumn chk = new DataGridViewCheckBoxColumn();
            chk.HeaderText = "Seleccionar";
            chk.Name = "chk_seleccionar";
            dgv.Columns.Add(chk);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dgv_hoteles_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}

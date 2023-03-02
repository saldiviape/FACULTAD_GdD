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

namespace FrbaHotel.AbmCliente
{
    public partial class Cliente_Alta : Form
    {
        public Cliente_Alta()
        {
            InitializeComponent();
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Cliente_Alta_Load(object sender, EventArgs e)
        {

        }

        private void txt_nombre_TextChanged(object sender, EventArgs e)
        {

        }

        private bool crearCliente()
        {
            if (Convert.ToDateTime(dtp_fechaNac.Value) < Properties.Settings.Default.FechaDelSistema)
                try
                {
                    string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.crearCliente '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}'", txt_nombre.Text.Trim(), txt_apellido.Text.Trim(), cbx_tipoID.Text.Trim(), txt_numID.Text.Trim(), txt_mail.Text.Trim(), Convert.ToDateTime(dtp_fechaNac.Value.ToString()), txt_telefono.Text.Trim(), txt_domicilio.Text.Trim(), txt_piso.Text.Trim(), txt_depto.Text.Trim(), txt_localidad.Text.Trim(), txt_paisOrigen.Text.Trim(), txt_nacionalidad.Text.Trim());
                    Utilidades.ejecutar(cmd);
                    MessageBox.Show("Se ha creado correctamente el nuevo cliente");
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
            this.crearCliente();
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void cbx_tipoID_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dtp_fechaNac_ValueChanged(object sender, EventArgs e)
        {
        
        }

    }
}

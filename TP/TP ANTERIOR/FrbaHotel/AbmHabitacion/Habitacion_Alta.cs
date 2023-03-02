using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using libreria;

namespace FrbaHotel.AbmHabitacion
{
    public partial class Habitacion_Alta : Form
    {
        Comandos cma = new Comandos();
        public string usuarioActual;
        public string rolActual;

        public Habitacion_Alta(string usuarioAct, string rolAct)
        {
            InitializeComponent();
            this.usuarioActual = usuarioAct;
            this.rolActual = rolAct;
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void cmb_tipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void cmb_direccionHotel_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void Habitacion_Alta_Load(object sender, EventArgs e)
        {
            cma.cargarTipoHab(cmb_tipo);
            cma.cargarHoteles(cmb_direccionHotel, usuarioActual, rolActual);
        }

        private bool altaHabitacion()
        {
            try
            {
                var valorMant = 0;

                if (chk_mantenimiento.Checked)
                {
                    valorMant = 1;
                }
                
                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.altaHabitacion '{0}', '{1}', '{2}', '{3}', '{4}', '{5}'", txt_numero.Text.Trim(), txt_piso.Text.Trim(), cmb_ubicacion.Text.Trim(), cmb_tipo.Text.Trim(), valorMant, cmb_direccionHotel.Text.Trim());
                Utilidades.ejecutar(cmd);
                MessageBox.Show("La habitacion se dio de alta correctamente");
                return true;
            }
            catch (Exception error)
            {
                MessageBox.Show("Ha ocurrido un error: " + error.Message);
                return false;
            }
        }

        private void btn_Guardar_Click(object sender, EventArgs e)
        {
            this.altaHabitacion();
        }
    }
}

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

namespace FrbaHotel.AbmRol
{
    public partial class Quitar_Funcionalidad : Form
    {
        Comandos cma = new Comandos();
        string rolSeleccionado;

        public Quitar_Funcionalidad(string rolSelec)
        {
            InitializeComponent();
            this.rolSeleccionado = rolSelec;
        }
        
        private bool quitarFuncionalidad()
        {
            try
            {
                string funcSeleccionada1 = cmb_eliminar_func.SelectedValue.ToString();

                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.quitarFuncionalidad '{0}', '{1}'", funcSeleccionada1, rolSeleccionado);
                Utilidades.ejecutar(cmd);

                MessageBox.Show("Se ha quitado la funcionalidad");
                return true;
            }
            catch (Exception error)
            {
                MessageBox.Show("Ha ocurrido un error: " + error.Message);
                return false;
            }
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void Rol_Modificacion_Load(object sender, EventArgs e)
        {
            cma.cargarFuncionalidadesRol(cmb_eliminar_func, rolSeleccionado);
        }

        private void btn_quitarFunc_Click(object sender, EventArgs e)
        {
            this.quitarFuncionalidad();
        }
    }
}

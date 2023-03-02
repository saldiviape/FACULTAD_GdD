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
    public partial class Agregar_Funcionalidad : Form
    {
        Comandos cma = new Comandos();
        string rolSeleccionado;

        public Agregar_Funcionalidad(string rolSelec)
        {
            InitializeComponent();
            this.rolSeleccionado = rolSelec;
        }

        private bool agregarFuncionalidad()
        {
            try
            {
                string funcSeleccionada = cmb_agregar_func.SelectedValue.ToString();

                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.agregarFuncionalidad '{0}', '{1}'", funcSeleccionada, rolSeleccionado);
                Utilidades.ejecutar(cmd);

                MessageBox.Show("Se ha agregado la nueva funcionalidad");
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
            cma.mostrarTodasFuncionalidades(cmb_agregar_func);
        }

        private void btn_agregarFunc_Click(object sender, EventArgs e)
        {
            this.agregarFuncionalidad();
        }
    }
}

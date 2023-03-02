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
    public partial class ListadoDeSeleccion_Rol : Form
    {
        Comandos cma = new Comandos();
        public ListadoDeSeleccion_Rol()
        {
            InitializeComponent();
        }

        private bool habilitarRol(DataGridView dgv)
        {
            try
            {
                string rol = dgv.CurrentRow.Cells[0].Value.ToString();

                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.habilitarRol '{0}'", rol);
                Utilidades.ejecutar(cmd);

                MessageBox.Show("Se ha habilitado el rol");
                return true;
            }
            catch (Exception error)
            {
                MessageBox.Show("Ha ocurrido un error: " + error.Message);
                return false;
            }
        }

        private bool bajaRol(DataGridView dgv)
        {
            try
            {
                string rol = dgv.CurrentRow.Cells[0].Value.ToString();
                
                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.bajaRol '{0}'", rol); 
                Utilidades.ejecutar(cmd);

                MessageBox.Show("Se ha dado de baja el rol");
                return true;
            }
            catch (Exception error)
            {
                MessageBox.Show("Ha ocurrido un error: " + error.Message);
                return false;
            }
        }

        private void btn_Buscar_Click(object sender, EventArgs e)
        {
            if(chk_exacto_nom.CheckState.ToString()=="Checked")
                try
                {
                    cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.rol WHERE rol='" + txt_nombre.Text + "'");
                }
                catch (Exception error)
                {
                    MessageBox.Show("Ha ocurrido un error: " + error.Message);
                }
            else
                try
                {
                    string nombre = txt_nombre.Text.ToString();
                    cma.llenarDataGridView(dataGridView1, "SELECT DISTINCT * FROM DEVOLVESELA_A_MESSI.rol WHERE rol LIKE '" + txt_nombre.Text + "' + '%'");
                }
                catch (Exception error)
                {
                    MessageBox.Show("Ha ocurrido un error: " + error.Message);
                } 
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void btn_eliminar_Click(object sender, EventArgs e)
        {
            this.bajaRol(dataGridView1);
        }

        private void btn_quitarFunc_Click(object sender, EventArgs e)
        {
            AbmRol.Quitar_Funcionalidad qf = new Quitar_Funcionalidad(dataGridView1.CurrentRow.Cells[0].Value.ToString());
            qf.Show();
        }

        private void btn_agregarFunc_Click_1(object sender, EventArgs e)
        {
            AbmRol.Agregar_Funcionalidad af = new Agregar_Funcionalidad(dataGridView1.CurrentRow.Cells[0].Value.ToString());
            af.Show();
        }

        private void btn_habilitar_Click(object sender, EventArgs e)
        {
            this.habilitarRol(dataGridView1);
        }
    }
}

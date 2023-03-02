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

namespace FrbaHotel.AbmCliente
{
    public partial class ListadoDeSeleccion_Cliente : Form
    {
        Comandos cma = new Comandos();

        public ListadoDeSeleccion_Cliente()
        {
            InitializeComponent();
        }

        private bool modificarCliente(DataGridView dgv)
            {
            try
            {
                string numID = dgv.CurrentRow.Cells[0].Value.ToString();
                string mail = dgv.CurrentRow.Cells[1].Value.ToString();
                string apellido = dgv.CurrentRow.Cells[2].Value.ToString();
                string nombre = dgv.CurrentRow.Cells[3].Value.ToString();
                string tipoID = dgv.CurrentRow.Cells[4].Value.ToString();
                string fechaNac = dgv.CurrentRow.Cells[5].Value.ToString();
                string telefono = dgv.CurrentRow.Cells[6].Value.ToString();
                string domicilio = dgv.CurrentRow.Cells[7].Value.ToString();
                string piso = dgv.CurrentRow.Cells[8].Value.ToString();
                string depto = dgv.CurrentRow.Cells[9].Value.ToString();
                string localidad = dgv.CurrentRow.Cells[10].Value.ToString();
                string paisOrigen = dgv.CurrentRow.Cells[11].Value.ToString();
                string nacionalidad = dgv.CurrentRow.Cells[12].Value.ToString();

                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.modificarCliente '{0}', '{1}'", numID, mail, apellido, nombre, tipoID, Convert.ToDateTime(fechaNac), telefono, domicilio, piso, depto, localidad, paisOrigen, nacionalidad);
                Utilidades.ejecutar(cmd);

                MessageBox.Show("Se ha modificado el cliente");
                return true;
            }
            catch (Exception error)
            {
                MessageBox.Show("Ha ocurrido un error: " + error.Message);
                return false;
            }
        }

        private bool bajaCliente(DataGridView dgv)
        {
            try
            {
                string numID = dgv.CurrentRow.Cells[0].Value.ToString();
                string mail = dgv.CurrentRow.Cells[1].Value.ToString();

                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.bajaCliente '{0}', '{1}'", numID, mail);
                Utilidades.ejecutar(cmd);

                MessageBox.Show("Se ha dado de baja el cliente");
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
            switch (cmb_criterio.SelectedItem.ToString())
            {
                case "Busqueda por Nombre":
                    if (chk_exacto.CheckState.ToString() == "Checked")
                        try
                        {
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE nombre='" + txt_busqueda.Text + "'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    else
                        try
                        {
                            string nombre = txt_busqueda.Text.ToString();
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE nombre LIKE '" + txt_busqueda.Text + "' + '%'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    break;
                case "Busqueda por Apellido":
                    if (chk_exacto.CheckState.ToString() == "Checked")
                        try
                        {
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE apellido='" + txt_busqueda.Text + "'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    else
                        try
                        {
                            string nombre = txt_busqueda.Text.ToString();
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE apellido LIKE '" + txt_busqueda.Text + "' + '%'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    break;
                case "Busqueda por Numero de identificacion":
                    if (chk_exacto.CheckState.ToString() == "Checked")
                        try
                        {
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE numId='" + txt_busqueda.Text + "'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    else
                        try
                        {
                            string nombre = txt_busqueda.Text.ToString();
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE numId LIKE '" + txt_busqueda.Text + "' + '%'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    break;
                case "Busqueda por Mail":
                    if (chk_exacto.CheckState.ToString() == "Checked")
                        try
                        {
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE mail='" + txt_busqueda.Text + "'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    else
                        try
                        {
                            string nombre = txt_busqueda.Text.ToString();
                            cma.llenarDataGridView(dataGridView1, "SELECT * FROM DEVOLVESELA_A_MESSI.cliente WHERE mail LIKE '" + txt_busqueda.Text + "' + '%'");
                        }
                        catch (Exception error)
                        {
                            MessageBox.Show("Ha ocurrido un error: " + error.Message);
                        }
                    break;
            }
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void btn_eliminar_Click(object sender, EventArgs e)
        {
            this.bajaCliente(dataGridView1);
        }

        private void btn_modificar_Click(object sender, EventArgs e)
        {
            this.modificarCliente(dataGridView1);
        }
    }
}

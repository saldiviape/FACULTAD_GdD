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

namespace FrbaHotel.AbmHotel
{
    public partial class Hotel_Alta : Form
    {
        public Hotel_Alta()
        {
            InitializeComponent();
        }

        private void cmb_estrellas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private bool altaHotel()
        {
            try
            {
                string cmd = string.Format("EXEC DEVOLVESELA_A_MESSI.altaHotel '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}'", txt_nombre.Text.Trim(), txt_mail.Text.Trim(), txt_telefono.Text.Trim(), txt_direccion.Text.Trim(), cmb_estrellas.Text.Trim(), cmb_recargaEstrellas.Text.Trim(), txt_ciudad.Text.Trim(), txt_pais.Text.Trim(), dtp_fechaNac.Text.Trim());
                Utilidades.ejecutar(cmd);

                foreach (DataGridViewRow row in this.dataGridView1.Rows)
                {
                    var cell = row.Cells[3];
                    if (cell != null)
                    {
                        var value = cell.Value;
                        if (value != null && (bool)value == true)
                        {
                            string cmd1 = string.Format("EXEC DEVOLVESELA_A_MESSI.asignarHotelRegimen '{0}', '{1}'", txt_direccion.Text.Trim(), row.Cells[0].Value.ToString());
                            Utilidades.ejecutar(cmd1);
                        }
                    }
                 }
                MessageBox.Show("Se ha creado correctamente el nuevo hotel");
                return true;
            }
            catch (Exception error)
            {
                MessageBox.Show("Ha ocurrido un error: " + error.Message);
                return false;
            }
        }

        private void Hotel_Alta_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'gD1C2018DataSet.regimen' Puede moverla o quitarla según sea necesario.
            this.regimenTableAdapter.Fill(this.gD1C2018DataSet.regimen);
            this.agregarCheckBox();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void agregarCheckBox()
        {
            DataGridViewCheckBoxColumn chk = new DataGridViewCheckBoxColumn();
            chk.HeaderText = "Seleccionar";
            chk.Name = "chk_seleccionar";
            dataGridView1.Columns.Add(chk);
        }

        private void btn_Guardar_Click(object sender, EventArgs e)
        {
            this.altaHotel();
        }
    }
}

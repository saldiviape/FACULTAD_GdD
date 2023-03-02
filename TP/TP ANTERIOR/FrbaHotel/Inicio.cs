using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using libreria;

namespace FrbaHotel
{
    public partial class frm_Inicio : Form
    {
      

        public frm_Inicio()
        {
            InitializeComponent();
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'gD1C2018DataSet.rol' Puede moverla o quitarla según sea necesario.
            // ESTO NO ANDA ---> lo pongo comentado
            // this.rolTableAdapter.Fill(this.gD1C2018DataSet.rol);

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void btn_GenerarModificarReserva_Click(object sender, EventArgs e)
        {
            
        }

        private void btn_IngresarAlSistema_Click(object sender, EventArgs e)
        {
            Login.Login frm = new Login.Login();
            frm.Show();
        }

        private void frm_Inicio_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Para que el actual formulario desaparezca, agregar: this.Hide();
            GenerarModificacionReserva.GenerarReserva frm = new GenerarModificacionReserva.GenerarReserva();
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            GenerarModificacionReserva.ModificarReserva frm = new GenerarModificacionReserva.ModificarReserva();
            frm.Show();
        }
    }
}

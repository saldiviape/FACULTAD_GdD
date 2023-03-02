using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.GenerarModificacionReserva
{
    public partial class GenerarReserva : Form
    {
        public GenerarReserva()
        {
            InitializeComponent();

        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void cmb_regimen_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Reserva_Alta_Load(object sender, EventArgs e)
        {

        }
    }
}

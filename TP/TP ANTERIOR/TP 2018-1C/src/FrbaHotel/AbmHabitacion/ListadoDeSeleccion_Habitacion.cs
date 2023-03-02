using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmHabitacion
{
    public partial class ListadoDeSeleccion_Habitacion : Form
    {
        public ListadoDeSeleccion_Habitacion()
        {
            InitializeComponent();
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void btn_Buscar_Click(object sender, EventArgs e)
        {
            if (this.Text == "Búsqueda para Dar de baja una Habitación")
            {
                AbmHabitacion.Habitacion_Modificacion hm = new AbmHabitacion.Habitacion_Modificacion();
                hm.Show();
            }
            else if (this.Text == "Búsqueda para Modificar una Habitación")
            {
                AbmHabitacion.Habitacion_Modificacion hm = new AbmHabitacion.Habitacion_Modificacion();
                hm.Show();
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmHotel
{
    public partial class ListadoDeSeleccion_Hotel : Form
    {
        public ListadoDeSeleccion_Hotel()
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
            //Este código iría al seleccionar un registro en el dataGridView...

            //Deberían pasarse los campos mail y numID del cliente seleccionado para después agregarlos en la cláusula WHERE (de la query UPDATE o DELETE)... por ejemplo "UPDATE(...) WHERE numID_seleccionado = cliente.numID AND mail_seleccionado = cliente.mail".
            if (this.Text == "Búsqueda para Dar de baja un Hotel")
            {
                AbmHotel.Hotel_Baja hb = new AbmHotel.Hotel_Baja();
                hb.Show();
            }
            else if (this.Text == "Búsqueda para Modificar un Hotel")
            {
                AbmHotel.Hotel_Modificacion hm = new AbmHotel.Hotel_Modificacion();
                hm.Show();
            }
        }
    }
}

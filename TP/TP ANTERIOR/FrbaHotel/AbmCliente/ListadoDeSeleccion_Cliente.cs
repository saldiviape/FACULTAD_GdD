using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmCliente
{
    public partial class ListadoDeSeleccion_Cliente : Form
    {
        public ListadoDeSeleccion_Cliente()
        {
            InitializeComponent();
        }

        private void btn_Buscar_Click(object sender, EventArgs e)
        {
            //Este código iría al seleccionar un registro en el dataGridView...
            
            //Deberían pasarse los campos mail y numID del cliente seleccionado para después agregarlos en la cláusula WHERE (de la query UPDATE o DELETE)... por ejemplo "UPDATE(...) WHERE numID_seleccionado = cliente.numID AND mail_seleccionado = cliente.mail".
            if (this.Text == "Búsqueda para Dar de baja un Cliente")
            {
                AbmCliente.Cliente_Baja cb = new AbmCliente.Cliente_Baja();
                cb.Show();                                
            }
            else if (this.Text == "Búsqueda para Modificar un Cliente")
            {
                AbmCliente.Cliente_Modificacion cm = new AbmCliente.Cliente_Modificacion();
                cm.Show();
            }
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }
    }
}

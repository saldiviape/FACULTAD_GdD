using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmRol
{
    public partial class ListadoDeSeleccion_Rol : Form
    {
        public ListadoDeSeleccion_Rol()
        {
            InitializeComponent();
        }

        private void btn_Buscar_Click(object sender, EventArgs e)
        {
            //Este código iría al seleccionar un registro en el dataGridView...

            //Deberían pasarse los campos mail y numID del cliente seleccionado para después agregarlos en la cláusula WHERE (de la query UPDATE o DELETE)... por ejemplo "UPDATE(...) WHERE numID_seleccionado = cliente.numID AND mail_seleccionado = cliente.mail".
            if (this.Text == "Búsqueda para Dar de baja un Rol")
            {
                AbmRol.Rol_Baja rb = new AbmRol.Rol_Baja();
                rb.Show();
            }
            else if (this.Text == "Búsqueda para Modificar un Rol")
            {
                AbmRol.Rol_Modificacion rm = new AbmRol.Rol_Modificacion();
                rm.Show();
            }
        }
    }
}

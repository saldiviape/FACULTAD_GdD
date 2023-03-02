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
    public partial class Rol_Alta : Form
    {
        public Rol_Alta()
        {
            InitializeComponent();
        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }


        private bool altaRol()
        {
            var CheckBoxList = this.Controls.OfType<CheckBox>().ToList();

            try
            {
                string altaRol = string.Format("EXEC DEVOLVESELA_A_MESSI.altaRol '{0}', '{1}'", txt_nombre.Text.Trim(), txt_estado.Text.Trim());
                Utilidades.ejecutar(altaRol);

                foreach (CheckBox chk in CheckBoxList)
                {
                    if (chk.Checked)
                    {   
                        string asignoRol = string.Format("EXEC DEVOLVESELA_A_MESSI.asignarFuncRol '{0}', '{1}'", txt_nombre.Text.Trim(), chk.Text);
                        Utilidades.ejecutar(asignoRol);
                     }
                 }
                MessageBox.Show("Se ha creado correctamente el nuevo rol");
                return true;
            }
            catch (Exception error)
            {
                MessageBox.Show("Ha ocurrido un error: " + error.Message);
                return false;
            }
        }

        private void btn_Guardar_Click(object sender, EventArgs e)
        {
            this.altaRol();
        }

        private void txt_nombre_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

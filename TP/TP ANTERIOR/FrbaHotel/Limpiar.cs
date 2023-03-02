using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel
{
    class Limpiar
    {
        public void limpiarCampos(Control control)
        {
            foreach (var txt in control.Controls)
            {
                if (txt is TextBox) ((TextBox)txt).Clear();
                else if (txt is ComboBox) ((ComboBox)txt).SelectedIndex = 0;
                else if (txt is CheckBox) ((CheckBox)txt).Checked = false;
                else if (txt is DateTimePicker) ((DateTimePicker)txt).Value = DateTime.Now.AddDays(1);
                else if (txt is RadioButton) ((RadioButton)txt).Checked = false;
            }
        }
    }
}
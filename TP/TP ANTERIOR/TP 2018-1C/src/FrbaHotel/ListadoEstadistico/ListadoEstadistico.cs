using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.ListadoEstadistico
{
    public partial class ListadoEstadistico : Form
    {
        public ListadoEstadistico()
        {
            InitializeComponent();
            //dtp_año.Format = DateTimePickerFormat.Custom;
            dtp_año.CustomFormat = "yyyy";
            dtp_año.ShowUpDown = true;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void ListadoEstadistico_Load(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btn_Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar limpiar = new Limpiar();
            limpiar.limpiarCampos(this);
        }

        private void dtp_año_ValueChanged(object sender, EventArgs e)
        {
            lab_trimestre.Enabled = true;
            cmb_trimestre.Enabled = true;
        }

        private void cmb_trimestre_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmb_trimestre.SelectedItem.ToString() != "(...)")
            {
                lab_funcionalidadAConsultar.Enabled = true; 
                rbt_consulta1.Enabled = true;
                rbt_consulta2.Enabled = true;
                rbt_consulta3.Enabled = true;
                rbt_consulta4.Enabled = true;
                rbt_consulta5.Enabled = true;
            }
            else
            {
                lab_funcionalidadAConsultar.Enabled = false;
                rbt_consulta1.Enabled = false;
                rbt_consulta2.Enabled = false;
                rbt_consulta3.Enabled = false;
                rbt_consulta4.Enabled = false;
                rbt_consulta5.Enabled = false;
            }
            
            //rbt_consulta1.Enabled = true;
            //rbt_consulta2.Enabled = true;
            //rbt_consulta3.Enabled = true;
            //rbt_consulta4.Enabled = true;
            //rbt_consulta5.Enabled = true;
        }

        private void btn_Consultar_Click(object sender, EventArgs e)
        {
            string año_sel = dtp_año.Value.Year.ToString();
            string mesini_sel;
            string mesfin_sel;
            string cons;

            switch (cmb_trimestre.SelectedItem.ToString())
            {
                case "1º Trimestre":
                    mesini_sel = "1";
                    mesfin_sel = "3";
                    break;
                case "2º Trimestre":
                    mesini_sel = "4";
                    mesfin_sel = "6";
                    break;
                case "3º Trimestre":
                    mesini_sel = "7";
                    mesfin_sel = "9";
                    break;
                case "4º Trimestre":
                    mesini_sel = "10";
                    mesfin_sel = "12";
                    break;
            }
            if (rbt_consulta1.Checked)
            {
                //cons = ;
            }
            else if (rbt_consulta2.Checked)
            {
                //cons = ;
            }
            else if (rbt_consulta3.Checked)
            {
                //cons = ;
            }
            else if (rbt_consulta4.Checked)
            {
                //cons = ;
            }
            else if (rbt_consulta5.Checked)
            {
                //cons = ;
            }

            //crear una consulta concatenando: cons (al principio) y mesini_sel, mesfin_sel y año_sel (en el WHERE).
            //que el resultado de la consulta sea mostrada en el dataGridView

        }
    }
}

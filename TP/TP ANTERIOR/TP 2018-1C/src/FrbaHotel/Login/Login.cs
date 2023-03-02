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

namespace FrbaHotel.Login
{
    public partial class Login : Form
    {
        Int32 cif = 0;

        public Login()
        {
            InitializeComponent();
        }

        private void btn_Volver_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void chk_MostrarContraseña_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_MostrarContraseña.Checked)  txt_Contraseña.PasswordChar = '\0';
                else                            txt_Contraseña.PasswordChar = '●';           
        }

        private void btn_Ingresar_Click(object sender, EventArgs e)
        {
            string usuarioActual = txt_Usuario.Text;
            MessageBox.Show("El usuario actual ingresado es " + txt_Usuario.Text);
                        
            try
            {
                string query = string.Format("SELECT * FROM DEVOLVESELA_A_MESSI.usuarioLogin WHERE username = '" + txt_Usuario.Text + "'");
                
                DataSet ds = Utilidades.ejecutar(query);

                string user = ds.Tables[0].Rows[0]["username"].ToString();
                string pass = ds.Tables[0].Rows[0]["password"].ToString();
                //Int32 cantIngFallidos = Convert.ToInt32(ds.Tables[0].Rows[0]["cantIngresosFallidos"]);
            
                if (cif > 3) //¿Hay más de 3 ingresos fallidos de ese usuario?
                {
                    MessageBox.Show("El usuario que ha ingresado está inhabilitado. \nIngrese otro usuario por favor.", "ERROR: Usuario inhabilitado", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                else
                {
                    if (pass == txt_Contraseña.Text) //¿Coincide la contraseña ingresada con la que aparece en la BD?
                    {
                        //Si la contraseña coincide... se entra al formulario de selección de rol, funcionalidad y hotel
                        
                        cif = 0;
                        this.Hide();
                        frm_SeleccionarRolFuncionalidadHotel f = new frm_SeleccionarRolFuncionalidadHotel(usuarioActual);
                        f.Show();
                    }
                    else
                    {
                        //ESTO NO ANDA ----> O sea, cantIngFallidos una vez que suma la primera vez... la próxima vuelve a aparecer con un 0!
                        //incremento en 1 del cantIngresosFallidos
                        // string queryUpdate = string.Format("UPDATE DEVOLVESELA_A_MESSI.usuarioLogin SET cantIngresosFallidos = " + cantIngFallidos + 1 + " WHERE username = '" + txt_Usuario.Text + "'");
                        MessageBox.Show("La contraseña que ha ingresado es incorrecta.\nIngrese la contraseña nuevamente por favor", "Contraseña incorrecta", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        cif++;
                        MessageBox.Show("cif = " + cif);
                    }

                    //

                }


                //ANDA
                //if (user == txt_Usuario.Text && pass == txt_Contraseña.Text)
                //{
                  //  this.Hide();
                  //  frm_SeleccionarRolFuncionalidadHotel frm = new frm_SeleccionarRolFuncionalidadHotel();
                  //  frm.Show();
                //}
                //FIN ANDA
            }
            catch(Exception error)
            {
                MessageBox.Show("El usuario que ha ingresado no es válido. \nIngrese un usuario nuevamente por favor.", "ERROR: Usuario no válido", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txt_Usuario.Text = "\0";
                txt_Contraseña.Text = "\0";
                txt_Usuario.Focus();
            }
        }

        private void Login_Load(object sender, EventArgs e)
        {
            lab_Contraseña.Enabled = false;
            txt_Contraseña.Enabled = false;
            chk_MostrarContraseña.Enabled = false;
            btn_IniciarSesion.Enabled = false;

            
        }

        private void txt_Usuario_TextChanged(object sender, EventArgs e)
        {
            if (txt_Usuario.Text != "\0")
            {
                lab_Contraseña.Enabled = true;
                txt_Contraseña.Enabled = true;
                chk_MostrarContraseña.Enabled = true;
            }
            if (string.IsNullOrEmpty(txt_Usuario.Text))
            {
                lab_Contraseña.Enabled = false;
                txt_Contraseña.Enabled = false;
                chk_MostrarContraseña.Enabled = false;
            }
        }

        private void txt_Contraseña_TextChanged(object sender, EventArgs e)
        {
            if (txt_Contraseña.Text != "\0")
            {
                btn_IniciarSesion.Enabled = true;
            }
            if (string.IsNullOrEmpty(txt_Contraseña.Text))
            {
                btn_IniciarSesion.Enabled = false;
            }
        }
    }
}

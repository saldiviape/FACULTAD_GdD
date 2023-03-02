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
    public partial class frm_SeleccionarRolFuncionalidadHotel : Form
    {
        string usuarioActual;           //Se almacenará el usuario que inició sesión.
        string rolActual;               //Se almacenará el rol seleccionado
        Comandos cma = new Comandos();

        public frm_SeleccionarRolFuncionalidadHotel(string usuarioActual)
       {
           InitializeComponent();
           this.usuarioActual = usuarioActual;
       }
           
        private void frm_SeleccionarRolFuncionalidadHotel_Load(object sender, EventArgs e)
       {
            cma.cargarRoles(cbx_Rol, usuarioActual);
            lab_Hotel.Enabled = false; //Desactivo las opciones para elegir el hotel
            cbx_Hotel.Enabled = false;
            lab_Funcionalidad.Enabled = false; //Desactivo las opciones para elegir la funcionalidad
            cbx_Funcionalidad.Enabled = false;
            cbx_FuncionalidadParticular.Enabled = false; //Desactivo las opciones para elegir una funcionalidad particular
            btn_Acceder.Enabled = false; //Desactivo el botón Acceder

            cbx_Rol.DropDownStyle = ComboBoxStyle.DropDownList;
            cbx_Hotel.DropDownStyle = ComboBoxStyle.DropDownList;
            cbx_Funcionalidad.DropDownStyle = ComboBoxStyle.DropDownList;
            cbx_FuncionalidadParticular.DropDownStyle = ComboBoxStyle.DropDownList;

        }

        private void cbx_Rol_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.rolActual = cbx_Rol.SelectedValue.ToString();
            if (cbx_Rol.SelectedIndex != 0) //Si está seleccionado algún rol...
            {
                lab_Hotel.Enabled = true; //Activo las opciones para elegir el hotel
                cbx_Hotel.Enabled = true;
                cma.cargarHoteles(cbx_Hotel, usuarioActual, rolActual); //Cargo los hoteles en el cbx_Hotel

             }
            else
            {
                lab_Hotel.Enabled = false; //Desactivo las opciones para elegir el hotel
                cbx_Hotel.Enabled = false;
                lab_Funcionalidad.Enabled = false;
                cbx_Funcionalidad.Enabled = false;
                btn_Acceder.Enabled = false;
                ocultarFuncionalidadParticular();
                contraerVentanaYBotonAcceder();
            }
        }

        private void cbx_Hotel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbx_Hotel.SelectedIndex != 0) //Si está seleccionado algún hotel...
            {
                lab_Funcionalidad.Enabled = true; //Activo las opciones para elegir la funcionalidad
                cbx_Funcionalidad.Enabled = true;
                cma.cargarFuncionalidades(cbx_Funcionalidad, usuarioActual, rolActual); //Acá tengo que cargar las funcionalidades en el cbx_Funcionalidad
                cbx_FuncionalidadParticular.Enabled = false;
                btn_Acceder.Enabled = false;
            }
            else
            { 
                lab_Funcionalidad.Enabled = false; //Desactivo las opciones para elegir la funcionalidad
                cbx_Funcionalidad.Enabled = false;
            }
        }
        
        private void cbx_Funcionalidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbx_Funcionalidad.SelectedIndex != 0) // Si está seleccionada alguna funcionalidad...
            {
                switch (cbx_Funcionalidad.SelectedValue.ToString())
                {
                    case "ABM de Rol":
                        cbx_FuncionalidadParticular.ValueMember = "(...)";
                        cbx_FuncionalidadParticular.Items.Clear();
                        cbx_FuncionalidadParticular.Items.Add("Crear un Rol");
                        cbx_FuncionalidadParticular.Items.Add("Dar de baja un Rol");
                        cbx_FuncionalidadParticular.Items.Add("Modificar un Rol");
                        mostrarFuncionalidadParticular();
                        extenderVentanaYBotonAcceder();
                        btn_Acceder.Enabled = false;
                        break;
                    case "ABM de Usuario":
                        cbx_FuncionalidadParticular.ValueMember = "(...)";
                        cbx_FuncionalidadParticular.Items.Clear();
                        cbx_FuncionalidadParticular.Items.Add("Crear un Usuario");
                        cbx_FuncionalidadParticular.Items.Add("Dar de baja un Usuario");
                        cbx_FuncionalidadParticular.Items.Add("Modificar un Usuario");
                        mostrarFuncionalidadParticular();
                        extenderVentanaYBotonAcceder();
                        btn_Acceder.Enabled = false;
                        break;
                    case "ABM de Clientes":
                        cbx_FuncionalidadParticular.ValueMember = "(...)";
                        cbx_FuncionalidadParticular.Items.Clear();
                        cbx_FuncionalidadParticular.Items.Add("Crear un Cliente");
                        cbx_FuncionalidadParticular.Items.Add("Dar de baja un Cliente");
                        cbx_FuncionalidadParticular.Items.Add("Modificar un Cliente");
                        mostrarFuncionalidadParticular();
                        extenderVentanaYBotonAcceder();
                        btn_Acceder.Enabled = false;
                        break;
                    case "ABM de Hotel":
                        cbx_FuncionalidadParticular.ValueMember = "(...)";
                        cbx_FuncionalidadParticular.Items.Clear();
                        cbx_FuncionalidadParticular.Items.Add("Crear un Hotel");
                        cbx_FuncionalidadParticular.Items.Add("Dar de baja un Hotel");
                        cbx_FuncionalidadParticular.Items.Add("Modificar un Hotel");
                        mostrarFuncionalidadParticular();
                        extenderVentanaYBotonAcceder();
                        btn_Acceder.Enabled = false;
                        break;
                    case "ABM de Habitación":
                        cbx_FuncionalidadParticular.ValueMember = "(...)";
                        cbx_FuncionalidadParticular.Items.Clear();
                        cbx_FuncionalidadParticular.Items.Add("Crear una Habitación");
                        cbx_FuncionalidadParticular.Items.Add("Dar de baja una Habitación");
                        cbx_FuncionalidadParticular.Items.Add("Modificar una Habitación");
                        mostrarFuncionalidadParticular();
                        extenderVentanaYBotonAcceder();
                        btn_Acceder.Enabled = false;
                        break;
                    case "ABM de Régimen de Estadía":
                        cbx_FuncionalidadParticular.ValueMember = "(...)";
                        cbx_FuncionalidadParticular.Items.Clear();
                        cbx_FuncionalidadParticular.Items.Add("Crear un Régimen de Estadía");
                        cbx_FuncionalidadParticular.Items.Add("Dar de baja un Régimen de Estadía");
                        cbx_FuncionalidadParticular.Items.Add("Modificar un Régimen de Estadía");
                        mostrarFuncionalidadParticular();
                        extenderVentanaYBotonAcceder();
                        btn_Acceder.Enabled = false;
                        break;
                    case "A-M de Reserva":
                        cbx_FuncionalidadParticular.ValueMember = "(...)";
                        cbx_FuncionalidadParticular.Items.Clear();
                        cbx_FuncionalidadParticular.Items.Add("Generar Reserva");
                        cbx_FuncionalidadParticular.Items.Add("Modificar una Reserva");
                        mostrarFuncionalidadParticular();
                        extenderVentanaYBotonAcceder();
                        btn_Acceder.Enabled = false;
                        break;
                    case "-B- de Reserva":
                        cbx_FuncionalidadParticular.Items.Clear();
                        ocultarFuncionalidadParticular();
                        contraerVentanaYBotonAcceder();
                        btn_Acceder.Enabled = true;
                        break;
                    case "Registrar Estadía":
                        cbx_FuncionalidadParticular.Items.Clear();
                        ocultarFuncionalidadParticular();
                        contraerVentanaYBotonAcceder();
                        btn_Acceder.Enabled = true;
                        break;
                    case "Registrar Consumibles":
                        cbx_FuncionalidadParticular.Items.Clear();
                        ocultarFuncionalidadParticular();
                        contraerVentanaYBotonAcceder();
                        btn_Acceder.Enabled = true;
                        break;
                    case "Facturar Estadía":
                        cbx_FuncionalidadParticular.Items.Clear();
                        ocultarFuncionalidadParticular();
                        contraerVentanaYBotonAcceder();
                        btn_Acceder.Enabled = true;
                        break;
                    case "Listado Estadístico":
                        cbx_FuncionalidadParticular.Items.Clear();
                        ocultarFuncionalidadParticular();
                        contraerVentanaYBotonAcceder();
                        btn_Acceder.Enabled = true;
                        break;
                    default:
                        break;
                }
            }
            else
            {
                ocultarFuncionalidadParticular();
                contraerVentanaYBotonAcceder();
            }
        }

        private void mostrarFuncionalidadParticular()
        {
            cbx_FuncionalidadParticular.Visible = true;
            cbx_FuncionalidadParticular.Enabled = true; //Activo las opciones para elegir la funcionalidad particular
        }

        private void ocultarFuncionalidadParticular()
        {
            cbx_FuncionalidadParticular.Visible = false;
            cbx_FuncionalidadParticular.Enabled = false; //Desactivo las opciones para elegir la funcionalidad particular
        }

        private void extenderVentanaYBotonAcceder()
        {
            btn_Acceder.Location = new Point(161, 230);
            this.Height = 322;
        }

        private void contraerVentanaYBotonAcceder()
        {
            btn_Acceder.Location = new Point(161, 203);
            this.Height = 295;
        }





        private void cbx_FuncionalidadParticular_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (cbx_FuncionalidadParticular.SelectedIndex != 0) // Si está seleccionada alguna funcionalidad en particular...
            if (cbx_FuncionalidadParticular.SelectedIndex.ToString() != "\0") 
            {
                btn_Acceder.Enabled = true;
            }
            else
            {
                btn_Acceder.Enabled = false;
            }
                    
        }
        
        private void btn_Acceder_Click(object sender, EventArgs e)
        {
            switch (cbx_Funcionalidad.SelectedValue.ToString())
            {
                case "ABM de Rol":
                    switch (cbx_FuncionalidadParticular.SelectedItem.ToString())
                        {
                            case "Crear un Rol":
                                AbmRol.Rol_Alta fa = new AbmRol.Rol_Alta();
                                fa.Show();
                                break;
                            case "Dar de baja un Rol":
                                AbmRol.ListadoDeSeleccion_Rol lsrb = new AbmRol.ListadoDeSeleccion_Rol();
                                lsrb.Text = "Búsqueda para Dar de baja un Rol";
                                lsrb.Show();
                                break;
                            case "Modificar un Rol":
                                AbmRol.ListadoDeSeleccion_Rol lsrm = new AbmRol.ListadoDeSeleccion_Rol();
                                lsrm.Text = "Búsqueda para Modificar un Rol";
                                lsrm.Show();
                                break;
                            default:
                                break;
                        }
                    break;
                case "ABM de Usuario":
                    switch (cbx_FuncionalidadParticular.SelectedItem.ToString())
                    {
                        case "Crear un Usuario":
                            AbmUsuario.Usuario_Alta fa = new AbmUsuario.Usuario_Alta();
                            fa.Show();
                            break;
                        case "Dar de baja un Usuario":
                            AbmUsuario.ListadoDeSeleccion_Usuario lsub = new AbmUsuario.ListadoDeSeleccion_Usuario();
                            lsub.Text = "Búsqueda para Dar de baja un Usuario";
                            lsub.Show();
                            break;
                        case "Modificar un Usuario":
                            AbmUsuario.ListadoDeSeleccion_Usuario lsum = new AbmUsuario.ListadoDeSeleccion_Usuario();
                            lsum.Text = "Búsqueda para Dar de baja un Usuario";
                            lsum.Show();
                            break;
                        default:
                            break;
                    }
                    break;
                case "ABM de Clientes":
                    switch (cbx_FuncionalidadParticular.SelectedItem.ToString())
                    {
                        case "Crear un Cliente":
                            AbmCliente.Cliente_Alta fa = new AbmCliente.Cliente_Alta();
                            fa.Show();
                            break;
                        case "Dar de baja un Cliente":
                            AbmCliente.ListadoDeSeleccion_Cliente lscd = new AbmCliente.ListadoDeSeleccion_Cliente();
                            lscd.Text = "Búsqueda para Dar de baja un Cliente";
                            lscd.Show();
                            break;
                        case "Modificar un Cliente":
                            AbmCliente.ListadoDeSeleccion_Cliente lscm = new AbmCliente.ListadoDeSeleccion_Cliente();
                            lscm.Text = "Búsqueda para Modificar un Cliente";
                            lscm.Show();
                            break;
                        default:
                            break;
                    }
                    break;
                case "ABM de Hotel":
                    switch (cbx_FuncionalidadParticular.SelectedItem.ToString())
                    {
                        case "Crear un Hotel":
                            AbmHotel.Hotel_Alta fa = new AbmHotel.Hotel_Alta();
                            fa.Show();
                            break;
                        case "Dar de baja un Hotel":
                            AbmHotel.ListadoDeSeleccion_Hotel lshm = new AbmHotel.ListadoDeSeleccion_Hotel();
                            lshm.Text = "Búsqueda para Dar de baja un Hotel";
                            lshm.Show();
                            break;
                        case "Modificar un Hotel":
                            AbmHotel.ListadoDeSeleccion_Hotel lshb = new AbmHotel.ListadoDeSeleccion_Hotel();
                            lshb.Text = "Búsqueda para Modificar un Hotel";
                            lshb.Show();
                            break;
                        default:
                            break;
                    }
                    break;
                case "ABM de Habitación":
                    switch (cbx_FuncionalidadParticular.SelectedItem.ToString())
                    {
                        case "Crear una Habitación":
                            AbmHabitacion.Habitacion_Alta ha = new AbmHabitacion.Habitacion_Alta(usuarioActual, rolActual);
                            ha.Show();
                            break;
                        case "Dar de baja una Habitación":
                            AbmHabitacion.ListadoDeSeleccion_Habitacion lshb = new AbmHabitacion.ListadoDeSeleccion_Habitacion();
                            lshb.Text = "Búsqueda para Dar de baja una Habitación";
                            lshb.Show();
                            break;
                        case "Modificar una Habitación":
                            AbmHabitacion.Habitacion_Modificacion fm = new AbmHabitacion.Habitacion_Modificacion();
                            fm.Show();
                            AbmHabitacion.ListadoDeSeleccion_Habitacion lshm = new AbmHabitacion.ListadoDeSeleccion_Habitacion();
                            lshm.Text = "Búsqueda para Modificar una Habitación";
                            lshm.Show();
                            break;
                        default:
                            break;
                    }
                    break;
                case "ABM de Régimen de Estadía":
                    switch (cbx_FuncionalidadParticular.SelectedItem.ToString())
                    {
                        case "Crear un Régimen de Estadía":
                            AbmRegimen.Regimen_Alta fa = new AbmRegimen.Regimen_Alta();
                            fa.Show();
                            break;
                        case "Dar de baja un Régimen de Estadía":
                            AbmRegimen.Regimen_Baja fb = new AbmRegimen.Regimen_Baja();
                            fb.Show();
                            break;
                        case "Modificar un Régimen de Estadía":
                            AbmRegimen.Regimen_Modificacion fm = new AbmRegimen.Regimen_Modificacion();
                            fm.Show();
                            break;
                        default:
                            break;
                    }
                    break;
                case "A-M de Reserva":
                    switch (cbx_FuncionalidadParticular.SelectedItem.ToString())
                    {
                        case "Generar Reserva":
                            GenerarModificacionReserva.GenerarReserva fg = new GenerarModificacionReserva.GenerarReserva();
                            fg.Show();
                            break;
                        case "Modificar una Reserva":
                            GenerarModificacionReserva.ModificarReserva fm = new GenerarModificacionReserva.ModificarReserva();
                            fm.Show();
                            break;
                        default:
                            break;
                    }
                    break;
                case "-B- de Reserva":
                    DarBajaReserva.Reserva_Baja fbr = new DarBajaReserva.Reserva_Baja();
                    fbr.Show();
                    break;
                case "Registrar Estadía":
                    RegistrarEstadia.RegistrarEstadia fre = new RegistrarEstadia.RegistrarEstadia();
                    fre.Show();
                    break;
                case "Registrar Consumibles":
                    RegistrarConsumible.RegistrarConsumible frc = new RegistrarConsumible.RegistrarConsumible();
                    frc.Show();
                    break;
                case "Facturar Estadía":
                    FacturarEstadia.FacturarEstadia ffe = new FacturarEstadia.FacturarEstadia();
                    ffe.Show();
                    break;
                case "Listado Estadístico":
                    ListadoEstadistico.ListadoEstadistico fle = new ListadoEstadistico.ListadoEstadistico();
                    fle.Show();
                    break;
                default:
                    //
                    break;

            }
        }
    }
}
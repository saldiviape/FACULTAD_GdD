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

namespace FrbaHotel
{
    class Comandos
    {
        SqlConnection con = new SqlConnection("Data Source=localhost\\SQLSERVER2012;Initial Catalog=GD1C2018;Persist Security Info=True;User ID=gdHotel2018;Password=gd2018");

        public void cargarRoles(ComboBox cbx_rol, string usuario)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct ru.rol FROM DEVOLVESELA_A_MESSI.usuarioLogin ul, DEVOLVESELA_A_MESSI.rolPorUsuario ru, DEVOLVESELA_A_MESSI.rolFuncionalidad rf, DEVOLVESELA_A_MESSI.funcionalidadNombre fn WHERE ul.idUsuario = ru.idUsuario AND ru.rol = rf.rol AND rf.codFunc = fn.codFunc AND ul.username = '" + usuario + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            DataRow fila = dt.NewRow();
            fila["rol"] = "Selecciona un rol";
            dt.Rows.InsertAt(fila, 0);

            cbx_rol.ValueMember = "ru.rol";
            cbx_rol.DisplayMember = "rol";
            cbx_rol.DataSource = dt;
        }

        public void cargarHoteles(ComboBox combo, string usuarioAct, string rolAct)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT h.direccion FROM DEVOLVESELA_A_MESSI.usuarioLogin ul, DEVOLVESELA_A_MESSI.rolPorUsuario ru, DEVOLVESELA_A_MESSI.hotel h WHERE ul.idUsuario = ru.idUsuario AND ru.idHotel = h.idHotel AND ul.username = '" + usuarioAct + "' AND ru.rol = '" + rolAct + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            DataRow fila = dt.NewRow();
            fila["direccion"] = "Selecciona un hotel";
            dt.Rows.InsertAt(fila, 0);

            combo.ValueMember = "h.direccion";
            combo.DisplayMember = "Direccion";
            combo.DataSource = dt;
        }

        public void cargarFuncionalidades(ComboBox combo, string usuarioAct, string rolAct)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT fn.nombreFunc FROM DEVOLVESELA_A_MESSI.usuarioLogin ul, DEVOLVESELA_A_MESSI.rolPorUsuario ru, DEVOLVESELA_A_MESSI.rolFuncionalidad rf, DEVOLVESELA_A_MESSI.funcionalidadNombre fn, DEVOLVESELA_A_MESSI.hotel h WHERE ul.username = '" + usuarioAct + "' AND ru.rol = '" + rolAct + "' AND ul.idUsuario = ru.idUsuario AND ru.rol = rf.rol AND rf.codFunc = fn.codFunc", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            DataRow fila = dt.NewRow();
            fila["nombreFunc"] = "Selecciona una funcionalidad";
            dt.Rows.InsertAt(fila, 0);

            combo.ValueMember = "fn.nombreFunc";
            combo.DisplayMember = "nombreFunc";
            combo.DataSource = dt;
        }

        public void cargarTipoHab(ComboBox combo)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT descripcion FROM DEVOLVESELA_A_MESSI.tipoHabitacion", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            DataRow fila = dt.NewRow();
            fila["descripcion"] = "Selecciona un tipo de habitacion";
            dt.Rows.InsertAt(fila, 0);

            combo.ValueMember = "descripcion";
            combo.DisplayMember = "descripcion";
            combo.DataSource = dt;
        }
    }
}
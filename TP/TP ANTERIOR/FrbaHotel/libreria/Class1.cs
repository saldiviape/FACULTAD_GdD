using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace libreria
{
    public class Utilidades
    {
        public static DataSet ejecutar(string consulta)
        {
            SqlConnection conexion = new SqlConnection("Data Source=localhost\\SQLSERVER2012;Initial Catalog=GD1C2018;Persist Security Info=True;User ID=gdHotel2018;Password=gd2018");
            conexion.Open();

            DataSet ds = new DataSet();
            SqlDataAdapter dp = new SqlDataAdapter(consulta, conexion);

            dp.Fill(ds);

            conexion.Close();

            return ds;
        }
    }
}
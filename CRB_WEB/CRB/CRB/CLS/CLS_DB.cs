using System;
using System.Web;
using System.Data;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace CRB.CLS
{
    public class CLS_DB
    {
        public String StrConexion = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        private int ShrTimeOut = 3600;
        private SqlConnection connSQL = null;
        private SqlTransaction transSQL = null;

        public string ConexionString { get; set; }
        public int TimeOut { get; set; }

        public CLS_DB()
        {
        }

        public CLS_DB(string ConexionString)
        {
            StrConexion = ConexionString;
        }

        /* INICIAMOS LA TRANSACCION DE SQL */
        public void IniciaTransaccion() {
            connSQL = new SqlConnection(StrConexion);
            connSQL.Open();
            transSQL = connSQL.BeginTransaction();
        }

        public void TerminaTransaccion() {
            if (connSQL.State == ConnectionState.Open) {
                transSQL.Commit();
                connSQL.Close();
            }
            transSQL = null;
            connSQL = null;
        }

        public void CancelaTransaccion() {
            if (connSQL.State == ConnectionState.Open)
            {
                transSQL.Rollback();
                connSQL.Close();
            }
            transSQL = null;
            connSQL = null;
        }

        public void EjecutaBD(string StrCadena)
        {
            if (transSQL == null)
            {
                // No hay transacción
                using (SqlConnection connSQL = new SqlConnection(StrConexion))
                {
                    var comnSQL = connSQL.CreateCommand();
                    comnSQL.CommandText = StrCadena;
                    connSQL.Open();
                    comnSQL.ExecuteNonQuery();
                }
            }
            else
            {
                // Hay transacción en la clase
                SqlCommand comnSQL = new SqlCommand(StrCadena, connSQL, transSQL);
                comnSQL.ExecuteNonQuery();
            }
        }

        public DataSet consultaCadena(string querySQL)
        {
            DataSet consultaCadena = null;
            if (transSQL == null)
            {
                // No hay transacción
                using (SqlConnection connSQL = new SqlConnection(StrConexion))
                {
                    using (SqlDataAdapter SqlDataAdapter1 = new SqlDataAdapter(querySQL, connSQL))
                    {
                        SqlDataAdapter1.SelectCommand.CommandTimeout = ShrTimeOut;
                        consultaCadena = new DataSet();
                        SqlDataAdapter1.Fill(consultaCadena);
                        return consultaCadena;
                    }
                    connSQL.Close();
                }
            }
            else
                // Hay transacción en la clase
                using (SqlDataAdapter SqlDataAdapter1 = new SqlDataAdapter(querySQL, connSQL))
                {
                    SqlDataAdapter1.SelectCommand.Transaction = transSQL;
                    SqlDataAdapter1.SelectCommand.CommandTimeout = ShrTimeOut;
                    consultaCadena = new DataSet();
                    SqlDataAdapter1.Fill(consultaCadena);
                    return consultaCadena;
                }
        }

        public DataSet consultaCadenaCommand(SqlCommand comnSQL)
        {
            DataSet consultaCadena = null;
            try
            {

                if (transSQL == null)
                {
                    // No hay transacción
                    using (SqlConnection connSQL = new SqlConnection(StrConexion))
                    {
                        connSQL.Open();
                        comnSQL.Connection = connSQL;
                        using (SqlDataAdapter SqlDataAdapter1 = new SqlDataAdapter(comnSQL))
                        {
                            SqlDataAdapter1.SelectCommand.CommandTimeout = ShrTimeOut;
                            consultaCadena = new DataSet();
                            SqlDataAdapter1.Fill(consultaCadena);
                        }
                        connSQL.Close();
                    }
                }
                else
                    // Hay transacción en la clase
                    using (SqlDataAdapter SqlDataAdapter1 = new SqlDataAdapter(comnSQL))
                    {
                        SqlDataAdapter1.SelectCommand.Transaction = transSQL;
                        SqlDataAdapter1.SelectCommand.CommandTimeout = ShrTimeOut;
                        consultaCadena = new DataSet();
                        SqlDataAdapter1.Fill(consultaCadena);
                    }
            }
            catch (Exception ex)
            {
                //this.ErrorLog(ex, "InsertarPedidoEspera");
            }
            return consultaCadena;
        }

    }
   }
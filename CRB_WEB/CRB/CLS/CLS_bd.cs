using System;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace CRB.CLS
{
    public class CLS_bd
    {
        public String StrConexion = "";
        private int ShrTimeOut = 3600;
        private SqlConnection connSQL = null;
        private SqlTransaction transSQL = null;

        public string ConexionString { get; set; }
        public int TimeOut { get; set; }

        public CLS_bd()
        {
        }

        public CLS_bd(string ConexionString) {
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

    }
}

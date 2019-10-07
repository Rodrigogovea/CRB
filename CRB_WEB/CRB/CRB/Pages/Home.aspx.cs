using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRB.CLS;
using System.Data.SqlClient;
using System.Data;

namespace CRB.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            //DataTable dt = null;
            //CLS_DB objConsulta = new CLS_DB();
            //SqlCommand sqlCon = new SqlCommand();
            //sqlCon.CommandType = CommandType.StoredProcedure;
            //sqlCon.CommandText = "RecuperaComputadorasCentro";
            //sqlCon.Parameters.AddWithValue("@Centro", "02");
            //dt = objConsulta.consultaCadenaCommand(sqlCon).Tables[0];
            //RepetidorCentros.DataSource = dt;
            //RepetidorCentros.DataBind();
        }
    }
}
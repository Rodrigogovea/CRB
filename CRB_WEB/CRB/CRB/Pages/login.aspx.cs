using System;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using CRB.MOD;

namespace CRB.Pages
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }


        protected void ValidateUser(object sender, EventArgs e)
        {
            string userId = "0";
            string constr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Valida_Usuario"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", MOD_Utilerias.MD5(txtUsername.Text.Trim()+txtPassword.Text.Trim()));
                    cmd.Parameters.AddWithValue("@IP", (Request.UserHostAddress != null ? Request.UserHostAddress : ""));
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToString(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userId)
                {
                    case "1":
                        dvMessage.Visible = true;
                        lblMessage.Text = "Usuario y/o Contraseña Incorrecta";
                        break;
                    case "2":
                        dvMessage.Visible = true;
                        lblMessage.Text = "La cuenta no ha sido Activada";
                        break;
                    default:
                        if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                        {
                            FormsAuthentication.SetAuthCookie(txtUsername.Text.Trim(), chkRememberMe.Checked);
                            Response.Redirect(Request.QueryString["ReturnUrl"]);
                        }
                        else
                        {
                            FormsAuthentication.RedirectFromLoginPage(txtUsername.Text.Trim(), chkRememberMe.Checked);
                        }
                        break;
                }
            }
        }

    }
}
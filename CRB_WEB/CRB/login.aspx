<%@ Page Language="C#" Inherits="CRB.Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>ITESZ | CRB</title>
    </head>

    <body style="background: #FFF0F5;">
        <form id="form1" runat="server">
        <div id="login">
            <div class="login-wrapper">
                <p style="text-align:center;margin-bottom: 20px;"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/HOLA.png" AlternateText="Logo" EnableViewState="True" /></p>
                <p><asp:Panel ID="procesoStatusContainer" runat="server" Visible="False" EnableViewState="False"><asp:Label ID="procesoStatus" runat="server"></asp:Label></asp:Panel></p>
                <div class="login-container">
                    <p>Usuario:</p>
                    <p><asp:TextBox ID="txtLogin" runat="server" CausesValidation="True" BorderColor="#FF3300" BorderWidth="2px"></asp:TextBox></p>
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtLogin" ErrorMessage="Introduce un usuario:" 
                            Display="Dynamic"></asp:RequiredFieldValidator></p>
                    <p>Contraseña:</p>
                    <p><asp:TextBox ID="txtPassword" runat="server" CausesValidation="True" TextMode="Password" BorderColor="#FF3300" BorderWidth="2px"></asp:TextBox></p>
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtPassword" ErrorMessage="Por favor ingrese su contraseña" 
                            Display="Dynamic"></asp:RequiredFieldValidator></p>
                    <p>&nbsp;</p>
                    <p style="text-align:center;"><asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" BorderColor="#FF3300" BorderWidth="2px" /></p>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="urlReferer" runat="server" />
        </form>
    </body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CRB.Pages.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Itesz | CRB</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" media="Screen" />
</head>
<body>

    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />
    <div class="container">
        <div class="abs-center">
             <form id="form1" runat="server" class="border p-3 form">
                <div style="max-width: 400px;">
                    <h2 class="form-signin-heading">Login</h2>
                    <label for="txtUsername">
                        Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Ingresa Username"></asp:TextBox>
                    <br />
                    <label for="txtPassword">
                        Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"
                        placeholder="Ingresa Password"></asp:TextBox>
                    <div class="checkbox">
                        <asp:CheckBox ID="chkRememberMe" Text="Recuerdame" runat="server" />
                    </div>
                    <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="ValidateUser" Class="btn btn-primary" />
                    <br />
                    <br />
                    <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                        <strong>Error!</strong>
                        <asp:Label ID="lblMessage" runat="server" />
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>
</html>

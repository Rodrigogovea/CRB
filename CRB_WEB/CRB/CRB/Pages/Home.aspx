<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CRB.Pages.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inicio</title>
    <!-- add bootstrap css file -->

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/main.css" />
</head>
<body>
    <!-- navbar -->

    <nav class="navbar navbar-expand-lg fixed-top ">
        <a class="navbar-brand" href="#">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav mr-4">

                <li class="nav-item">
                    <a class="nav-link" data-value="about" href="#">Acerca de</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-value="CENTER_A" href="#">SALA A</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-value="CENTER_B" href="#">SALA B</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-value="team" href="#">EQUIPO</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-value="contact" href="#">CONTACTO</a>
                </li>
            </ul>

        </div>
    </nav>
    <!-- header -->
    <header class="header ">
        <div class="overlay"></div>
        <div class="container">
            <div class="description ">
                <h1>Hola ,Bienvenido a CRB
  		<p>
              Un sistema de reserva de computadora el cual las computadoras de acceso público se pueden reservar por un período de tiempo. 
        <br />
              Estos sistemas se usan comúnmente para garantizar el uso equitativo de un número limitado de computadoras.
          </p>
                    <button class="btn btn-outline-secondary btn-lg">Ver mas...</button>
                </h1>
            </div>
        </div>

    </header>

    <!-- about section -->
    <div class="about" id="about">
        <div class="container">
            <h1 class="text-center">A cerca de...</h1>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12">
                    <img src="../images/Logo.png" class="img-fluid">
                    <span class="text-justify">Computer rooms booking</span>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 desc">

                    <h3>CRB</h3>
                    <p>
                        CRB es una herramienta creada para el uso y beneficio de estudiantes, 
                            profesores y administradores de salas. 
                            Con ella se busca contribuir a la labor realizada por muchos, además de facilitar el acceso 
                            a las diferentes salas de cómputo de la universidad a tan solo un clic.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- CENTER_A -->
    <div class="CENTER_A" id="CENTER_A">
        <div class="container">
            <h1 class="text-center">Centro A</h1>
                    <div class="card-deck">
            <div class="card">
                <img src="../images/Centro/Disponible.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Computadora 11</h5>
                    <p class="card-text">stema Operativo Windows 10 Memoria Ram 8 GB Paqueteria Office Office 2013 </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Actualizada hace 3 minutos</small>
                </div>
            </div>
           <div class="card">
                <img src="../images/Centro/Ocupado.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Computadora 12</h5>
                    <p class="card-text">stema Operativo Windows 10 Memoria Ram 8 GB Paqueteria Office Office 2013 </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Actualizada hace 3 minutos</small>
                </div>
            </div>
            <div class="card">
                <img src="../images/Centro/Reparacion.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Computadora 13</h5>
                    <p class="card-text">stema Operativo Windows 10 Memoria Ram 8 GB Paqueteria Office Office 2013 </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Actualizada hace 3 minutos</small>
                </div>
            </div>
        </div>
            </div>

    </div>




    <!-- Posts section -->
    <div class="CENTER_B" id="CENTER_B">
        <div class="container">
            <h1 class="text-center">Centro B</h1>
                    <div class="card-deck">
            <div class="card">
                <img src="../images/Centro/Disponible.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Computadora 20</h5>
                    <p class="card-text">stema Operativo Windows 10 Memoria Ram 8 GB Paqueteria Office Office 2013 </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Actualizada hace 3 minutos</small>
                </div>
            </div>
           <div class="card">
                <img src="../images/Centro/Ocupado.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Computadora 21</h5>
                    <p class="card-text">stema Operativo Windows 10 Memoria Ram 8 GB Paqueteria Office Office 2013 </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Actualizada hace 3 minutos</small>
                </div>
            </div>
            <div class="card">
                <img src="../images/Centro/Reparacion.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Computadora 22</h5>
                    <p class="card-text">stema Operativo Windows 10 Memoria Ram 8 GB Paqueteria Office Office 2013 </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Actualizada hace 3 minutos</small>
                </div>
            </div>
        </div>
            </div>
    </div>

    <!-- Team section -->
    <div class="team" id="team">
        <div class="container">
            <h1 class="text-center">Nuestro Equipo</h1>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 item">
                    <img src="../images/team/alicia.jpg" class="img-fluid" alt="team">
                    <div class="des">
                        Alicia Linares
                    </div>
                    <span class="text-muted">Manager</span>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 item">
                    <img src="../images/team/coyt.jpeg" class="img-fluid" alt="team">
                    <div class="des">
                        Salvador Coyt
                    </div>
                    <span class="text-muted">S.enginner</span>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 item">
                    <img src="../images/team/govea.jpg" class="img-fluid" alt="team">
                    <div class="des">
                        Rodrigo Govea 
                    </div>
                    <span class="text-muted">Team Manger</span>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 item">
                    <img src="../images/team/poncho.jpg" class="img-fluid" alt="team">
                    <div class="des">
                        Alfonso Ochoa
                    </div>
                    <span class="text-muted">Front End Developer</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact form -->
    <div class="contact-form" id="contact">
        <div class="container">
            <form>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <h1>Ponerse en Contacto</h1>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 right">
                        <div class="form-group">
                            <input type="text" class="form-control form-control-lg" placeholder="Nombre" name="">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control form-control-lg" placeholder="TuCorreo@email.com" name="email">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control form-control-lg" placeholder="Describe tus comentarios">
				   	 	
				   	 </textarea>
                        </div>
                        <input type="submit" class="btn btn-secondary btn-block" value="Send" name="">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- add Javasscript file from js file -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src='../js/main.js'></script>
    <%--    <form id="form1" runat="server">
        <div>
            <h2>Welcome</h2>
            <hr />
            <h4>
                <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" />
            </h4>
            <br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" CssClass="btn btn-warning" />
        </div>
    </form>--%>
</body>
</html>

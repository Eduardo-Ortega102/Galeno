<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container">
                <form class="navbar-form navbar-right"action="FrontController" method="POST">
                    <input type="hidden" name="command" value="Login" />
                    <div class="form-group">
                      <label class="sr-only" for="user">Email</label>
                      <input type="text" class="form-control" id="user" name="email" placeholder="email">
                    </div>
                    <div class="form-group">
                      <label class="sr-only" for="pass">Password</label>
                      <input type="password" class="form-control" id="pass" name="password" placeholder="password">
                    </div>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox"> Recuerdame
                      </label>
                    </div>
                    <button type="submit" class="btn btn-primary">Iniciar Sesion</button>               
                </form>
                <hr>
            </div>
        <%
            if (request.getParameter("error") != null){
                out.println("<div class=\"alert alert-danger\">");
                out.println("<strong>Error!</strong> Usuario o contraseña incorrectos");
                out.println("</div>");
            } else if (request.getParameter("sessionError") != null){
                out.println("<div class=\"alert alert-warning\">");
                out.println("<strong>Error!</strong> Para acceder a la aplicaci&oacute;n debe iniciar sesi&oacute;n");
                out.println("</div>");
            }
        %>
        </nav>
       
        <div id="content">
            <div class="jumbotron">
                <div class="container">
                    <h1>Galeno</h1>
                    <p> 
                        Galeno es una aplicación que le permite llevar a cabo una gestión de su actividad clínica a través de diversas utilidades.
                        En el momento en el que se registre, creará su historial clínico con los datos más relevantes, y con unos sencillos pasos, podrá
                        concertar citas con su médico. Etc, etc, etc
                    </p>
                    <p><a class="btn btn-primary btn-lg" href="FrontController?command=Register" role="button">Registrate ya »</a></p>
                </div>
            </div>
            <section class="centerdesk">
                <div class="container">
                        <div class="row">
                                <div class="col-md-4">
                                        <span class="glyphicon glyphicon-plus glyphicon-large" aria-hidden="true"></span>
                                        <h3>Crea tu historial clinico</h3>
                                        <p> Podras crear tu propio historial clínico, actualizarlo de forma periódica y compartirlo con los médicos que creas oportuno.</p>
                                </div>
                                <div class="col-md-4">
                                        <span class="glyphicon glyphicon-calendar glyphicon-large" aria-hidden="true"></span>
                                        <h3>Gestion cita medica</h3>
                                        <p>Pedir cita nunca fue tan facil.Podras gestionar tus citas médicas, pudiendo solicitar cita entre los distintos horarios disponibles por sus médicos y cancelarlas si fuera necesario.</p>
                                </div>
                                <div class="col-md-4">
                                        <span class="glyphicon glyphicon-folder-close glyphicon-large" aria-hidden="true"></span>
                                        <h3>Consulta tus recetas</h3>
                                        <p>Gestiona en todo momento tus recetas </p>
                                </div>
                        </div>
                </div>
            </section>
        </div>
   
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

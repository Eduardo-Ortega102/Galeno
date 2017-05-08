<%@page import="javax.naming.InitialContext"%>
<%@page import="beans.UserCounter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserCounter counter = (UserCounter) new InitialContext().lookup("java:global/Galen/Galen-ejb/UserCounter");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <jsp:include page="/WEB-INF/headerRef.html"/>
        <link href="css/custom.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container">
                <form class="navbar-form navbar-right" action="FrontController" method="POST">
                    <input type="hidden" name="command" value="Login" />
                    <div class="form-group">
                        <label class="sr-only" for="user">Email</label>
                        <input type="text" class="form-control" id="user" name="email" placeholder="email">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="pass">Password</label>
                        <input type="password" class="form-control" id="pass" name="password" placeholder="password">
                    </div>
                    <button type="submit" class="btn btn-primary">Iniciar Sesion</button>               
                </form>
                <hr>
            </div>
            <%
                if (request.getParameter("error") != null) {
                    out.println("<div class=\"alert alert-danger\">");
                    out.println("<strong>Error!</strong> Usuario o contraseña incorrectos");
                    out.println("</div>");
                } else if (request.getParameter("sessionError") != null) {
                    out.println("<div class=\"alert alert-warning\">");
                    out.println("<strong>Error!</strong> Para acceder a la aplicaci&oacute;n debe iniciar sesi&oacute;n");
                    out.println("</div>");
                } else if (request.getParameter("successfulRegister") != null) {
                    out.println("<div class=\"alert alert-success\">");
                    out.println("<strong>Enhorabuena!</strong> Su registro se ha realizado con éxito");
                    out.println("</div>");
                } else if (request.getParameter("successfulDelete") != null) {
                    out.println("<div class=\"alert alert-success\">");
                    out.println("Su cuenta se ha eliminado");
                    out.println("</div>");
                }
            %>
        </nav>

        <div id="content">
            <div class="jumbotron">
                <div class="container">
                    <h1>Galeno</h1>
                    <p> 
                        Galeno es una aplicación que le permite llevar a cabo una gestión de su actividad clínica a través 
                        de diversas utilidades. En el momento en el que se registre, creará una base de su historial clínico 
                        con los datos más relevantes. Después de unos sencillos pasos, tendrá su aplicación lista para compartir su
                        historial con su médico, y tendrá comodidades que no tendría de otra manera.
                    </p>
                    <p><a class="btn btn-primary btn-lg" href="registro.jsp" role="button">Registrate ya »</a></p>
                    <p style="text-align:right;">Ya forman parte: 
                        <a class="btn btn-success btn-sm" href="#" role="button"><%=counter.getAmountOfDoctors()%> medicos <i class="fa fa-user-md fa-fw"></i></a>
                        <a class="btn btn-success btn-sm" href="#" role="button"><%=counter.getAmountOfPatients()%> pacientes <i class="fa fa-user fa-fw"></i></a>
                    </p>
                </div>
            </div>
            <section class="centerdesk">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <span class="glyphicon glyphicon-plus glyphicon-large" aria-hidden="true"></span>
                            <h3>Administra tu historial clinico</h3>
                            <p> 
                                Desde que te registras, tendrás tu propio historial médico, el cual podrás consultar 
                                y compartir con los médicos que creas oportuno para que puedan añadir historias al mismo.
                            </p>
                        </div>
                        <div class="col-md-4">
                            <span class="glyphicon glyphicon-calendar glyphicon-large" aria-hidden="true"></span>
                            <h3>Gestiona tus citas medicas</h3>
                            <p>
                                Pedir cita nunca fue tan facil. Podras gestionar tus citas médicas, pudiendo solicitar 
                                cita entre los distintos horarios disponibles por sus médicos y cancelarlas si fuera necesario.
                            </p>
                        </div>
                        <div class="col-md-4">
                            <span class="glyphicon glyphicon-user glyphicon-large" aria-hidden="true"></span>
                            <h3>Encuentra tu medico</h3>
                            <p>
                                Busca al medico que necesites de forma rapida y eficaz.Encuentra aquellos disponibles por nombre,especialidad e incluso localizacion.
                            </p>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

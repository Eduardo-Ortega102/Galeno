<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="menu">
            <h1>Galeno</h1>
            <form action="FrontController" method="POST">
                <input type="hidden" name="command" value="Login" />
                <table cellspacing="0" role="presentation">
                    <tbody>
                        <tr>
                            <td><label for="user">Correo electr&oacute;nico</label></td>
                            <td colspan="2"><label for="pass">Contraseña</label></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="email" id="user" value=""/></td>
                            <td><input type="password" name="password" id="pass"></td>
                            <td><input type="submit" value="Iniciar Sesión" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <form action="FrontController" method="POST">
                <input type="hidden" name="command" value="Register" />
                ¿Aun no estás registrado? <input type="submit" value="Registrate ahora"/>
            </form>
            <hr>
        </div>

        <%
            if (request.getParameter("error") != null){
                out.println("<div id=\"error\">");
                out.println("Usuario o contraseña incorrectos");
                out.println("</div>");
            }
        %>
        
        <div id="content">
            <p> 
                Galeno es una aplicación que le permite llevar a cabo una gestión de su actividad clínica a través de diversas utilidades.
                En el momento en el que se registre, creará su historial clínico con los datos más relevantes, y con unos sencillos pasos, podrá
                concertar citas con su médico. Etc, etc, etc
            </p>
        </div>
    </body>
</html>
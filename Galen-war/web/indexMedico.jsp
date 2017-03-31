<%@page import="entities.Medico"%>
<%!
    private boolean existSession(HttpServletRequest request){
        return request.getSession().getAttribute("user") != null;
    }

    private String getName(HttpSession session){
        Medico medico = (Medico) session.getAttribute("user");
        return medico.getNombre() + " " + medico.getApellido();
    }
%>
<%
    if (!existSession(request)) {
        request.getServletContext().getRequestDispatcher("/index.jsp?sessionError=true").forward(request, response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio Médico</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <h1><a href="indexMedico.html">Galeno</a></h1>
        <ul>
            <li><p>Nombre: <%=getName(request.getSession())%></p></li>
            <li><a href="gestionarAgenda.html">Gestionar Agenda</a></li>
            <li><a href="gestionarHorario.html">Planificaci&oacute;n</a></li>
            <li><a href="editarPerfil.jsp">Editar Perfil</a></li>
            <li><a href="FrontController?command=Logout">Cerrar Sesi&oacute;n</a></li>
        </ul>
        <h2>Agenda</h2>
        <!-- Comprobar si no existe algún registro de la planificación -->
        <a href="crearAgenda.html" hidden="">Crear Agenda</a>
        <table>
            <tr><th hidden="">Id</th><th>Día de la semana</th><th>Hora</th></tr>
            <!-- Foreach tabla ordenada por ID -->
            <tr>
                <td hidden="">1</td>
                <td>Lunes</td>
                <td>8:00-14:00</td>
            </tr>
            <tr>
                <td hidden="">1</td>
                <td>Lunes</td>
                <td>15:00-17:00</td>
            </tr>
            <tr>
                <td hidden="">2</td>
                <td>Martes</td>
                <td>10:00-12:00</td>
            </tr>
            <tr>
                <td hidden="">3</td>
                <td>Miércoles</td>
                <td>14:00-17:00</td>
            </tr>
        </table>
    </body>
</html>
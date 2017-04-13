<%@page import="controller.commands.citasMedico"%>
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
        <title>Agenda</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <meta name="viewport" content="width=device-width">
    </head>
    
        <jsp:include page="/WEB-INF/header.jsp"/>
        <% for(int i=0;i<10;i++){ %>
        <table>
            <tr><th>Id</th><th>Paciente</th><th>Hora</th></tr>
            <tr>
                <td>Identificador</td>
                <td>Nombre</td>
                <td>Hora de la cita</td>
                <td><a href="">Modificar</a></td>
                <td><a href="">Cancelar</a></td>
            </tr>
            <tr>
                <td><%= i%></td>
            </tr>
        </table>
        <%}%>
    </body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Cita"%>
<%@page import="controller.commands.citasMedico"%>
<%@page import="entities.Medico"%>
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
        <%for(Cita cita : (ArrayList<Cita>) request.getSession().getAttribute("agenda")){%>
        <table>
            <tr><th>Id</th><th>Paciente</th><th>Hora</th></tr>
            <tr>
                <td><%=cita.getId()%></td>
                <td><%=cita.getPaciente().getNombre()+" " +cita.getPaciente().getApellido()%></td>
                <td><%=cita.getHora()%></td>
                <td><a href="">Modificar</a></td>
                <td>
                    <form action="FrontController" method="post">
                        <input type="hidden" command="mostrarHistorial" value="<%=cita.getPaciente().getHistorial().getId()%>"> 
                    </form>
                </td>
                <td><a href="">Cancelar</a></td>
            </tr>
            <tr>
                <td><%=//i%></td>
            </tr>
        </table>
        <%}%>
    </body>
</html>
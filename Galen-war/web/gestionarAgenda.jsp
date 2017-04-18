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
        <%if(((ArrayList<Cita>)request.getSession().getAttribute("agenda")).size()>0) {%>
            <table>
                <tr><th>Id</th><th>Paciente</th><th>Hora</th></tr>
                <%for(Cita cita : (ArrayList<Cita>) request.getSession().getAttribute("agenda")){%>
                <tr>
                    <td hidden=""><%=cita.getId()%></td>
                    <td><%=cita.getPaciente().getNombre()+" " +cita.getPaciente().getApellido()%></td>
                    <td><%=cita.getHora()%></td>
                    <td>
                        <form action="FrontController" method="post">
                            <input type="hidden" name="command" value="MostrarHistorial" />
                            <input type="hidden" name="historial" value="<%=cita.getPaciente().getHistorial().getId()%>"> 
                            <button type=\"submit\">Ver Historial</button>
                        </form>
                    </td>
                </tr>
            <%}%>
            </table>
        <%} else {%> <h1>No tiene citas hoy</h1><%}%>
    </body>
</html>
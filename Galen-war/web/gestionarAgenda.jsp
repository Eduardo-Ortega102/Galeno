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
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Agenda de hoy</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <%if (((ArrayList<Cita>) request.getSession().getAttribute("agenda")).size() > 0) {%>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Horario
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead><tr><th hidden="">Id</th><th>Paciente</th><th>Hora</th></tr></thead>
                                    <%for (Cita cita : (ArrayList<Cita>) request.getSession().getAttribute("agenda")) {%>
                                    <tr>
                                        <td hidden=""><%=cita.getId()%></td>
                                        <td><%=cita.getPaciente().getNombre() + " " + cita.getPaciente().getApellido()%></td>
                                        <td><%=cita.getHora()%></td>
                                        <td>
                                            <form action="FrontController" method="post">
                                                <input type="hidden" name="command" value="ShowHistory" />
                                                <input type="hidden" name="historyId" value="<%=cita.getPaciente().getHistorial().getId()%>"> 
                                                <button type="submit">Ver Historial</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%}%>
                                </table>
                <%} else {%> <h1 class="gradeA">No tiene citas hoy</h1><%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/footerRef.html"/>        
    </body>
</html>
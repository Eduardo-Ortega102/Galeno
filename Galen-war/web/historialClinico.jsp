<%@page import="entities.Paciente"%>
<%@page import="entities.Historial"%>
<%@page import="entities.Historia"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial</title>
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Historial</h1>
                            <%if (request.getSession().getAttribute("history") != null) {
                                Historial historial2 = (Historial) request.getSession().getAttribute("history");
                                Paciente paciente = (Paciente) historial2.getPaciente();
                            %>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"> Historial</div>
                                <div class="panel-body">
                                    <table  width="100%" class="table compact" id="tablaDatos">
                                        <thead>
                                            <tr>
                                                <th colspan="2">Paciente</th>
                                            </tr>
                                            <tr>
                                                <th>DNI</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Nacimiento</th>
                                                <th>SSocial</th>
                                                <th>Telefono</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><%=paciente.getDni()%></td>
                                                <td><%=paciente.getNombre()%></td>
                                                <td><%=paciente.getApellido()%></td>
                                                <td><%=paciente.getNacimiento()%></td>
                                                <td><%=paciente.getSsocial()%></td>
                                                <td><%=paciente.getTelefono()%></td>
                                                <td><%=paciente.getEmail()%></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <%
                                        Historial historial = (Historial) request.getSession().getAttribute("history");
                                    %>
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead><tr><th colspan="4">Historias</th></tr><tr><th hidden="">Id</th><th>Fecha de consulta</th><th>Medico</th><th>Descripción</th><th>Tratamiento</th><th hidden="">Historial</th></tr></thead>
                                        <%for (Historia historia : historial.getHistoriaCollection()) {%>
                                        <tr>
                                            <td hidden=""><%=historia.getId()%></td>
                                            <td><%=historia.getFechacreacion()%></td>
                                            <td><%=historia.getMedico().getNombre() + " " + historia.getMedico().getApellido()%></td>
                                            <td><%=historia.getDescripcion()%></td>
                                            <td><%=historia.getTratamiento()%></td>
                                            <td hidden = "" ><%=historia.getHistorial()%></td>
                                        </tr>
                                        <%}%>
                                    </table>
                                    <%} else {%> 
                                    <h1 class="gradeA">No tiene historial</h1>
                                    <%}%>
                                    <a class="btn btn-primary pull-right" href="añadirHistoria.jsp" role="button">Añadir Historia</a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/printFooterRef.html"/>
    </body>
</html>
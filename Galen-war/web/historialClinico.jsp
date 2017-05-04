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
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Historial</h1>
                        </div>
                        <%if (request.getSession().getAttribute("history") != null) {
                                Historial historial2 = (Historial) request.getSession().getAttribute("history");
                                Paciente paciente = (Paciente) historial2.getPaciente();

                        %>
                        <table width="100%">
                            <thead><tr><th>DNI</th><th>Nombre</th><th>Apellido</th><th>Fecha de Nacimiento
                                    </th><th>Nº de la SS</th><th>Teléfono</th><th>E-Mail</th></tr></thead>
                            <tr>
                                <td><%=paciente.getDni()%></td>
                                <td><%=paciente.getNombre()%></td>
                                <td><%=paciente.getApellido()%></td>
                                <td><%=paciente.getNacimiento()%></td>
                                <td><%=paciente.getSsocial()%></td>
                                <td><%=paciente.getTelefono()%></td>
                                <td><%=paciente.getEmail()%></td>
                            </tr>
                        </table>
                        <br/>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <%
                                            Historial historial = (Historial) request.getSession().getAttribute("history");
                                        %>
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead><tr><th hidden="">Id</th><th>Fecha de consulta</th><th>Medico</th><th>Descripción</th><th>Tratamiento</th><th hidden="">Historial</th></tr></thead>
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
                                    </div>
                                </div>
                            </div>
                        </div>                
                        <jsp:include page="/WEB-INF/printFooterRef.html"/>
                    </body>
                </html>
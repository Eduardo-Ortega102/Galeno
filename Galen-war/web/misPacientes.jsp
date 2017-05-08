<%@page import="java.util.List"%>
<%@page import="entities.Paciente"%>
<%@page import="java.util.Collection"%>
<%@page import="entities.Medico"%>
<%@page import="entities.Cita"%>
<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Panel Medico</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>    
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
                <div id="page-wrapper">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Mis Pacientes</h1>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- /Codigo if para saber si tiene pacientes en primer lugar -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Pacientes
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Paciente</th>
                                                    <th>Historial</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% List<Paciente> misPacientes = 
                                                        (List<Paciente>) request.getSession().getAttribute("pacientesMedico"); %>
                                                        <% for(Paciente pacientes: misPacientes) { %>
                                                            <tr class="odd gradeX">
                                                            <td> <%=(pacientes.getNombre())%> <%=(pacientes.getApellido())
                                                            %> <% int idHistorial = pacientes.getHistorial().getId(); %></td>
                                                            <td><a class="btn btn-success btn-sm"href="FrontController?command=ShowHistory&historyId=<%= idHistorial%>">Ver</a></td>
                                                    <% } %>
                                                            
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                </div>
        </div>
        <jsp:include page="/WEB-INF/footerRef.html"/>        
    </body>
</html>
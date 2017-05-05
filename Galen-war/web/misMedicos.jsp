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
                                <h1 class="page-header">Mis medicos</h1>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- /Codigo if para saber si tiene pacientes en primer lugar -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Medicos
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Telefono</th>
                                                    <th>Email</th>
                                                    <th>Localizacion</th>
                                                    <th>Especialidad</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% List<Medico> misMedicos = 
                                                        (List<Medico>) request.getSession().getAttribute("pacientesMedico"); %>
                                                        <% for(Medico medicos: misMedicos) { %>
                                                            <tr class="odd gradeX">
                                                                <td> <%=(medicos.getNombre())%> </td>
                                                                <td> <%=(medicos.getApellido())%> </td>
                                                                <td> <%=(medicos.getTelefono())%> </td>
                                                                <td> <%=(medicos.getEmail())%> </td>
                                                                <td> <%=(medicos.getLocalizacion())%> </td>
                                                                <td> <%=(medicos.getEspecialidad())%> </td>
                                                            </tr>
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
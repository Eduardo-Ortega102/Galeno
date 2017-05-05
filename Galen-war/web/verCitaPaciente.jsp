<%@page import="controller.FacadeFactory"%>
<%@page import="entities.Paciente"%>
<%@page import="entities.Medico"%>
<%@page import="entities.Cita"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Medico"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas</title>
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Mis citas.</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

<%
    String id = ((Paciente) request.getSession().getAttribute("user")).getDni();
    Paciente paciente = FacadeFactory.pacienteFacade().find(id);
    Collection<Cita> citasPaciente = paciente.getCitaCollection();
%>
                 <%if (citasPaciente.size() > 0) {%>
                 <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Horario
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead><tr><th>Fecha</th><th>Hora</th><th>Medico</th><th>Lugar</th></tr></thead>
                                    <%for (Cita cita : citasPaciente) {%>
                                    <tr>
                                        <td><%=cita.getFecha()%></td>
                                        <td><%=cita.getHora()%></td>
                                        <td><%=cita.getMedico().getNombre() +" "+ cita.getMedico().getApellido()%></td>
                                        <td><%=cita.getMedico().getLocalizacion()%></td>
                                    </tr>
                                    <%}%>
                                </table>
                            </div>
                        </div>
                    </div>
                <%} else {%> 
                <h1 class="gradeA">No tienes citas vigentes.</h1>
                <%}%>
                </div>
            </div>
	</div>
        <jsp:include page="/WEB-INF/footerRef.html"/>
    </body>
</html>
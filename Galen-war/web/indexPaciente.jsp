<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entities.Paciente"%>
<%@page import="controller.FacadeFactory"%>
<%@page import="entities.Cita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Paciente</title>
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Mis proximas citas</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

<%
    String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    String id = ((Paciente) request.getSession().getAttribute("user")).getDni();
    Paciente paciente = FacadeFactory.pacienteFacade().find(id);
    ArrayList<Cita> proximasCitas = new ArrayList<Cita>();
    for (Cita cita : paciente.getCitaCollection()) {
        if (cita.getFecha().compareTo(fecha) > 0) proximasCitas.add(cita);
    }
%>
                 <%if (proximasCitas.size() > 0) {%>
                  <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead><tr><th>Fecha</th><th>Hora</th><th>Medico</th><th>Lugar</th><th>Eliminar</th></tr></thead>
                                    <%for (Cita cita : proximasCitas) {%>
                                    <tr>
                                        <td><%=cita.getFecha()%></td>
                                        <td><%=cita.getHora()%></td>
                                        <td><%=cita.getMedico().getNombre() +" "+ cita.getMedico().getApellido()%></td>
                                        <td><%=cita.getMedico().getLocalizacion()%></td>
                                        <td>
                                            <form action="FrontController" method="POST">
                                                <input type="hidden" name="command" value="Eliminar" />
                                                <input type="hidden" name="id" value="<%=cita.getId()%>"/>
                                                <button type="submit" class="btn btn-danger">Eliminar cita</button> 
                                            </form>
                                        </td>
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
<%@page import="java.util.Collection"%>
<%@page import="entities.Medico"%>
<%@page import="entities.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    private Collection<Horario> horario(Medico medico) {
        return medico.getHorarioCollection();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Horario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <jsp:include page="/WEB-INF/headerRef.html"/>
            <!-- Si ya existen pacientes para esas horas no podemos eliminar el registro -->
            <!-- Si ya existen pacientes para esas horas no podemos modificar el horario -->
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Horario semanal</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <%if (horario((Medico) request.getSession().getAttribute("user")).size() > 0) {%>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Horario
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead><tr><th>D&iacute;a</th><th>Inicio de jornada</th><th>Fin de jornada</th></tr></thead>
                                    <%for (Horario horario : horario((Medico) request.getSession().getAttribute("user"))) {%>
                                    <tr>
                                        <td><%=horario.getDiasemana()%></td>
                                        <td><%=horario.getHorainicio()%></td>
                                        <td><%=horario.getHorafin()%></td>
                                    </tr>
                                    <%}%>
                                </table>
                            </div>
                        </div>
                    </div>
                <%} else {%> 
                <h1 class="gradeA">A&uacute; no has definido tu horario, puedes hacerlo desde el men&uacute;: Editar mi horario</h1>
                <%}%>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/footerRef.html"/>        
    </body>
</html>
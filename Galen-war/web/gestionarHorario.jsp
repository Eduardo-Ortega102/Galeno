<%@page import="java.util.Collection"%>
<%@page import="entities.Medico"%>
<%@page import="entities.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    private static class Schedule {
        private final int id;
        private final String start;
        private final String end;

        public Schedule(int id, String start, String end) {
            this.start = start;
            this.end = end;
            this.id = id;
        }

        public int getId() {
            return id;
        }

        public String getStart() {
            return start;
        }

        public String getEnd() {
            return end;
        }
    }

    private Schedule horario(HttpServletRequest request, String day) {
        Medico medico = (Medico) request.getSession().getAttribute("user");
        for (Horario horario : medico.getHorarioCollection()) 
            if (horario.getDiasemana().equalsIgnoreCase(day)) 
                return new Schedule(horario.getId(), horario.getHorainicio(), horario.getHorafin());
        return new Schedule(-1, "", "");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Editar Horario</title>
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
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Editar Horario</h1>
                            <form action="FrontController" method="POST">
                                <input type="hidden" name="command" value="EditSchedule" />
                                <%Schedule horario;%>
                                <%for (String day : new String[]{"Lunes", "Martes", "Miercoles", "Jueves", "Viernes"}) {%>
                                <fieldset>
                                    <legend><%=day%></legend>
                                    <%horario = horario(request, day);%>
                                    <input type="hidden" name="id<%=day%>" value="<%=horario.getId()%>" />
                                    <label for="inicio<%=day%>">Hora inicio: </label>
                                    <input type="text" name="inicio<%=day%>" id="inicio<%=day%>" value="<%=horario.getStart()%>"/>
                                    <label for="fin<%=day%>">Hora fin: </label>
                                    <input type="text" name="fin<%=day%>" id="fin<%=day%>" value="<%=horario.getEnd()%>"/>
                                    <br/>
                                    <br/>
                                </fieldset>
                                <%}%>
                                <input type="submit" id="Guardar" value="Actualizar"/>
                            </form>
                            <br/><br/>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% if ("false".equals(request.getParameter("success"))) {%>
        <div class="alert alert-danger">
            <strong>Error!</strong> Algo ha ido mal
        </div>
        <%} else if ("true".equals(request.getParameter("success"))) {%>
        <div class="alert alert-success">
            <strong>Enhorabuena!</strong> Sus datos se han guardado con &eacute;xito
        </div>
        <%}%>
        <jsp:include page="/WEB-INF/footerRef.html"/>
    </body>
</html>
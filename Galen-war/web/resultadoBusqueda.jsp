<%@page import="java.util.List"%>
<%@page import="entities.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    private String printRecord(Medico medico) {
        return "<ol>"
                + "<li>Numero Colegiado: " + medico.getColegiado() + "</li>"
                + "<li>Localizacion: " + medico.getLocalizacion() + "</li>"
                + "<li>Nombre: " + medico.getNombre() + " " + medico.getApellido() + "</li>"
                + "<li>Telefono: " + medico.getTelefono() + "</li>"
                + "<li>Email: " + medico.getEmail() + "</li>"
                + "</ol>";
    }

    private String printList(List<Medico> list) {
        String records = "";
        for (Medico medico : list) records += "<li>" + printRecord(medico) + "</li>";
        return "<ul>" + records + "</ul>";
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busqueda</title>
    </head>
    <body>

        <jsp:include page="/WEB-INF/header.jsp"/>
        
        <%
            if (request.getSession().getAttribute("record") != null) {
                out.println(printRecord((Medico) request.getSession().getAttribute("record")));
            } else if (request.getSession().getAttribute("list") != null) {
                out.println(printList((List<Medico>) request.getSession().getAttribute("list")));
            } else {
                out.println("<div class=\"alert alert-danger\">");
                out.println("<strong>Error!</strong> El médico que busca no existe");
                out.println("</div>");
            }
        %>
    </body>
</html>


<%@page import="entities.Medico"%>
<%@page import="entities.User"%>
<%!
    private boolean existSession(HttpServletRequest request) {
        return request.getSession().getAttribute("user") != null;
    }

    private String getName(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user.getNombre() + " " + user.getApellido();
    }

    private String type(Object user) {
        return user instanceof Medico ? "Medico" : "Paciente";
    }

    private String printHomeLink(Object user) {
            return type(user).equals("Medico") ? "<a href=\"indexMedico.jsp\">Galeno</a>" : "<a href=\"index.jsp\">Galeno";
        }

    private String printMenu(Object user) {
        return type(user).equals("Medico") ? "<li><a href=\"gestionarCita.html\">Gestionar Cita</a></li>"
                + "<li><a href=\"historialClinico.html\">Historial Clínico</a></li>"
                + "<li><a href=\"misMedicos.html\">Gestionar Médicos</a></li>"
                + "<li><a href=\"misRecetas.html\">Recetas</a></li>" 
                : 
                "<li><a href=\"gestionarAgenda.html\">Gestionar Agenda</a></li>"
                + "<li><a href=\"gestionarHorario.html\">Planificaci&oacute;n</a></li>";
    }

%>
<%
    if (!existSession(request)) {
        request.getServletContext().getRequestDispatcher("/index.jsp?sessionError=true").forward(request, response);
    }
%>


<h1><%=printHomeLink(request.getSession().getAttribute("user"))%></h1>

<ul>
    <li><p>Usuario: <%=getName(request.getSession())%></p></li>
    <li><a href="editarPerfil.jsp">Editar datos del perfil</a></li>

    <%=printMenu(request.getSession().getAttribute("user"))%>

    <li><a href="FrontController?command=Logout">Cerrar Sesi&oacute;n</a></li>
</ul>  
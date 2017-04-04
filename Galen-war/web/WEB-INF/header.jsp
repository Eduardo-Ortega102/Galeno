
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
        return type(user).equals("Paciente") ? "<li><a href=\"gestionarCita.jsp\">Gestionar Cita</a></li>"
                + "<li><a href=\"FrontController?command=ShowHistory\">Historial Clínico</a></li>"
                + "<li><a href=\"misMedicos.jsp\">Gestionar Médicos</a></li>"
                + "<li><a href=\"misRecetas.jsp\">Recetas</a></li>"
                + "<li>" + searchDoctor() + "</li>"
                : 
                "<li><a href=\"gestionarAgenda.jsp\">Gestionar Agenda</a></li>"
                + "<li><a href=\"gestionarHorario.jsp\">Planificaci&oacute;n</a></li>";
    }

    private String searchDoctor() {
        return "<form action=\"FrontController\" method=\"POST\">"
                + "<input type=\"hidden\" name=\"command\" value=\"SearchDoctor\"/>"
                + "<input type=\"text\" name=\"colegiado\" placeholder=\"nºcolegiado\"/>"
                + "<button type=\"submit\">Buscar</button>"
                + "</form>";
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

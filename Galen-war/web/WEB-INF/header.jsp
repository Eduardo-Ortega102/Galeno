
<%!
    private boolean existSession(HttpServletRequest request) {
        return request.getSession().getAttribute("user") != null;
    }
%>
<%
    if (!existSession(request)) {
        request.getServletContext().getRequestDispatcher("/index.jsp?sessionError=true").forward(request, response);
    }
%>

<h1><a href="index.jsp">Galeno</a></h1>

<ul>
    <li><p>Nombre del paciente</p></li>
    <li><a href="gestionarCita.html">Gestionar Cita</a></li>
    <li><a href="historialClinico.html">Historial Clínico</a></li>
    <li><a href="misMedicos.html">Gestionar Médicos</a></li>
    <li><a href="misRecetas.html">Recetas</a></li>
    <li><a href="editarPerfil.html">Editar Perfil</a></li>
    <li><a href="logout.html">Cerrar Sesión</a></li>
</ul>

<ul>
    <li><p>Nombre: </p></li>
    <li><a href="gestionarAgenda.html">Gestionar Agenda</a></li>
    <li><a href="gestionarHorario.html">Planificaci&oacute;n</a></li>
    <li><a href="editarPerfil.jsp">Editar Perfil</a></li>
    <li><a href="FrontController?command=Logout">Cerrar Sesi&oacute;n</a></li>
</ul>
    
   
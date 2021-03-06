
<%@page import="entities.Paciente"%>
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
        return type(user).equals("Medico") ? "<a href=\"citasMedico.jsp\">Galeno</a>" : "<a href=\"indexPaciente.jsp\">Galeno";
    }

    private String printMenu(Object user) {
        return type(user).equals("Paciente") ? "<li><a href=\"gestionarCita.jsp\">Gestionar Cita</a></li>"
                + "<li><a href=\"FrontController?command=ShowHistory\">Historial Cl�nico</a></li>"
                + "<li><a href=\"misMedicos.jsp\">Gestionar M�dicos</a></li>"
                + "<li><a href=\"misRecetas.jsp\">Recetas</a></li>"
                + "<li>" + searchDoctor() + "</li>"
                : 
                "<li><a href=\"FrontController?command=citasMedico\">Gestionar Agenda</a></li>"
                + "<li><a href=\"gestionarHorario.jsp\">Planificaci&oacute;n</a></li>";
    }

    private String searchDoctor() {
        return "<form action=\"FrontController\" method=\"POST\">"
                + "<input type=\"hidden\" name=\"command\" value=\"SearchDoctor\"/>"
                + "<input type=\"text\" name=\"colegiado\" placeholder=\"n�colegiado\"/>"
                + "<button type=\"submit\">Buscar</button>"
                + "</form>";
    }

%>
<%
    if (!existSession(request)) {
        request.getServletContext().getRequestDispatcher("/index.jsp?sessionError=true").forward(request, response);
    }
%>

<%
    if(type(session.getAttribute("user"))=="Medico") {
%>

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;background-color:#26a888">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="color:black" href="gestionarAgenda.jsp"><%=getName(request.getSession())%></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
             
                <li class="dropdown">
                    <a class="dropdown-toggle" style="color:black" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="editarPerfil.jsp"><i class="fa fa-user fa-fw"></i> Mi Perfil</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="FrontController?command=Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Buscar paciente">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-table fa-fw"></i> Planificacion <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="active" href="FrontController?command=citasMedico">Agenda</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="FrontController?command=pacientesMedico"><i class="fa fa-edit fa-fw"></i> Mis Pacientes</a>
                        </li>
                      
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Historial<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="verHorario.jsp">Ver mi horario</a>
                                </li>
                                <li>
                                    <a href="gestionarHorario.jsp">Editar mi horario</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
<%
    } else {
%>
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;background-color:#26a888">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="color:black" href="indexPaciente.jsp"><%=getName(request.getSession())%></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
             
                <li class="dropdown">
                    <a class="dropdown-toggle" style="color:black" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="editarPerfil.jsp"><i class="fa fa-user fa-fw"></i> Mi Perfil</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="FrontController?command=Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Buscar medico">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> Mis citas <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a  href="gestionarCita.jsp">Concertar cita</a>
                                </li>
                                <li>
                                    <a href="verCitaPaciente.jsp">Historial citas</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="FrontController?command=medicosPaciente"><i class="fa fa-edit fa-fw"></i> Mis medicos</a>
                        </li>
                      
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Mi historial<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><% int idHistorial = ((Paciente) request.getSession().getAttribute("user")).getHistorial().getId(); %>
                                    <a href="FrontController?command=ShowHistory&historyId=<%=idHistorial%>">Mi historial cl�nico</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
<%
    } 
%>

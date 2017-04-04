<%@page import="entities.User"%>
<%@page import="entities.Medico"%>
<%@page import="entities.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    private String getLastFields(Object user) {
        if (user instanceof Medico) {
            Medico medico = (Medico) user;
            return "<label for=\"ncolegiadoMedico\">Numero Colegiado</label> "
                    + "<input readonly type=\"text\" name=\"ncolegiadoMedico\" id=\"colegiado\" value=\"" + medico.getColegiado() + "\"/>"
                    + "<label for=\"localizacionMedico\">Localizacion</label> "
                    + "<input type=\"text\" name=\"localizacionMedico\" id=\"localizacion\" value=\"" + medico.getLocalizacion() + "\"/>"
                    + "<br/>";
        }
        Paciente paciente = (Paciente) user;
        return "<label for=\"nseguridad\">Numero Seguridad Social</label> "
                + "<input type=\"text\" name=\"nseguridad\" id=\"ssocial\" value=\"" + paciente.getSsocial() + "\"/>"
                + "<br/>";
    }

    private String type(Object user) {
        return user instanceof Medico ? "Medico" : "Paciente";
    }

    private String dni(Object user) {
        return ((User) user).getDni();
    }

    private String name(Object user) {
        return ((User) user).getNombre();
    }

    private String surname(Object user) {
        return ((User) user).getApellido();
    }

    private Integer phone(Object user) {
        return ((User) user).getTelefono();
    }

    private String email(Object user) {
        return ((User) user).getEmail();
    }

    private String password(Object user) {
        return ((User) user).getPassword();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Perfil</title>
        <jsp:include page="/WEB-INF/hdcontent.html"/>    
    </head>
    <body>
        
	<div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                           <div class="col-lg-12">
                                <h1 class="page-header">Editar Perfil</h1>
                                <form action="FrontController" method="POST">
                                    <input type="hidden" name="command" value="EditProfile" />
                                    <input type="hidden" name="userType" value="<%=type(request.getSession().getAttribute("user"))%>" />
                                    <fieldset>
                                        <legend>Datos personales</legend>
                                        <label for="dniUsuario">DNI</label>
                                        <input readonly type="text" name="dniUsuario" id="dni" value="<%=dni(request.getSession().getAttribute("user"))%>"/>
                                        <label for="nombreUsuario">Nombre</label>
                                        <input type="text" name="nombreUsuario" id="nombre" value="<%=name(request.getSession().getAttribute("user"))%>"/>
                                        <label for="apellidosUsuario">Apellidos</label>
                                        <input type="text" name="apellidosUsuario" id="apellidos" value="<%=surname(request.getSession().getAttribute("user"))%>"/>
                                        <label for="telefonoUsuario">Telefono</label>
                                        <input type="tel" name="telefonoUsuario" id="telefono" value="<%=phone(request.getSession().getAttribute("user"))%>"/><br/>
                                        <br/>
                                        <%=getLastFields(request.getSession().getAttribute("user"))%>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Datos de la aplicación</legend>
                                        <label for="emailUsuario">Correo Electrónico</label>
                                        <input type="email" name="emailUsuario" id="correo" value="<%=email(request.getSession().getAttribute("user"))%>"/>
                                        <label for="passwordUsuario">Contraseña</label>
                                        <input type="password" name="passwordUsuario" id="password" value="<%=password(request.getSession().getAttribute("user"))%>"/><br/>
                                    </fieldset>
                                    <input type="submit" id="Guardar" value="Guardar Cambios"/>
                                </form>
                           </div>
                   </div>
                </div>
            </div>
	</div>

            
        <%
            if ("false".equals(request.getParameter("success"))) {
                out.println("<div class=\"alert alert-danger\">");
                out.println("<strong>Error!</strong> Algo ha ido mal");
                out.println("</div>");
            } else if ("true".equals(request.getParameter("success"))) {
                out.println("<div class=\"alert alert-success\">");
                out.println("<strong>Enhorabuena!</strong> Sus datos se han guardado con éxito");
                out.println("</div>");
            }
        %>
        
        
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="distweb/js/sb-admin-2.js"></script>
        
    </body>
</html>

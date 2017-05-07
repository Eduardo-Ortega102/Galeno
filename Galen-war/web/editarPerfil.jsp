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
                    + "<label for=\"especialidadMedico\">Especialidad</label> "
                    + "<input type=\"text\" name=\"especialidadMedico\" id=\"especialidadMedico\" value=\"" + medico.getEspecialidad() + "\"/>"
                    + "<label for=\"minutosConsulta\">Minutos por consulta</label> "
                    + "<input type=\"text\" name=\"minutosConsulta\" id=\"minutosConsulta\" value=\"" + medico.getMinutosconsulta()+ "\"/>"
                    + "<br/>";
        }
        Paciente paciente = (Paciente) user;
        return "<label for=\"nseguridad\">Numero Seguridad Social</label> "
                + "<input type=\"text\" name=\"nseguridad\" id=\"ssocial\" value=\"" + paciente.getSsocial() + "\"/>"
                + "<label for=\"nacimientoUsuario\">Fecha de nacimiento</label> "
                + "<input type=\"text\" name=\"nacimientoUsuario\" id=\"nacimientoUsuario\" value=\"" + paciente.getNacimiento() + "\"/>"
                + "<br/>";
    }

    private String type(Object user) {
        return user instanceof Medico ? "Medico" : "Paciente";
    }

    private String getId(User user){
        return user instanceof Medico ? ((Medico) user).getColegiado() : user.getDni();
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Perfil</title>
        <meta charset="UTF-8">
        <jsp:include page="/WEB-INF/headerRef.html"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            User user = (User) request.getSession().getAttribute("user");
        %>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                           <div class="col-lg-12">
                                <h1 class="page-header">Editar Perfil</h1>
                                <form action="FrontController" method="POST">
                                    <input type="hidden" name="command" value="EditProfile" />
                                    <input type="hidden" name="userType" value="<%=type(user)%>" />
                                    <fieldset>
                                        <legend>Datos personales</legend>
                                        <label for="dniUsuario">DNI</label>
                                        <input readonly type="text" name="dniUsuario" id="dni" value="<%=user.getDni()%>"/>
                                        <label for="nombreUsuario">Nombre</label>
                                        <input type="text" name="nombreUsuario" id="nombre" value="<%=user.getNombre()%>"/>
                                        <label for="apellidosUsuario">Apellidos</label>
                                        <input type="text" name="apellidosUsuario" id="apellidos" value="<%=user.getApellido()%>"/>
                                        <label for="telefonoUsuario">Telefono</label>
                                        <input type="tel" name="telefonoUsuario" id="telefono" value="<%=user.getTelefono()%>"/><br/>
                                        <br/>
                                        <%=getLastFields(request.getSession().getAttribute("user"))%>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Datos de la aplicación</legend>
                                        <label for="emailUsuario">Correo Electrónico</label>
                                        <input type="email" name="emailUsuario" id="correo" value="<%=user.getEmail()%>"/>
                                        <label for="passwordUsuario">Contraseña</label>
                                        <input type="password" name="passwordUsuario" id="password" value="<%=user.getPassword()%>"/><br/>
                                    </fieldset>
                                    <input type="submit" id="Guardar" value="Actualizar"/>
                                </form>
                                <form action="FrontController" method="POST">
                                    <input type="hidden" name="command" value="EliminarCuenta" />
                                    <input type="hidden" name="id" value="<%=getId(user)%>"/>
                                    <input type="hidden" name="type" value="<%=type(user)%>"/>
                                    <button type="submit" class="btn btn-danger">Eliminar cuenta</button> 
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
        <jsp:include page="/WEB-INF/footerRef.html"/>
    </body>
</html>

<%@page import="entities.User"%>
<%@page import="entities.Medico"%>
<%@page import="entities.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    private String getLastFields(Object user) {
        if (user instanceof Medico) {
            Medico medico = (Medico) user;
            return "<label for=\"colegiado\">Numero Colegiado</label> "
                    + "<input type=\"text\" name=\"colegiado\" id=\"colegiado\" value=\"" + medico.getColegiado() + "\"/>"
                    + "<label for=\"localizacion\">Localizacion</label> "
                    + "<input type=\"text\" name=\"localizacion\" id=\"localizacion\" value=\"" + medico.getLocalizacion() + "\"/>"
                    + "<br/>";
        }
        Paciente paciente = (Paciente) user;
        return "<label for=\"ssocial\">Numero Seguridad Social</label> "
                + "<input type=\"text\" name=\"ssocial\" id=\"ssocial\" value=\"" + paciente.getSsocial() + "\"/>"
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
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <jsp:include page="/WEB-INF/header.jsp"/>

        <h2>Editar Perfil de Usuario</h2>
        <form action="FrontController" method="POST">
            <input type="hidden" name="command" value="EditProfile" />
            <input type="hidden" name="userType" value="<%=type(request.getSession().getAttribute("user"))%>" />
            <fieldset>
                <legend>Datos personales</legend>
                <label for="dni">DNI</label>
                <input type="text" name="dni" id="dni" value="<%=dni(request.getSession().getAttribute("user"))%>"/>
                <label for="nombre">Nombre</label>
                <input type="text" name="nombre" id="nombre" value="<%=name(request.getSession().getAttribute("user"))%>"/>
                <label for="apellidos">Apellidos</label>
                <input type="text" name="apellidos" id="apellidos" value="<%=surname(request.getSession().getAttribute("user"))%>"/>
                <label for="telefono">Telefono</label>
                <input type="tel" name="telefono" id="telefono" value="<%=phone(request.getSession().getAttribute("user"))%>"/><br/>
                <br/>
                <%=getLastFields(request.getSession().getAttribute("user"))%>
            </fieldset>
            <fieldset>
                <legend>Datos de la aplicación</legend>
                <label for="correo">Correo Electrónico</label>
                <input type="email" name="correo" id="correo" value="<%=email(request.getSession().getAttribute("user"))%>"/>
                <label for="password">Contraseña</label>
                <input type="password" name="password" id="password" value="<%=password(request.getSession().getAttribute("user"))%>"/><br/>
            </fieldset>
            <input type="submit" id="Guardar" value="Guardar Cambios"/>
        </form>
    </body>
</html>

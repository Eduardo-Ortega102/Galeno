<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <jsp:include page="/WEB-INF/header.jsp"/>
        
        <h2>Planificación</h2>
        <table>
            <button><a href="">Agregar</a></button>
            <!-- Si ya existen pacientes para esas horas no podemos eliminar el registro -->
            <!-- Si ya existen pacientes para esas horas no podemos modificar el horario -->
            <tr><th hidden="">Id</th><th>Día de la semana</th><th>Hora</th></tr>
            <!-- Foreach tabla ordenada por ID -->
            <tr>
                <td hidden="">1</td>
                <td>Lunes</td>
                <td>8:00-14:00</td>
                <td><a href="editarPlanificacion.html?=id">Modificar</a></td>
                <td><a href="">Eliminar</a></td>
            </tr>
            <tr>
                <td hidden="">1</td>
                <td>Lunes</td>
                <td>15:00-17:00</td>
                <td><a href="editarPlanificacion.html?=id">Modificar</a></td>
                <td><a href="">Eliminar</a></td>
            </tr>
            <tr>
                <td hidden="">2</td>
                <td>Martes</td>
                <td>10:00-12:00</td>
                <td><a href="editarPlanificacion.html?=id">Modificar</a></td>
                <td><a href="">Eliminar</a></td>
            </tr>
            <tr>
                <td hidden="">3</td>
                <td>Miércoles</td>
                <td>14:00-17:00</td>
                <td><a href="editarPlanificacion.html?=id">Modificar</a></td>
                <td><a href="">Eliminar</a></td>
            </tr>
        </table>
    </body>
</html>
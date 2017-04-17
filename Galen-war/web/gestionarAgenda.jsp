<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agenda</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <meta name="viewport" content="width=device-width">
    </head>
    
        <jsp:include page="/WEB-INF/header.jsp"/>
        
        <table>
            <tr>
                <th>Id</th>
                <th>Paciente</th>
                <th>Hora</th>
            </tr>
            <tr>
                <td>Identificador</td>
                <td>Nombre</td>
                <td>Hora de la cita</td>
                <td><a href="">Modificar</a></td>
                <td><a href="">Cancelar</a></td>
            </tr>
        </table>
    </body>
</html>

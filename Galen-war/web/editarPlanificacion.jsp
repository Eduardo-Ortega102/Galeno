<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Agenda</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <meta name="viewport" content="width=device-width">
    </head>
    
        <jsp:include page="/WEB-INF/header.jsp"/>
        
        <h2>Editar Planificar</h2>
        <form action="" method="post" onsubmit="return agenda();">
            <fieldset>
                <legend>Nombre Paciente</legend>
                <label for="dia">Día de la Semana</label>
                <input type="text" name="día" id="día" value=""/><!--<br/>-->
                <label for="hora">Hora</label>
                <input type="date" name="hora" id="hora" value=""/><br/>
                <input type="submit" id="Guardar" value="Guardar Cambios"/>
                <input type="submit" id="Cancelar" value="Cancelar"/>
            </fieldset>
        </form>
</html>

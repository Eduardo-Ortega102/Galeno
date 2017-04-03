<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/header.jsp"/>
        <h1>este es el perfil de <%= request.getParameter("email") %></h1>
    </body>
</html>
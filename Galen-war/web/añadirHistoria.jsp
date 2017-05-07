<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Paciente</title>
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                           <div class="col-lg-12">
                               <h1 class="page-header">Añadir Historia</h1>
                           </div>
                   </div>
                    <div class="row">
                           <div class="col-lg-12">
                               <div class="panel panel-default">
                                   <div class="panel-heading">
                                       Nueva Historia
                                   </div>
                                   <div class="panel-body">
                                       <form action="FrontController" method="POST">
                                           <input type="hidden" name="command" value="addHistory" />
                                           <div class="form-group">
                                               <label for="inputDescripcion">Descripcion</label>
                                               <textarea class="form-control" rows="5" id="inputDescripcion" name = "descripcion" placeholder="Sintomas/Observaciones"></textarea>
                                           </div>
                                           <div class="form-group">
                                                <label for="inputTratamiento">Tratamiento</label>
                                                <input type="text" class="form-control" id="inputTratamiento" name = "tratamiento" placeholder="Indicaciones/Medicacion">
                                           </div>
                                           <button type="submit" class="btn btn-primary pull-right">Crear</button>
                                       </form>
                                   </div>
                               </div>
                           </div>
                   </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/footerRef.html"/>
    </body>
</html>
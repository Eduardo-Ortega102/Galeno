<%@page import="controller.FacadeFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Medico"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas</title>
        <jsp:include page="/WEB-INF/headerRef.html"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/WEB-INF/header.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Concertar cita</h1>
                        </div>
                   </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Nueva cita
                                </div>
                                <div class="panel-body">
                                    <form action="FrontController" method="POST" autocomplete="on"> 
                                        <input type="hidden" name="command" value="Concretar" />
                                        <div class="form-group">
                                            <label for="medico">Medico: </label>
                                            <select class=form-control style="width: 40%;" id="medico" name="medico" required="required">
                                                <% for(Medico medico : FacadeFactory.medicoFacade().findAll()){%>
                                                    <option value="<%=medico.getColegiado()%>"><%=medico.getNombre()+" "+medico.getApellido()%></option>
                                                <% } %>
                                            </select>                       
                                        </div>
                                        <div class="form-group">
                                            <label for="fecha">Fecha: </label>
                                            <input class=form-control style="width: 30%;" id="fecha" name="fecha" required="required" type="date" placeholder="Fecha" />
                                        </div>
                                        <div class="form-group">
                                            <label for="hora">Hora: </label>
                                            <input class=form-control style="width: 30%;" id="hora" name="hora" required="required" type="text" placeholder="12:00" />
                                        </div>
                                        <button type="submit" class="btn btn-primary">Concertar</button> 
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
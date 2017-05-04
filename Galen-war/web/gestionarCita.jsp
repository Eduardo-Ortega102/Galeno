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
                               <h1 class="page-header">Concrete la cita.</h1>
                           </div>
                   </div>
                </div>
                <form class="form" action="FrontController" method="POST" autocomplete="on"> 
                    <input type="hidden" name="command" value="Concretar" />
                    <div class="form-group">
                        <label>Medico: </label>
                        <select id="medico" name="medico" required="required">
                            <% for(Medico medico : FacadeFactory.medicoFacade().findAll()){%>
                                <option value="<%=medico.getColegiado()%>"><%=medico.getNombre()+" "+medico.getApellido()%></option>
                            <% } %>
                        </select>                       
                    </div>
                    <div class="form-group">
                        <input id="fecha" name="fecha" required="required" type="text" placeholder="Fecha" />
                    </div>
                    <div class="form-group">
                        <input id="hora" name="hora" required="required" type="text" placeholder="Hora" />
                    </div>
                    <button type="submit" class="btn btn-primary">Concretar cita.</button> 
                </form>                            
            </div>
	</div>
        <jsp:include page="/WEB-INF/footerRef.html"/>
    </body>
</html>
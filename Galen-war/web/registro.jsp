<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de registro</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
    </head>
    <body class="stripebg">

        <%
            if (request.getParameter("error") != null) {
                out.println("<div class=\"alert alert-danger\">");
                out.println("El usuario ya está dado de alta");
                out.println("</div>");
            }
        %>
        
        <div class="container">
            <div class="col-md-8 col-md-offset-2" style="margin-top: 100px;margin-bottom: 100px">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        Registro
                    </div>
                    <div class="panel-body">
                        <form class="form" action="FrontController" method="POST" autocomplete="on"> 
                            <input type="hidden" name="command" value="Register" />
                            <div class="form-group">
                                <label>Tu nombre: </label>
                                <input id="nombreUsuario" name="nombreUsuario" required="required" type="text" placeholder="Nombre" />
                            </div>
                            <div class="form-group">
                                <label>Tus apellidos: </label>
                                <input id="apellidosUsuario" name="apellidosUsuario" required="required" type="text" placeholder="Apellidos" />
                            </div>
                            <div class="form-group">
                                <label> Tu correo electrónico: </label>
                                <input id="emailUsuario" name="emailUsuario" required="required" type="email" placeholder="miemail@mail.com"/> 
                            </div>
                            <div class="form-group">
                                <label>Contraseña: </label>
                                <input id="passwordUsuario" name="passwordUsuario" required="required" type="password" placeholder="eg. X8df!90EO"/>
                            </div>
                            <div class="form-group">
                                <label>DNI: </label>
                                <input id="dniUsuario" name="dniUsuario" required="required" type="text" placeholder="11111111 X"/>
                            </div>
                            <div class="form-group">
                                <label>Telefono: </label>
                                <input id="telefonoUsuario" name="telefonoUsuario" required="required" type="number" placeholder="123456789"/>
                            </div>
                            <div class="form-group"> 
                                <input type="radio" name="Roles" value="Paciente" onclick="mostrar(this.value)" /><label> Paciente </label>
                                <input type="radio" name="Roles" value="Medico" onclick="mostrar(this.value)" /><label> Médico </label>
                            </div>

                            <div id="datosPaciente" style='display:none'>
                                <h4>Introduzca sus datos como paciente</h4>
                                <p> 
                                    <label>Tu número de seguridad social: </label>
                                    <input id="nseguridad" name="nseguridad" type="text" placeholder="" />
                                </p>
                                <p> 
                                    <label>Fecha de nacimiento: </label>
                                    <input id="nacimientoUsuario" name="nacimientoUsuario" required="required" type="date" value="1990-01-01"/>
                                </p>
                                <p> 
                                    <label>Nombre las alergias y/o enfermedades que tiene: </label>
                                    <input id="alergiasPaciente" required="required" name="alergiasPaciente" type="text" placeholder="" />
                                </p>
                            </div>

                            <div id="datosMedico" style='display:none'>
                                <h4>Introduzca sus datos como médico</h4>
                                <p> 
                                    <label>Tu número de colegiado: </label>
                                    <input id="ncolegiadoMedico" name="ncolegiadoMedico" type="text" placeholder="" />
                                </p>
                                <p> 
                                    <label>Nombre cual es su especialidad: </label>
                                    <input id="especialidadMedico" name="especialidadMedico" type="text" placeholder="" />
                                </p>
                                <p> 
                                    <label>Escriba la cantidad de minutos que necesitará por consulta: </label>
                                    <input id="minutosConsulta" name="minutosConsulta" type="number" placeholder="15" />
                                </p>
                                <p> 
                                    <label>Escriba la localización de sus consultas: </label>
                                    <input id="localizacionMedico" name="localizacionMedico" type="text" placeholder="" />
                                </p>
                            </div>

                                <button type="submit" class="btn btn-primary">Registrarse</button> 
                                <button class="btn btn-primary" type="button" onclick="confirmarCancelacion()">Cancelar registro</button>
                        </form>
                    </div>
            </div>
        </div>


        <script>
            function confirmarCancelacion() {
                if (confirm("¿Estás seguro de que quiere cancelar el registro?") === true) {
                    window.location.replace('index.jsp');
                }
            }

            function mostrar(rol) {
                if (rol === "Paciente") {
                    document.getElementById("datosPaciente").style.display = 'block';
                    document.getElementById("nseguridad").required = true;
                    document.getElementById("nacimientoUsuario").required = true;
                    document.getElementById("datosMedico").style.display = 'none';
                    document.getElementById("ncolegiadoMedico", "localizacionMedico").required = false;
                    document.getElementById("especialidadMedico").required = false;
                    document.getElementById("minutosConsulta").required = false;
                } else {
                    document.getElementById("datosMedico").style.display = 'block';
                    document.getElementById("ncolegiadoMedico", "localizacionMedico").required = true;
                    document.getElementById("especialidadMedico").required = true;
                    document.getElementById("minutosConsulta").required = true;
                    document.getElementById("datosPaciente").style.display = 'none';
                    document.getElementById("nseguridad").required = false;
                    document.getElementById("nacimientoUsuario").required = false;
                }
            }
            function confirmacion() {
                day = new Date();
                id = day.getTime();
                eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=150,height=100');");
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
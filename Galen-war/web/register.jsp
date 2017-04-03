<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de registro</title>
    </head>
    <body>
        <h1>Si desea registrarse en nuestra aplicación de Galeno, introduzca a continuación los siguientes datos:</h1>

        <%
            if (request.getParameter("error") != null) {
                out.println("<div class=\"alert alert-danger\">");
                out.println("Este usuario con el DNI o Numero de colegiado ya está dado de alta");
                out.println("</div>");
            }
        %>
        <form class="navbar-form navbar-right" action="FrontController" method="POST" autocomplete="on"> 
            <input type="hidden" name="command" value="Register" />
            <p> 
                <label>Tu nombre: </label>
                <input id="nombreUsuario" name="nombreUsuario" required="required" type="text" placeholder="Nombre" />
            </p>
            <p> 
                <label>Tus apellidos: </label>
                <input id="apellidosUsuario" name="apellidosUsuario" required="required" type="text" placeholder="Apellidos" />
            </p>
            <p> 
                <label> Tu correo electrónico: </label>
                <input id="emailUsuario" name="emailUsuario" required="required" type="email" placeholder="miemail@mail.com"/> 
            </p>
            <p> 
                <label>Contraseña: </label>
                <input id="passwordUsuario" name="passwordUsuario" required="required" type="password" placeholder="eg. X8df!90EO"/>
            </p>
            <p> 
                <label>DNI: </label>
                <input id="dniUsuario" name="dniUsuario" required="required" type="text" placeholder="11111111 X"/>
            </p>
            <p> 
                <label>Telefono: </label>
                <input id="telefonoUsuario" name="telefonoUsuario" required="required" type="number" placeholder="123456789"/>
            </p>
            <p> 
                <input type="radio" name="Roles" value="Paciente" onclick="mostrar(this.value)" /><label> Paciente </label>
                <input type="radio" name="Roles" value="Medico" onclick="mostrar(this.value)" /><label> Médico </label>
            </p>

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
                    <label>Nombre las alergias y/o enfermedades que tiene(si deja el campo vacío se entiende que no tiene ninguna): </label>
                    <input id="alergiasPaciente" name="alergiasPaciente" type="text" placeholder="" />
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

            <p class="BotonDeRegistro"> 
                <input type="submit" value="Registrarse"/> 
                <input class="button" type="button" onclick="confirmarCancelacion()" value="Cancelar registro" />
            </p>
        </form>


        <script>
            function confirmarCancelacion() {
                if (confirm("¿Estás seguro de que quiere cancelar el registro?") === true) {
                    window.location.replace('index.html');
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
    </body>
</html>
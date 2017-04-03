package controller;

import entities.Historial;
import entities.Medico;
import entities.Paciente;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

public class EntityFactory {

    public static Medico medico(HttpServletRequest request) {
        String colegiado = request.getParameter("ncolegiadoMedico");
        String localizacion = request.getParameter("localizacionMedico");
        String especialidad = request.getParameter("especialidadMedico");
        int minutosConsulta = Integer.parseInt(request.getParameter("minutosConsulta"));
        return new Medico(colegiado, nombre(request), apellidos(request), dni(request), telefono(request), email(request), password(request), localizacion, especialidad, minutosConsulta);
    }

    public static Paciente paciente(HttpServletRequest request) {
        String ssocial = request.getParameter("nseguridad");
        String fechaNacimiento = (String) request.getParameter("nacimientoUsuario");
        return new Paciente(dni(request), nombre(request), apellidos(request), ssocial, telefono(request), email(request), password(request), fechaNacimiento);
    }

    //Corregir esto. Paciente es el problema
    public static Historial historial(HttpServletRequest request) {
        int idHistorial = 3;
        String fecha = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        String notas = request.getParameter("alergiasPaciente");
        return new Historial(idHistorial, fecha, paciente(request),notas);
    }

    private static String dni(HttpServletRequest request) {
        return request.getParameter("dniUsuario");
    }

    private static String nombre(HttpServletRequest request) {
        return request.getParameter("nombreUsuario");
    }

    private static String apellidos(HttpServletRequest request) {
        return request.getParameter("apellidosUsuario");
    }

    private static int telefono(HttpServletRequest request) throws NumberFormatException {
        return Integer.parseInt(request.getParameter("telefonoUsuario"));
    }

    private static String email(HttpServletRequest request) {
        return request.getParameter("emailUsuario");
    }

    private static String password(HttpServletRequest request) {
        return request.getParameter("passwordUsuario");
    }
}

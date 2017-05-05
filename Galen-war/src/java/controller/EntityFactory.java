package controller;

import entities.Cita;
import entities.Historial;
import entities.Medico;
import entities.Paciente;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

public final class EntityFactory {

    private EntityFactory() {
    }

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
        return new Paciente(dni(request), nombre(request), apellidos(request), fechaNacimiento, ssocial, telefono(request), email(request), password(request));
    }

    public static Historial historial(HttpServletRequest request, int historialId) {
        String fecha = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        String notas = request.getParameter("alergiasPaciente");
        return new Historial(historialId, fecha, notas, paciente(request));
    }

        
    public static Cita cita(HttpServletRequest request, Paciente paciente, int citaId) {
        Cita cita = new Cita(citaId, request.getParameter("fecha"), request.getParameter("hora"));
        cita.setMedico(FacadeFactory.medicoFacade().find(request.getParameter("medico")));
        cita.setPaciente(paciente);
        return cita;
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
        return Integer.parseInt(request.getParameter("telefonoUsuario").trim());
    }

    private static String email(HttpServletRequest request) {
        return request.getParameter("emailUsuario");
    }

    private static String password(HttpServletRequest request) {
        return request.getParameter("passwordUsuario");
    }
}

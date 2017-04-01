package controller;

import entities.Medico;
import entities.Paciente;
import javax.servlet.http.HttpServletRequest;

public class EntityFactory {
    
    public static Medico medico(HttpServletRequest request){
        String colegiado = request.getParameter("ncolegiadoMedico");
        String localizacion = request.getParameter("localizacionMedico");
        return new Medico(colegiado, nombre(request), apellidos(request), dni(request), telefono(request), email(request), password(request), localizacion);
    }
    
    public static Paciente paciente(HttpServletRequest request){
        String ssocial = request.getParameter("nseguridad");
        return new Paciente(dni(request), nombre(request), apellidos(request), ssocial, telefono(request), email(request), password(request));
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

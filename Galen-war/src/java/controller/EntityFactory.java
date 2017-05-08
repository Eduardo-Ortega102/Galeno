package controller;

import static controller.FacadeFactory.citaFacade;
import static controller.FacadeFactory.historialFacade;
import entities.Cita;
import entities.Historia;
import entities.Historial;
import entities.Medico;
import entities.Paciente;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public final class EntityFactory {

    private static Integer generateCitaId(Paciente paciente) {
        List<Cita> citas = citaFacade().findAll();
        Collections.sort(citas, new Comparator<Cita>() {
            @Override
            public int compare(Cita o1, Cita o2) {
                return Integer.compare(o1.getId(), o2.getId());
            }
        });
        return citas.get(citas.size() - 1).getId() + 1;
    }

    private static Integer generateHistorialId() {
        List<Historial> historiales = historialFacade().findAll();
        Collections.sort(historiales, new Comparator<Historial>() {
            @Override
            public int compare(Historial o1, Historial o2) {
                return Integer.compare(o1.getId(), o2.getId());
            }
        });
        return historiales.get(historiales.size() - 1).getId() + 1;
    }
    

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

    public static Historial historial(HttpServletRequest request) {
        String fecha = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        String notas = request.getParameter("alergiasPaciente");
        Integer historialId = generateHistorialId();
        return new Historial(historialId, fecha, notas, paciente(request));
    }
    
    public static Historia historia(HttpServletRequest request,int historiaId) {
        String fecha = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String descripcion = request.getParameter("descripcion");
        String tratamiento = request.getParameter("tratamiento");
        Historia historia = new Historia(historiaId,fecha,descripcion);
        historia.setTratamiento(tratamiento);
        historia.setMedico((Medico)request.getSession().getAttribute("user"));
        historia.setHistorial((Historial)request.getSession().getAttribute("history"));
        return historia;
        
    }

    public static Cita cita(HttpServletRequest request, Paciente paciente) {
        Integer citaId = generateCitaId(paciente);
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

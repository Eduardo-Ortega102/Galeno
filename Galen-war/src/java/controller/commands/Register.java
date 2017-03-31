
package controller.commands;

import beans.MedicoFacade;
import beans.PacienteFacade;
import entities.Medico;
import entities.Paciente;
import static controller.FacadeFactory.*;

public class Register extends FrontCommand{

    private void errorRegistro() {
        forward("/register.jsp?error=1");
    }
        
    @Override
    public void process() {
        if (request.getParameter("Roles").equals("Paciente")) {
            crearPaciente();
        } else if (request.getParameter("Roles").equals("Medico")) {
            crearMedico();
        } else {
            errorRegistro();
            return;
        }
        forward("/index.jsp?successfulRegister=true");
    }

    private void crearPaciente() {
        PacienteFacade facade = createPacienteFacade();
        if (existPatient(facade)) errorRegistro();
        String dni = request.getParameter("dniUsuario");
        String nombre = request.getParameter("nombreUsuario");
        String apellido = request.getParameter("apellidosUsuario");
        String ssocial = request.getParameter("nseguridad");
        int telefono = Integer.parseInt(request.getParameter("telefonoUsuario"));
        String email = request.getParameter("emailUsuario");
        String password = request.getParameter("passwordUsuario");
        facade.create(new Paciente(dni, nombre, apellido, ssocial, telefono, email, password));
    }

    private void crearMedico() {
        MedicoFacade facade = createMedicoFacade();
        if (existDoctor(facade)) errorRegistro();
        String colegiado = request.getParameter("ncolegiadoMedico");
        String nombre = request.getParameter("nombreUsuario");
        String apellido = request.getParameter("apellidosUsuario");
        String dni = request.getParameter("dniUsuario");
        int telefono = Integer.parseInt(request.getParameter("telefonoUsuario"));
        String email = request.getParameter("emailUsuario");
        String password = request.getParameter("passwordUsuario");
        String localizacion = request.getParameter("localizacionMedico");
        facade.create(new Medico(colegiado, nombre, apellido, dni, telefono, email, password, localizacion));
    }

    private boolean existPatient(PacienteFacade miPaciente) {
        for (Paciente paciente : miPaciente.findAll())
            if (paciente.getDni().equals(request.getParameter("dniUsuario"))) {
                return true;
            }
        return false;
    }

    private boolean existDoctor(MedicoFacade miMedico) {
        for (Medico medico : miMedico.findAll())
            if (medico.getColegiado().equals(request.getParameter("ncolegiadoMedico"))) {
                return true;
            }
        return false;
    }
}

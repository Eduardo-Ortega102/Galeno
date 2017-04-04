
package controller.commands;

import beans.HistorialFacade;
import beans.MedicoFacade;
import beans.PacienteFacade;
import static controller.EntityFactory.historial;
import entities.Paciente;
import static controller.EntityFactory.medico;
import static controller.EntityFactory.paciente;
import static controller.FacadeFactory.historialFacade;
import static controller.FacadeFactory.medicoFacade;
import static controller.FacadeFactory.pacienteFacade;

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
        if (existPatient()) errorRegistro();
        //final Paciente paciente = paciente(request);
        pacienteFacade().create(paciente(request));
        HistorialFacade facadeHistory = historialFacade();
        facadeHistory.create(historial(request, paciente(request)));
    }

    private void crearMedico() {
        MedicoFacade facade = medicoFacade();
        if (existDoctor()) errorRegistro();
        facade.create(medico(request));
    }
    

    private boolean existPatient() {
        return pacienteFacade().find(request.getParameter("dniUsuario")) != null;
    }

    private boolean existDoctor() {
        return medicoFacade().find(request.getParameter("ncolegiadoMedico")) != null;
    }
}

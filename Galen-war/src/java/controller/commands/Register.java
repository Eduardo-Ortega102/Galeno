
package controller.commands;

import beans.HistorialFacade;
import static controller.EntityFactory.historial;
import static controller.EntityFactory.medico;
import static controller.EntityFactory.paciente;
import static controller.FacadeFactory.pacienteFacade;
import static controller.FacadeFactory.medicoFacade;
import static controller.FacadeFactory.historialFacade;

public class Register extends FrontCommand{

    private boolean success;

    @Override
    public void process() {
        success = false;
        if (request.getParameter("Roles").equals("Paciente")) success = crearPaciente();
        else if (request.getParameter("Roles").equals("Medico")) success = crearMedico();
        if (success) 
            forward("/index.jsp?successfulRegister=true");
        else
            forward("/register.jsp?error=1");
    }

    private boolean crearPaciente() {
        if (existPatient()) return false;
        pacienteFacade().create(paciente(request));
        final HistorialFacade facade = historialFacade();
        facade.create(historial(request, facade.count()));
        return true;
    }

    private boolean crearMedico() {
        if (existDoctor()) return false;
        medicoFacade().create(medico(request));
        return true;
    }

    private boolean existPatient() {
        return pacienteFacade().find(request.getParameter("dniUsuario")) != null;
    }

    private boolean existDoctor() {
        return medicoFacade().find(request.getParameter("ncolegiadoMedico")) != null;
    }
}

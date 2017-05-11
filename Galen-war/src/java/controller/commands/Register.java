package controller.commands;

import static controller.EntityFactory.historial;
import static controller.EntityFactory.medico;
import static controller.EntityFactory.paciente;
import static controller.FacadeFactory.pacienteFacade;
import static controller.FacadeFactory.medicoFacade;
import static controller.FacadeFactory.historialFacade;
import entities.Historial;
import entities.Paciente;

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
            forward("/registro.jsp?error=1");
    }

    private boolean crearPaciente() {
        if (existPatient()) return false;
        Paciente paciente = paciente(request);
        pacienteFacade().create(paciente);
        Historial historial = historial(request, paciente);
        historialFacade().create(historial);
        paciente.setHistorial(historial);
        pacienteFacade().edit(paciente);
        return true;
    }

    private boolean crearMedico() {
        if (existDoctor()) return false;
        medicoFacade().create(medico(request));
        return true;
    }

    private boolean existPatient() {
        return pacienteFacade().find(request.getParameter("dniUsuario")) != null ||
                existEmail();
    }

    private boolean existDoctor() {
        return medicoFacade().find(request.getParameter("ncolegiadoMedico")) != null||
                existEmail();
    }
    
    private boolean existEmail() {
        return pacienteFacade().findByEmail(request.getParameter("emailUsuario")) != null ||
                medicoFacade().findByEmail(request.getParameter("emailUsuario")) != null ;
    }
}
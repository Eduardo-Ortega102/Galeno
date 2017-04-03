
package controller.commands;

import beans.HistorialFacade;
import beans.MedicoFacade;
import beans.PacienteFacade;
import entities.Medico;
import entities.Paciente;
import static controller.EntityFactory.medico;
import static controller.EntityFactory.paciente;
import static controller.EntityFactory.historial;
import static controller.FacadeFactory.medicoFacade;
import static controller.FacadeFactory.pacienteFacade;
import static controller.FacadeFactory.historialFacade;

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
        PacienteFacade facade = pacienteFacade();
        //HistorialFacade facadeHistory = historialFacade();
        if (existPatient(facade)) errorRegistro();
        facade.create(paciente(request));
        //facadeHistory.create(historial(request));
    }

    private void crearMedico() {
        MedicoFacade facade = medicoFacade();
        if (existDoctor(facade)) errorRegistro();
        facade.create(medico(request));
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

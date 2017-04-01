package controller.commands;

import static controller.EntityFactory.medico;
import static controller.EntityFactory.paciente;
import static controller.FacadeFactory.medicoFacade;
import static controller.FacadeFactory.pacienteFacade;
import entities.Medico;
import entities.Paciente;
import entities.User;

public class EditProfile extends FrontCommand {

    @Override
    public void process() {
        User user = (User) request.getSession().getAttribute("user");
        if (request.getParameter("userType").equals("Medico")) 
            user = editMedico();
        else if (request.getParameter("userType").equals("Paciente"))
            user = editPaciente();
        else 
            forward("/editarPerfil.jsp?success=false");
        request.getSession().setAttribute("user", user);
        forward("/editarPerfil.jsp?success=true");
    }

    private Paciente editPaciente() {
        final Paciente paciente = paciente(request);
        pacienteFacade().edit(paciente);
        return paciente;
    }

    private Medico editMedico() {
        final Medico medico = medico(request);
        medicoFacade().edit(medico);
        return medico;
    }

}

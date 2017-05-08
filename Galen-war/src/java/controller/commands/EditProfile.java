package controller.commands;

import static controller.EntityFactory.medico;
import static controller.EntityFactory.paciente;
import static controller.FacadeFactory.pacienteFacade;
import static controller.FacadeFactory.medicoFacade;
import entities.Historial;
import entities.Medico;
import entities.Paciente;
import entities.User;

public class EditProfile extends FrontCommand {

    @Override
    public void process() {
        User user = (User) request.getSession().getAttribute("user");
        if (request.getParameter("userType").equals("Medico")){
            final Medico medico = medico(request);
            medico.setHistoriaCollection(((Medico) user).getHistoriaCollection());
            medico.setHorarioCollection(((Medico) user).getHorarioCollection());
            medico.setCitaCollection(((Medico) user).getCitaCollection());
            user = medicoFacade().edit(medico);
        } else if (request.getParameter("userType").equals("Paciente")){
            final Paciente paciente = paciente(request);
            paciente.setHistorial(((Paciente) user).getHistorial());
            paciente.setCitaCollection(((Paciente) user).getCitaCollection());
            user = pacienteFacade().edit(paciente);
        } else {
            forward("/editarPerfil.jsp?success=false");
        }
        request.getSession().setAttribute("user", user);
        forward("/editarPerfil.jsp?success=true");
    }



}

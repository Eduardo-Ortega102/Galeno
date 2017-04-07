package controller.commands;

import static controller.EntityFactory.medico;
import static controller.EntityFactory.paciente;
import static controller.FacadeFactory.pacienteFacade;
import static controller.FacadeFactory.medicoFacade;
import entities.User;

public class EditProfile extends FrontCommand {

    @Override
    public void process() {
        User user = (User) request.getSession().getAttribute("user");
        if (request.getParameter("userType").equals("Medico")) 
            user = medicoFacade().edit(medico(request));
        else if (request.getParameter("userType").equals("Paciente"))
            user = pacienteFacade().edit(paciente(request));
        else 
            forward("/editarPerfil.jsp?success=false");
        request.getSession().setAttribute("user", user);
        forward("/editarPerfil.jsp?success=true");
    }



}

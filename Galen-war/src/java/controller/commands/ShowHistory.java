package controller.commands;

import static controller.FacadeFactory.pacienteFacade;
import entities.Paciente;
import entities.User;

public class ShowHistory extends FrontCommand {

    @Override
    public void process() {
        request.getSession().removeAttribute("historial");
        Paciente paciente = findPaciente();
        if (paciente != null) {
            request.getSession().setAttribute("historial", paciente.getHistorial());
            forward("/verHistorial.jsp");
        } else {
            forward("no se a donde mandarlo");
        }
    }

    private Paciente findPaciente() {
        User user = (User) request.getSession().getAttribute("user");
        if (user instanceof Paciente) return (Paciente) user;
        return pacienteFacade().find(request.getParameter("dniPaciente"));
    }

}

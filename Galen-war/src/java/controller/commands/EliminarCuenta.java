package controller.commands;

import beans.AbstractFacade;
import static controller.FacadeFactory.medicoFacade;
import static controller.FacadeFactory.pacienteFacade;
import javax.servlet.http.HttpSession;

public class EliminarCuenta extends FrontCommand {

    @Override
    public void process() {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        remove(id, type.equals("Medico") ? medicoFacade() : pacienteFacade());
        HttpSession session = request.getSession();
        session.removeAttribute("user"); 
        session.invalidate();
        forward("/index.jsp?successfulDelete=true");
    }

    private void remove(String id, AbstractFacade facade) {
        facade.remove(facade.find(id));
    }
    
}

package controller.commands;

import static controller.FacadeFactory.medicoFacade;

public class SearchDoctor extends FrontCommand {

    @Override
    public void process() {
        setAttribute("listaMedicos", medicoFacade().findAll());
        setAttribute("medicoBuscar",request.getParameter("medicoBuscar"));
        forward("/allMedicos.jsp");
    }

    private void setAttribute(String field, Object value) {
        request.getSession().setAttribute(field, value);
        request.getSession().removeAttribute(field.equals("list") ? "record" : "list");
    }

}

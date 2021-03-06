package controller.commands;

import static controller.FacadeFactory.medicoFacade;

public class SearchDoctor extends FrontCommand {

    @Override
    public void process() {
        String colegiado = request.getParameter("colegiado").trim();
        if (colegiado.isEmpty()) 
            setAttribute("list", medicoFacade().findAll());
        else 
            setAttribute("record", medicoFacade().find(colegiado));
        forward("/resultadoBusqueda.jsp");
    }

    private void setAttribute(String field, Object value) {
        request.getSession().setAttribute(field, value);
        request.getSession().removeAttribute(field.equals("list") ? "record" : "list");
    }

}

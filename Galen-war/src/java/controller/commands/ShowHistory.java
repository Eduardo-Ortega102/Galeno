package controller.commands;

import static controller.FacadeFactory.historialFacade;
import static java.lang.Integer.parseInt;

public class ShowHistory extends FrontCommand {

    @Override
    public void process() {
        if (existHistory(parseInt((String) request.getParameter("historyId"))))
            forward("/historialClinico.jsp");
        else 
            forward("no se a donde mandarlo");
    }

    private boolean existHistory(Integer historyId) {
        Object history = historialFacade().find(historyId);
        request.getSession().setAttribute("history", history);
        return history != null;
    }

}

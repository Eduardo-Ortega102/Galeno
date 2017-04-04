package controller.commands;

import static controller.FacadeFactory.historialFacade;

public class ShowHistory extends FrontCommand {

    @Override
    public void process() {
        historialFacade().findByPatient("42367894P");
    }
    
}

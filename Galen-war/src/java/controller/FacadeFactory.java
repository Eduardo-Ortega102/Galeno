package controller;

import beans.MedicoFacade;
import beans.PacienteFacade;
import controller.commands.Login;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class FacadeFactory {

    private static PacienteFacade pacienteFacade;
    private static MedicoFacade medicoFacade;

    public static PacienteFacade pacienteFacade() {
        if (pacienteFacade != null) return pacienteFacade;
        try {
            pacienteFacade = (PacienteFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/PacienteFacade");
            return pacienteFacade;
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static MedicoFacade medicoFacade() {
        if (medicoFacade != null) return medicoFacade;
        try {
            medicoFacade = (MedicoFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/MedicoFacade");
            return medicoFacade;
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

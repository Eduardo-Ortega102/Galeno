package controller;

import beans.MedicoFacade;
import beans.PacienteFacade;
import controller.commands.Login;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class FacadeFactory {

    public static PacienteFacade createPacienteFacade() {
        try {
            return (PacienteFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/PacienteFacade");
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static MedicoFacade createMedicoFacade() {
        try {
            return (MedicoFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/MedicoFacade");
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}

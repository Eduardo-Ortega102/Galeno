package controller;

import beans.*;
import controller.commands.Login;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class FacadeFactory {

    private static PacienteFacade pacienteFacade;
    private static MedicoFacade medicoFacade;
    private static CitaFacade citaFacade;
    private static HistoriaFacade historiaFacade;
    private static HistorialFacade historialFacade;
    private static HorarioFacade horarioFacade;

    private static AbstractFacade abstractFacade(String facade) {
        try {
            return InitialContext.doLookup("java:global/Galen/Galen-ejb/" + facade);
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static PacienteFacade pacienteFacade() {
        if (pacienteFacade == null) 
            pacienteFacade = (PacienteFacade) abstractFacade("PacienteFacade");
        return pacienteFacade;
    }

    public static MedicoFacade medicoFacade() {
        if (medicoFacade == null) 
            medicoFacade = (MedicoFacade) abstractFacade("MedicoFacade");
        return medicoFacade;
    }

    public static CitaFacade citaFacade() {
        if (citaFacade == null)
            citaFacade = (CitaFacade) abstractFacade("CitaFacade");
        return citaFacade;
    }

    public static HistoriaFacade historiaFacade() {
        if (historiaFacade == null)
            historiaFacade = (HistoriaFacade) abstractFacade("HistoriaFacade");
        return historiaFacade;
    }

    public static HistorialFacade historialFacade() {
        if (historialFacade == null)
            historialFacade = (HistorialFacade) abstractFacade("HistorialFacade");
        return historialFacade;
    }

    public static HorarioFacade horarioFacade() {
        if (horarioFacade == null)
            horarioFacade = (HorarioFacade) abstractFacade("HorarioFacade");
        return horarioFacade;
    }
}

package controller;

import beans.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public final class FacadeFactory {

    private FacadeFactory() {
    }

    public static PacienteFacade pacienteFacade() {
        return create(PacienteFacade.class);
    }

    public static MedicoFacade medicoFacade() {
        return create(MedicoFacade.class);
    }

    public static CitaFacade citaFacade() {
        return create(CitaFacade.class);
    }

    public static HistoriaFacade historiaFacade() {
        return create(HistoriaFacade.class);
    }

    public static HistorialFacade historialFacade() {
        return create(HistorialFacade.class);
    }

    public static HorarioFacade horarioFacade() {
        return create(HorarioFacade.class);
    }
 
    private static <T extends AbstractFacade> T create(Class<T> facade) {
        try {
            return InitialContext.doLookup("java:global/Galen/Galen-ejb/" + facade.getSimpleName());
        } catch (NamingException ex) {
            Logger.getLogger(FacadeFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

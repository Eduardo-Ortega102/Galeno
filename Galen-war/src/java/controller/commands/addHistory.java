package controller.commands;

import static controller.EntityFactory.historia;
import controller.FacadeFactory;
import static controller.FacadeFactory.historiaFacade;
import java.util.Collection;
import entities.Historial;
import entities.Historia;
public class addHistory extends FrontCommand {

    
    @Override
    public void process() {
        Historia nuevaHistoria = historia(request);
        historiaFacade().create(nuevaHistoria);
        Historial historial = (Historial)request.getSession().getAttribute("history");
        Collection<Historia> historiasPaciente = historial.getHistoriaCollection();
        historiasPaciente.add(nuevaHistoria);
        historial.setHistoriaCollection(historiasPaciente);
        FacadeFactory.historialFacade().edit(historial);
        forward("/historialClinico.jsp");
    }
    


}
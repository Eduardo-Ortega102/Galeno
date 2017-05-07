package controller.commands;

import beans.HistoriaFacade;
import static controller.EntityFactory.historia;
import entities.Cita;
import entities.Historia;
import entities.Medico;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
public class addHistory extends FrontCommand {

    @EJB
    HistoriaFacade ejb;
    
    @Override
    public void process() {
        ejb.create(historia(request,ejb.count()));
        forward("/historialClinico.jsp");
    }
    


}
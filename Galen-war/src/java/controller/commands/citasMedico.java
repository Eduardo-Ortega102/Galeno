package controller.commands;

import beans.AbstractFacade;
import beans.CitaFacade;
import static controller.FacadeFactory.citaFacade;
import static controller.FacadeFactory.medicoFacade;
import entities.Cita;
import entities.Medico;
import entities.Paciente;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;

public class citasMedico extends FrontCommand {

    @Override
    public void process() {
        if (! sesionActiva(medicoFacade()))forward("/gestionarAgenda.jps?sesion=2");
        String día=Integer.toString(Calendar.DAY_OF_WEEK);
        ArrayList<Cita> citasDelDia=citasDelDia(citaFacade(), día);
        ArrayList<Paciente> paciente=listaPacientes(null, citasDelDia);
        forward("/gestionarAgenda.jsp");
    }
    
    private boolean sesionActiva (AbstractFacade facade){
        HttpSession session=request.getSession();
        for (Medico medico: (List<Medico>) facade.findAll()) {
            if (medico.getColegiado().equals(session.getId()))return true;
            break;
        }
        return false;
    }
    
    private ArrayList<Cita> citasDelDia(CitaFacade facade, String dia) {
        ArrayList<Cita> citasMedico=new ArrayList<>();
        for(int i=0;i<facade.findAll().size();i++) {
            if(facade.findAll().get(i).getFecha().equals(dia)) citasMedico.add(facade.findAll().get(i));
        }
        return citasMedico;
    }
    
    private ArrayList<Paciente> listaPacientes(Medico medico, ArrayList<Cita> citaDelDia) {
        ArrayList<Paciente> listaPacientes=new ArrayList<>();
        for(int i=0; i<citaDelDia.size();i++){
            if(medico.getCitaCollection().contains(citaDelDia.get(i).getPaciente()))
                listaPacientes.add(citaDelDia.get(i).getPaciente());
        }
        return listaPacientes;
    }
}
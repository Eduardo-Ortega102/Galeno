package controller.commands;

import beans.AbstractFacade;
import entities.Cita;
import entities.Medico;
import entities.Paciente;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

public class citasMedico extends FrontCommand {

    @Override
    public void process() {
        //if (!sesionActiva(medicoFacade()))forward("/gestionarAgenda.jps?sesion=2");
        Medico medico = (Medico) request.getSession().getAttribute("user");
        String día=LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        ArrayList<Cita> citasDelDia=citasDelDia(medico, día);
        request.getSession().setAttribute("agenda", citasDelDia);
        //ArrayList<Paciente> paciente=listaPacientes(this.medico, citasDelDia);
        forward("/gestionarAgenda.jsp");
    }
    
    private boolean sesionActiva (AbstractFacade facade){
        HttpSession session=request.getSession();
        for (Medico medico: (List<Medico>) facade.findAll()) {
            if (medico.getColegiado().equals(session.getId())) {
                return true;
            }
        }
        return false;
    }
    
    private ArrayList<Cita> citasDelDia(Medico medico, String fecha) {
        ArrayList<Cita> citasMedico=new ArrayList<>();
        for (Cita cita : medico.getCitaCollection()) {
            if (cita.getFecha().equals(fecha))citasMedico.add(cita);
        }
        return citasMedico;
    }
    
    private ArrayList<Paciente> listaPacientes(Medico medico, ArrayList<Cita> citaDelDia) {
        ArrayList<Paciente> listaPacientes=new ArrayList<>();
        int i=0;
        for (Cita listaPaciente : medico.getCitaCollection()) {
            if(listaPaciente.getFecha().equals(citaDelDia.get(i).getFecha()))
                listaPacientes.add(citaDelDia.get(i).getPaciente());
            i++;
        }
        return listaPacientes;
    }
}
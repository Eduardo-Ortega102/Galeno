package controller.commands;

import entities.Cita;
import entities.Medico;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;

public class citasMedico extends FrontCommand {

    @Override
    public void process() {
        Medico medico = (Medico) request.getSession().getAttribute("user");
        String fecha=LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        ArrayList<Cita> citasDelDia=citasDelDia(medico, fecha);
        request.getSession().setAttribute("agenda", citasDelDia);
        forward("/gestionarAgenda.jsp");
    }
    
    private ArrayList<Cita> citasDelDia(Medico medico, String fecha) {
        ArrayList<Cita> citasMedico=new ArrayList<>();
        for (Cita cita : medico.getCitaCollection()) {
            if (cita.getFecha().equals(fecha))citasMedico.add(cita);
        }
        citasMedico.sort(new Comparator<Cita>() {
            @Override
            public int compare(Cita cita1, Cita cita2) {
                return cita1.getHora().compareTo(cita2)
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }
        });
        return citasMedico;
    }
}
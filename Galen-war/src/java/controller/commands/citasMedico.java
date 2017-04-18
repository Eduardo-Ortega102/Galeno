package controller.commands;

import entities.Cita;
import entities.Medico;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

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
        return citasMedico;
    }
}
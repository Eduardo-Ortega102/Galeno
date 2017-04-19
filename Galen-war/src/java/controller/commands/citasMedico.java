package controller.commands;

import entities.Cita;
import entities.Medico;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class citasMedico extends FrontCommand {

    @Override
    public void process() {
        Medico medico = (Medico) request.getSession().getAttribute("user");
        String fecha=LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        List<Cita> citasDelDia=citasDelDia(medico, fecha);
        request.getSession().setAttribute("agenda", citasDelDia);
        forward("/gestionarAgenda.jsp");
    }
    
    private List<Cita> citasDelDia(Medico medico, String fecha) {
        List<Cita> citasMedico=new ArrayList<>();
        for (Cita cita : medico.getCitaCollection()) {
            if (cita.getFecha().equals(fecha))citasMedico.add(cita);
        }
        Collections.sort(citasMedico);
        return citasMedico;
    }
}
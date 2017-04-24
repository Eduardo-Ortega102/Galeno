package controller.commands;

import static controller.FacadeFactory.horarioFacade;
import entities.Horario;
import entities.Medico;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.Collection;

public class EditSchedule extends FrontCommand {

    @Override
    public void process() {
        Medico medico = (Medico) request.getSession().getAttribute("user");
        int id;
        Collection<Horario> horarios = new ArrayList<>();
        for (String day : new String[]{"Lunes", "Martes", "Miercoles", "Jueves", "Viernes"}) {
            id = parseInt(request.getParameter("id" + day));
            if (id < 0) {
                Horario horario = create(day, medico);
                if (horario != null) horarios.add(horario);
            } else {
                horarios.add(edit(id, day));
            }
        }
        medico.setHorarioCollection(horarios);
        forward("/gestionarHorario.jsp?success=true");
    }

    private Horario create(String day, Medico medico) {
        String inicio = request.getParameter("inicio" + day);
        String fin = request.getParameter("fin" + day);
        if (inicio == null || inicio.isEmpty() || fin == null || fin.isEmpty()) return null;
        Horario horario = new Horario(horarioFacade().count(), day, inicio, fin);
        horario.setMedico(medico);
        horarioFacade().create(horario);
        return horario;
    }

    private Horario edit(int id, String day) {
        Horario horario = horarioFacade().find(id);
        horario.setHorainicio(request.getParameter("inicio" + day));
        horario.setHorafin(request.getParameter("fin" + day));
        return horarioFacade().edit(horario);
    }

}

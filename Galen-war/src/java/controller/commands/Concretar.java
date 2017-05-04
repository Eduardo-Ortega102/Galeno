package controller.commands;

import static controller.EntityFactory.cita;
import controller.FacadeFactory;
import static controller.FacadeFactory.citaFacade;
import entities.Cita;
import entities.Medico;
import entities.Paciente;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Concretar extends FrontCommand {

    @Override
    public void process() {
        Paciente paciente = (Paciente) request.getSession().getAttribute("user");
        List<Cita> citas = citaFacade().findAll();
        Collections.sort(citas, new Comparator<Cita>() {
            @Override
            public int compare(Cita o1, Cita o2) {
                return Integer.compare(o1.getId(), o2.getId());
            }
        });
        final Cita cita = cita(request, paciente, citas.get(citas.size() - 1).getId()+1);
        citaFacade().create(cita);

        Medico medico = FacadeFactory.medicoFacade().find(cita.getMedico().getColegiado());
        Collection<Cita> citasPaciente = paciente.getCitaCollection();
        Collection<Cita> citasMedico = medico.getCitaCollection();

        citasPaciente.add(cita);
        citasMedico.add(cita);

        paciente.setCitaCollection(citasPaciente);
        medico.setCitaCollection(citasMedico);

        FacadeFactory.medicoFacade().edit(medico);
        FacadeFactory.pacienteFacade().edit(paciente);

        forward("/verCitaPaciente.jsp");
    }

}

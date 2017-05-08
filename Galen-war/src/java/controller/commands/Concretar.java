package controller.commands;

import static controller.EntityFactory.cita;
import controller.FacadeFactory;
import static controller.FacadeFactory.citaFacade;
import entities.Cita;
import entities.Medico;
import entities.Paciente;
import java.util.Collection;

public class Concretar extends FrontCommand {

    @Override
    public void process() {
        Paciente paciente = (Paciente) request.getSession().getAttribute("user");
        Cita cita = cita(request, paciente);
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

        forward("/indexPaciente.jsp");
    }

}

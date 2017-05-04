package controller.commands;

import controller.FacadeFactory;
import entities.Cita;
import entities.Medico;
import entities.Paciente;
import java.util.Collection;


public class Eliminar extends FrontCommand{

    @Override
    public void process() {
        Cita cita = FacadeFactory.citaFacade().find(Integer.parseInt(request.getParameter("id")));
        Paciente paciente = FacadeFactory.pacienteFacade().find(cita.getPaciente().getDni());
        Medico medico = FacadeFactory.medicoFacade().find(cita.getMedico().getColegiado());
        Collection<Cita> citasPaciente = paciente.getCitaCollection();
        Collection<Cita> citasMedico = medico.getCitaCollection();
        
        citasPaciente.remove(cita);
        citasMedico.remove(cita);
        paciente.setCitaCollection(citasPaciente);
        medico.setCitaCollection(citasMedico);
        
        FacadeFactory.medicoFacade().edit(medico);
        FacadeFactory.pacienteFacade().edit(paciente);
        FacadeFactory.citaFacade().remove(cita);
        forward("/verCitaPaciente.jsp");
    }
    
}

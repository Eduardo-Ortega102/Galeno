
package controller.commands;

import entities.Cita;
import entities.Medico;
import entities.Paciente;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


public class pacientesMedico extends FrontCommand{

    @Override
    public void process() {
        Medico medico = (Medico) request.getSession().getAttribute("user");
        List<Paciente> misPacientes = myPatients(medico);
        request.getSession().setAttribute("pacientesMedico", misPacientes);
        forward("/misPacientes.jsp");
    }

    private List<Paciente> myPatients(Medico medico) {
        Collection<Cita> citas = medico.getCitaCollection();
        List<Paciente> misPacientes = new ArrayList<>();
        for (Cita citaPaciente: citas) {
            if(!misPacientes.contains(citaPaciente.getPaciente())) {
                misPacientes.add(citaPaciente.getPaciente());
            }
        }
        return misPacientes;
    }
    
    
}

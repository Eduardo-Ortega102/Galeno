
package controller.commands;

import entities.Cita;
import entities.Medico;
import entities.Paciente;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


public class medicosPaciente extends FrontCommand{

    @Override
    public void process() {
        Paciente paciente = (Paciente) request.getSession().getAttribute("user");
        List<Medico> misMedicos = myDoctors(paciente);
        request.getSession().setAttribute("pacientesMedico", misMedicos);
        forward("/misMedicos.jsp");
    }

    private List<Medico> myDoctors(Paciente paciente) {
        Collection<Cita> citas = paciente.getCitaCollection();
        List<Medico> misMedicos = new ArrayList<>();
        for (Cita citaPaciente: citas) {
            if(!misMedicos.contains(citaPaciente.getMedico())) {
                misMedicos.add(citaPaciente.getMedico());
            }
        }
        return misMedicos;
    }
    
    
}
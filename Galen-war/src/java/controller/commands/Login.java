package controller.commands;

import beans.AbstractFacade;
import beans.MedicoFacade;
import beans.PacienteFacade;
import entities.Medico;
import entities.Paciente;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

public class Login extends FrontCommand {

    @Override
    public void process() {
        if (existUser(createPatientFacade()) || existUser(createDoctorFacade())) 
            forward("/profile.jsp");
        else 
            forward("/index.jsp?error=1");
    }
    
    private PacienteFacade createPatientFacade() {
        try {
            return (PacienteFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/PacienteFacade");
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    private MedicoFacade createDoctorFacade() {
        try {
            return (MedicoFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/MedicoFacade");
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    private boolean existUser(AbstractFacade facade) {
        Object user = findUser(facade, request.getParameter("email"), request.getParameter("password"));
        if (user == null) return false;
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        return true;
    }

    private Object findUser(AbstractFacade facade, String email, String password) {
        return (facade instanceof PacienteFacade) ? 
                findPatient((PacienteFacade) facade, email, password) : 
                findDoctor((MedicoFacade) facade, email, password);
    }
    
    private Paciente findPatient(PacienteFacade facade, String email, String password) {
        for (Paciente paciente : facade.findAll()) 
            if (paciente.getEmail().equals(email)){
                if (paciente.getPassword().equals(password)) return paciente;
                break;
            }
        return null;
    }
    
    private Medico findDoctor(MedicoFacade facade, String email, String password) {
        for (Medico medico : facade.findAll()) 
            if (medico.getEmail().equals(email)) {
                if (medico.getPassword().equals(password)) return medico;
                break;
            }
        return null;
    }
 
}

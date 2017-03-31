package controller.commands;

import beans.AbstractFacade;
import beans.MedicoFacade;
import beans.PacienteFacade;
import entities.User;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

public class Login extends FrontCommand {

    @Override
    public void process() {
        if (existUser(createPacienteFacade())) 
            forward("/profile.jsp");
        else if(existUser(createMedicoFacade()))
            forward("/indexMedico.jsp");
        else 
            forward("/index.jsp?error=1");
    }
    
    private PacienteFacade createPacienteFacade() {
        try {
            return (PacienteFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/PacienteFacade");
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    private MedicoFacade createMedicoFacade() {
        try {
            return (MedicoFacade) InitialContext.doLookup("java:global/Galen/Galen-ejb/MedicoFacade");
        } catch (NamingException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    private boolean existUser(AbstractFacade facade) {
        User user = findUser(facade, request.getParameter("email"), request.getParameter("password"));
        if (user == null) return false;
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        return true;
    }

    private User findUser(AbstractFacade facade, String email, String password) {
        for (User user : (List<User>) facade.findAll())
            if (user.getEmail().equals(email)){
                if (user.getPassword().equals(password)) return user;
                break;
            }
        return null;
    }
}

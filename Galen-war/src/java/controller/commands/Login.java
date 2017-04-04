package controller.commands;

import entities.User;
import javax.servlet.http.HttpSession;
import static controller.FacadeFactory.*;

public class Login extends FrontCommand {

    @Override
    public void process() {
        if (existUser("paciente"))  forward("/profile.jsp");
        else if(existUser("medico"))forward("/indexMedico.jsp");
        else 
            forward("/index.jsp?error=1");
    }
    
    private boolean existUser(String type) {
        User user = findUser(type, request.getParameter("email"), request.getParameter("password"));
        if (user == null) return false;
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        return true;
    }

    private User findUser(String type, String email, String password) {
        User user = null;
        if (type.equals("paciente"))    user = pacienteFacade().findByEmail(email);
        else if (type.equals("medico")) user = medicoFacade().findByEmail(email);
        if (user == null) return null;
        return user.getPassword().equals(password) ? user : null;
    }
}

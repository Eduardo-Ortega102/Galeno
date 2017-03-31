package controller.commands;

import beans.AbstractFacade;
import entities.User;
import java.util.List;
import javax.servlet.http.HttpSession;
import static controller.FacadeFactory.*;

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

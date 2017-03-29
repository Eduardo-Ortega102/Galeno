package controller.commands;

import javax.servlet.http.HttpSession;

public class Logout extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession();
        session.removeAttribute("user"); 
        session.invalidate();
        forward("/index.jsp");
    }
    
}

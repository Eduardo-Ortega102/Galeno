package controller.commands;

import javax.servlet.http.HttpSession;

public class Logout extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession();
        session.removeAttribute("user"); // Quizá esta instrucción no sea necesaria
        session.invalidate();
        forward("/index.jsp");
    }
    
}

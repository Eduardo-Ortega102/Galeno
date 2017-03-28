package controller;

import controller.commands.FrontCommand;
import controller.commands.UnknownCommand;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String path = "controller.commands." + (String) request.getParameter("command");
        FrontCommand command;
        try {
            command = getClass(path);
            command.init(request.getServletContext(), request, response);
            command.process();
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(FrontController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private FrontCommand getClass(String path) throws InstantiationException, IllegalAccessException {
        FrontCommand command;
        try {
            command = (FrontCommand) Class.forName(path).newInstance();
        } catch (ClassNotFoundException ex) {
            command = new UnknownCommand();
        }
        return command;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
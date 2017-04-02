package controller.commands;

public class UnknownCommand extends FrontCommand {

    @Override
    public void process() {
        forward("/WEB-INF/UnknowCommand.jsp");
    }
    
}
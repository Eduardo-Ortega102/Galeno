package controller.commands;

public class UnknownCommand extends FrontCommand {

    @Override
    public void process() {
        forward("/UnknowCommand.jsp");
    }
    
}
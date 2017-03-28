
package controller.commands;

public class Register extends FrontCommand{

    @Override
    public void process() {
        forward("/register.jsp");
    }
    
}

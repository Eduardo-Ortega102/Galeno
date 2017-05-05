package beans;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Schedule;
import javax.ejb.Singleton;

@Singleton
public class UserCounter {
    @EJB
    private MedicoFacade medicoFacade;
    @EJB
    private PacienteFacade pacienteFacade;
    private int amountOfDoctors;
    private int amountOfPatients;

    @PostConstruct
    public void init(){
        amountOfDoctors = medicoFacade.count();
        amountOfPatients = pacienteFacade.count();
    }
    
    @Schedule(hour = "*", minute = "*", second = "*/5")
    public void execute() {
        amountOfDoctors = medicoFacade.count();
        amountOfPatients = pacienteFacade.count();
    }

    public int getAmountOfDoctors() {
        return amountOfDoctors;
    }

    public int getAmountOfPatients() {
        return amountOfPatients;
    }
    
}

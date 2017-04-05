package beans;

import entities.Horario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class HorarioFacade extends AbstractFacade<Horario> {

    @PersistenceContext(unitName = "Galen-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HorarioFacade() {
        super(Horario.class);
    }
    
}

package beans;

import entities.Historia;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class HistoriaFacade extends AbstractFacade<Historia> {

    @PersistenceContext(unitName = "Galen-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HistoriaFacade() {
        super(Historia.class);
    }
    
}

package beans;

import entities.Medico;
import entities.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicoFacade extends AbstractFacade<Medico> {

    @PersistenceContext(unitName = "Galen-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MedicoFacade() {
        super(Medico.class);
    }
    
    public User findByEmail(String email) {
        try {
            return em.createNamedQuery("Medico.findByEmail", Medico.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {}
        return null;
    }    
}

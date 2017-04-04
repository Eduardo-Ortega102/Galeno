package beans;

import entities.Paciente;
import entities.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

@Stateless
public class PacienteFacade extends AbstractFacade<Paciente> {

    @PersistenceContext(unitName = "Galen-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PacienteFacade() {
        super(Paciente.class);
    }

    public User findByEmail(String email) {
        try {
            return em.createNamedQuery("Paciente.findByEmail", Paciente.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {}
        return null;
    }
}

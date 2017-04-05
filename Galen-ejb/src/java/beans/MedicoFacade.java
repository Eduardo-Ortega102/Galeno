package beans;

import entities.Medico;
import entities.User;
import java.util.List;
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

    public List<Medico> findByLocalizacion(String localizacion) {
        return list("findByLocalizacion", "localizacion", localizacion);
    }

    public List<Medico> findByNombre(String nombre) {
        return list("findByNombre", "nombre", nombre);
    }

    private List<Medico> list(String query, String parameterName, String parameterValue) {
        return em.createNamedQuery("Medico." + query, Medico.class)
                .setParameter(parameterName, parameterValue)
                .getResultList();
    }

}

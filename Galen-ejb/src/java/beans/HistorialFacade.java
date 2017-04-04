package beans;

import entities.Historial;
import entities.Paciente;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class HistorialFacade extends AbstractFacade<Historial> {

    @PersistenceContext(unitName = "Galen-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HistorialFacade() {
        super(Historial.class);
    }
    
    public Historial findByPatient(String dni){
        return  em.createNamedQuery("Historial.findByPaciente", Historial.class)
                .setParameter("paciente", new Paciente(dni))
                .getSingleResult();
    }
}

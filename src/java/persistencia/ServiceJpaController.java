package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Service;
import persistencia.exceptions.NonexistentEntityException;


public class ServiceJpaController implements Serializable {

    public ServiceJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public ServiceJpaController() {       
        emf = Persistence.createEntityManagerFactory("TpFinalPU");
    }
    
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Service service) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(service);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Service service) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            service = em.merge(service);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = service.getService_code();
                if (findService(id) == null) {
                    throw new NonexistentEntityException("The service with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Service service;
            try {
                service = em.getReference(Service.class, id);
                service.getService_code();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The service with id " + id + " no longer exists.", enfe);
            }
            em.remove(service);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Service> findServiceEntities() {
        return findServiceEntities(true, -1, -1);
    }

    public List<Service> findServiceEntities(int maxResults, int firstResult) {
        return findServiceEntities(false, maxResults, firstResult);
    }

    private List<Service> findServiceEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Service.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Service findService(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Service.class, id);
        } finally {
            em.close();
        }
    }

    public int getServiceCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Service> rt = cq.from(Service.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}

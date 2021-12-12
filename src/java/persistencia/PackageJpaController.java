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
import logica.Package;
import persistencia.exceptions.NonexistentEntityException;


public class PackageJpaController implements Serializable {

    public PackageJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
        
    public PackageJpaController(){
        emf = Persistence.createEntityManagerFactory("TpFinalPU");    
    }
    
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Package package1) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(package1);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Package package1) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            package1 = em.merge(package1);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = package1.getPackage_code();
                if (findPackage(id) == null) {
                    throw new NonexistentEntityException("The package with id " + id + " no longer exists.");
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
            Package package1;
            try {
                package1 = em.getReference(Package.class, id);
                package1.getPackage_code();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The package1 with id " + id + " no longer exists.", enfe);
            }
            em.remove(package1);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Package> findPackageEntities() {
        return findPackageEntities(true, -1, -1);
    }

    public List<Package> findPackageEntities(int maxResults, int firstResult) {
        return findPackageEntities(false, maxResults, firstResult);
    }

    private List<Package> findPackageEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Package.class));
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

    public Package findPackage(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Package.class, id);
        } finally {
            em.close();
        }
    }

    public int getPackageCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Package> rt = cq.from(Package.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}

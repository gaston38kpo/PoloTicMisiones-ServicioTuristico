package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Package;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Service;
import persistencia.exceptions.NonexistentEntityException;


public class ServiceJpaController implements Serializable {

    public ServiceJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public ServiceJpaController(){
        emf = Persistence.createEntityManagerFactory("TpFinalPU");    
    }
    
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Service service) {
        if (service.getList_of_packages() == null) {
            service.setList_of_packages(new ArrayList<Package>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Package> attachedList_of_packages = new ArrayList<Package>();
            for (Package list_of_packagesPackageToAttach : service.getList_of_packages()) {
                list_of_packagesPackageToAttach = em.getReference(list_of_packagesPackageToAttach.getClass(), list_of_packagesPackageToAttach.getPackage_code());
                attachedList_of_packages.add(list_of_packagesPackageToAttach);
            }
            service.setList_of_packages(attachedList_of_packages);
            em.persist(service);
            for (Package list_of_packagesPackage : service.getList_of_packages()) {
                list_of_packagesPackage.getList_of_services().add(service);
                list_of_packagesPackage = em.merge(list_of_packagesPackage);
            }
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
            Service persistentService = em.find(Service.class, service.getService_code());
            List<Package> list_of_packagesOld = persistentService.getList_of_packages();
            List<Package> list_of_packagesNew = service.getList_of_packages();
            List<Package> attachedList_of_packagesNew = new ArrayList<Package>();
            for (Package list_of_packagesNewPackageToAttach : list_of_packagesNew) {
                list_of_packagesNewPackageToAttach = em.getReference(list_of_packagesNewPackageToAttach.getClass(), list_of_packagesNewPackageToAttach.getPackage_code());
                attachedList_of_packagesNew.add(list_of_packagesNewPackageToAttach);
            }
            list_of_packagesNew = attachedList_of_packagesNew;
            service.setList_of_packages(list_of_packagesNew);
            service = em.merge(service);
            for (Package list_of_packagesOldPackage : list_of_packagesOld) {
                if (!list_of_packagesNew.contains(list_of_packagesOldPackage)) {
                    list_of_packagesOldPackage.getList_of_services().remove(service);
                    list_of_packagesOldPackage = em.merge(list_of_packagesOldPackage);
                }
            }
            for (Package list_of_packagesNewPackage : list_of_packagesNew) {
                if (!list_of_packagesOld.contains(list_of_packagesNewPackage)) {
                    list_of_packagesNewPackage.getList_of_services().add(service);
                    list_of_packagesNewPackage = em.merge(list_of_packagesNewPackage);
                }
            }
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
            List<Package> list_of_packages = service.getList_of_packages();
            for (Package list_of_packagesPackage : list_of_packages) {
                list_of_packagesPackage.getList_of_services().remove(service);
                list_of_packagesPackage = em.merge(list_of_packagesPackage);
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

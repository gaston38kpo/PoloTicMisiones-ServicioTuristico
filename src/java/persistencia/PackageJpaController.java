package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Service;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
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
        if (package1.getList_of_services() == null) {
            package1.setList_of_services(new ArrayList<Service>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Service> attachedList_of_services = new ArrayList<Service>();
            for (Service list_of_servicesServiceToAttach : package1.getList_of_services()) {
                list_of_servicesServiceToAttach = em.getReference(list_of_servicesServiceToAttach.getClass(), list_of_servicesServiceToAttach.getService_code());
                attachedList_of_services.add(list_of_servicesServiceToAttach);
            }
            package1.setList_of_services(attachedList_of_services);
            em.persist(package1);
            for (Service list_of_servicesService : package1.getList_of_services()) {
                list_of_servicesService.getList_of_packages().add(package1);
                list_of_servicesService = em.merge(list_of_servicesService);
            }
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
            Package persistentPackage = em.find(Package.class, package1.getPackage_code());
            List<Service> list_of_servicesOld = persistentPackage.getList_of_services();
            List<Service> list_of_servicesNew = package1.getList_of_services();
            List<Service> attachedList_of_servicesNew = new ArrayList<Service>();
            for (Service list_of_servicesNewServiceToAttach : list_of_servicesNew) {
                list_of_servicesNewServiceToAttach = em.getReference(list_of_servicesNewServiceToAttach.getClass(), list_of_servicesNewServiceToAttach.getService_code());
                attachedList_of_servicesNew.add(list_of_servicesNewServiceToAttach);
            }
            list_of_servicesNew = attachedList_of_servicesNew;
            package1.setList_of_services(list_of_servicesNew);
            package1 = em.merge(package1);
            for (Service list_of_servicesOldService : list_of_servicesOld) {
                if (!list_of_servicesNew.contains(list_of_servicesOldService)) {
                    list_of_servicesOldService.getList_of_packages().remove(package1);
                    list_of_servicesOldService = em.merge(list_of_servicesOldService);
                }
            }
            for (Service list_of_servicesNewService : list_of_servicesNew) {
                if (!list_of_servicesOld.contains(list_of_servicesNewService)) {
                    list_of_servicesNewService.getList_of_packages().add(package1);
                    list_of_servicesNewService = em.merge(list_of_servicesNewService);
                }
            }
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
            List<Service> list_of_services = package1.getList_of_services();
            for (Service list_of_servicesService : list_of_services) {
                list_of_servicesService.getList_of_packages().remove(package1);
                list_of_servicesService = em.merge(list_of_servicesService);
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

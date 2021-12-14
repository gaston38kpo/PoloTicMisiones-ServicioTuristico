package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Client;
import logica.Employee;
import logica.Package;
import logica.Sale;
import logica.Service;
import logica.User;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
////////////////////////////////////////////////////////////////////////////////
//                    J P A - C O N T R O L L E R S                           //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="JPA Controllers">    

    UserJpaController userJPA = new UserJpaController();
    EmployeeJpaController employeeJPA = new EmployeeJpaController();
    ClientJpaController clientJPA = new ClientJpaController();
    ServiceJpaController serviceJPA = new ServiceJpaController();
    PackageJpaController packageJPA = new PackageJpaController();
    SaleJpaController saleJPA = new SaleJpaController();
//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                               U S E R                                      //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD USER">     
////////////////////////////// Create Zone /////////////////////////////////////    
    public void createUser(User user) {
        userJPA.create(user);
    }

/////////////////////////////// Read Zone //////////////////////////////////////    
    public List<User> getAllUsers() {
        return userJPA.findUserEntities();
    }

    public User searchUser(int id) {
        return userJPA.findUser(id);
    }

////////////////////////////// Update Zone /////////////////////////////////////
    public void updateUser(User user) {
        try {
            userJPA.edit(user);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }

////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteUser(int id) {
        try {
            userJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(
                    ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }//</editor-fold>    

////////////////////////////////////////////////////////////////////////////////
//                           E M P L O Y E E                                  //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD EMPLOYEE">
////////////////////////////// Create Zone /////////////////////////////////////    
    public void createEmployee(Employee employee, User user) {
        userJPA.create(user);
        employeeJPA.create(employee);
    }

/////////////////////////////// Read Zone //////////////////////////////////////    
    public List<Employee> getAllEmployees() {
        return employeeJPA.findEmployeeEntities();
    }

    public Employee searchEmployee(int id) {
        return employeeJPA.findEmployee(id);
    }

////////////////////////////// Update Zone /////////////////////////////////////    
    public void updateEmployee(Employee employee) {
        try {
            employeeJPA.edit(employee);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }

////////////////////////////// Delete Zone /////////////////////////////////////    
    public void deleteEmployee(int id) {
        try {
            employeeJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                             C L I E N T                                    //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD CLIENT">     
////////////////////////////// Create Zone /////////////////////////////////////    
    public void createClient(Client client) {
        clientJPA.create(client);
    }

/////////////////////////////// Read Zone //////////////////////////////////////    
    public List<Client> getAllClients() {
        return clientJPA.findClientEntities();
    }

    public Client searchClient(int id) {
        return clientJPA.findClient(id);
    }

////////////////////////////// Update Zone /////////////////////////////////////    
    public void updateClient(Client client) {
        try {
            clientJPA.edit(client);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }

////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteClient(int id) {
        try {
            clientJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                            S E R V I C E                                   //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD SERVICE">     
////////////////////////////// Create Zone /////////////////////////////////////
    public void createService(Service service) {
        serviceJPA.create(service);
    }

/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Service> getAllServices() {
        return serviceJPA.findServiceEntities();
    }

    public Service searchService(int service_code) {
        return serviceJPA.findService(service_code);
    }

////////////////////////////// Update Zone /////////////////////////////////////
    public void updateService(Service service) {
        try {
            serviceJPA.edit(service);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }

////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteService(int service_code) {
        try {
            serviceJPA.destroy(service_code);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                            P A C K A G E                                   //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD PACKAGE">
////////////////////////////// Create Zone /////////////////////////////////////
    public void createPackage(Package pkg) {
        packageJPA.create(pkg);
    }

/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Package> getAllPackages() {
        return packageJPA.findPackageEntities();
    }

    public Package searchPackage(int package_code) {
        return packageJPA.findPackage(package_code);
    }

////////////////////////////// Update Zone /////////////////////////////////////
    public void updatePackage(Package pkg) {
        try {
            packageJPA.edit(pkg);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }

////////////////////////////// Delete Zone /////////////////////////////////////
    public void deletePackage(int package_code) {
        try {
            packageJPA.destroy(package_code);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                               S A L E                                      //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD SALE">    
////////////////////////////// Create Zone /////////////////////////////////////
    public void createSale(Sale sale) {
        saleJPA.create(sale);
    }

/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Sale> getAllSales() {
        return saleJPA.findSaleEntities();
    }

    public Sale searchSale(int sale_number) {
        return saleJPA.findSale(sale_number);
    }
////////////////////////////// Update Zone /////////////////////////////////////

    public void updateSale(Sale sale) {
        try {
            saleJPA.edit(sale);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }

////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteSale(int sale_number) {
        try {
            saleJPA.destroy(sale_number);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
    }//</editor-fold>

}

package logica;

import java.sql.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;


public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

////////////////////////////////////////////////////////////////////////////////
//                               U S E R                                      //
////////////////////////////////////////////////////////////////////////////////
     
////////////////////////////// Create Zone /////////////////////////////////////
    public void createUser(String username, String password) {
        
        User user = new User();
        
        user.setUsername(username);
        user.setPassword(password);
        
        controlPersis.createUser(user);
    }
    
/////////////////////////////// Read Zone //////////////////////////////////////
    public List<User> getAllUsers () {
        return controlPersis.getAllUsers();
    }

    public boolean verifyUser(String username, String password) {
        
        List<User> userList = getAllUsers();
        
        if (userList != null) {
            for (User user : userList) {
                if (user.getUsername().equals(username) &&
                        user.getPassword().equals(password)) {
                    return true;
                }
            }        
        }
        return false;        
    }
    
    public User searchUser(int id) {
        return controlPersis.searchUser(id);
    }    
    
////////////////////////////// Update Zone /////////////////////////////////////
    public void updateUser(User user) {
        controlPersis.updateUser(user);
    }    
    
////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteUser(int id) {
        controlPersis.deleteUser(id);
    }


    
////////////////////////////////////////////////////////////////////////////////
//                           E M P L O Y E E                                  //
////////////////////////////////////////////////////////////////////////////////
    
////////////////////////////// Create Zone /////////////////////////////////////
    public void createEmployee(String first_name, String last_name,
            String street, String dni, Date birthdate, String nationality,
            String cellphone, String email, String position, double salary,
            String username, String password) {
        
        Employee employee = new Employee();
        User user = new User();
        
        employee.setFirst_name(first_name);
        employee.setLast_name(last_name);
        employee.setStreet(street);
        employee.setDni(dni);
        employee.setBirthdate(birthdate);
        employee.setNationality(nationality);
        employee.setCellphone(cellphone);
        employee.setEmail(email);
        employee.setPosition(position);
        employee.setSalary(salary);
        
        user.setUsername(username);
        user.setPassword(password);
        
        employee.setUser_fk(user);
        
        controlPersis.createEmployee(employee, user);
        
    }
    
/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Employee> getAllEmployees () {
        return controlPersis.getAllEmployees();
    }
    
    public Employee searchEmployee(int id) {
        return controlPersis.searchEmployee(id);
    }
    
////////////////////////////// Update Zone /////////////////////////////////////
    public void updateEmployee(Employee employee) {
        controlPersis.updateEmployee(employee);
    }
     
////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteEmployee(int id) {
        controlPersis.deleteEmployee(id);
    }
    
////////////////////////////////////////////////////////////////////////////////
//                             C L I E N T                                    //
////////////////////////////////////////////////////////////////////////////////
     
////////////////////////////// Create Zone /////////////////////////////////////
    public void createClient(String first_name, String last_name, String street,
            String dni, Date birthdate, String nationality, String cellphone,
            String email) {
        
        Client client = new Client();
        
        client.setFirst_name(first_name);
        client.setLast_name(last_name);
        client.setStreet(street);
        client.setDni(dni);
        client.setBirthdate(birthdate);
        client.setNationality(nationality);
        client.setCellphone(cellphone);
        client.setEmail(email);        
                
        controlPersis.createClient(client);
        
    }
    
/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Client> getAllClients () {
        return controlPersis.getAllClients();
    }
    
    public Client searchClient(int id) {
        return controlPersis.searchClient(id);
    }
  
////////////////////////////// Update Zone /////////////////////////////////////
    public void updateClient(Client client) {
        controlPersis.updateClient(client);
    }
    
////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteClient(int id) {
        controlPersis.deleteClient(id);
    }
    
////////////////////////////////////////////////////////////////////////////////
//                            S E R V I C E                                   //
////////////////////////////////////////////////////////////////////////////////
     
////////////////////////////// Create Zone /////////////////////////////////////
    public void createService(String name, String description,
            String destination, double cost_service, Date date_service) {
        
        Service service = new Service();
        
        service.setName(name);
        service.setDescription(description);
        service.setDestination(destination);
        service.setCost_service(cost_service);
        service.setDate_service(date_service);
                
        controlPersis.createService(service);
        
    }
    
/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Service> getAllServices () {
        return controlPersis.getAllServices();
    }
    
    public Service searchService(int service_code) {
        return controlPersis.searchService(service_code);
    }
    
////////////////////////////// Update Zone /////////////////////////////////////
    public void updateService(Service service) {
        controlPersis.updateService(service);
    }
    
////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteService(int service_code) {
        controlPersis.deleteService(service_code);
    }
    
////////////////////////////////////////////////////////////////////////////////
//                            P A C K A G E                                   //
////////////////////////////////////////////////////////////////////////////////
     
////////////////////////////// Create Zone /////////////////////////////////////
    
    
/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Package> getAllPackages () {
        return controlPersis.getAllPackages();
    }    
    
////////////////////////////// Update Zone /////////////////////////////////////
    
    
////////////////////////////// Delete Zone /////////////////////////////////////
    
////////////////////////////////////////////////////////////////////////////////
//                               S A L E                                      //
////////////////////////////////////////////////////////////////////////////////
     
////////////////////////////// Create Zone /////////////////////////////////////
    
    
/////////////////////////////// Read Zone //////////////////////////////////////
    
    
////////////////////////////// Update Zone /////////////////////////////////////
    
    
////////////////////////////// Delete Zone /////////////////////////////////////

        



    
        
}

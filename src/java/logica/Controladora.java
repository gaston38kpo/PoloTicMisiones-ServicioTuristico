package logica;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

////////////////////////////////////////////////////////////////////////////////
//                               U S E R                                      //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD USER">    
////////////////////////////// Create Zone /////////////////////////////////////
    public void createUser(String username, String password) {

        User user = new User();

        user.setUsername(username);
        user.setPassword(password);

        controlPersis.createUser(user);
    }

/////////////////////////////// Read Zone //////////////////////////////////////
    public List<User> getAllUsers() {
        return controlPersis.getAllUsers();
    }

    public boolean verifyUser(String username, String password) {

        List<User> userList = getAllUsers();

        if (userList != null) {
            for (User user : userList) {
                if (user.getUsername().equals(username)
                        && user.getPassword().equals(password)) {
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
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                           E M P L O Y E E                                  //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD EMPLOYEE">    
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
    public List<Employee> getAllEmployees() {
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
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                             C L I E N T                                    //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD CLIENT">    
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
    public List<Client> getAllClients() {
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
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                            S E R V I C E                                   //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD SERVICE">    
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
    public List<Service> getAllServices() {
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
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                            P A C K A G E                                   //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD PACKAGE">    
////////////////////////////// Create Zone /////////////////////////////////////
    public void createPackage(String[] service_code_list) {

        Package pkg = new Package();

        // Inicializo una lista para almacenar los servicios
        List<Service> services = new ArrayList<>();
        // Inicializo una acumulador de costo
        double total_cost_service = 0;

        // Itero en cada codigo de servicio
        for (String code : service_code_list) {

            // Convierdo el codigo a int ya que es el tipo de dato de la PK
            // a buscar.
            int service_code = Integer.parseInt(code);

            // Hallo el servicio y lo almaceno en una variable
            Service service = searchService(service_code);

            // Agrego el servicio a la lista de servicios
            services.add(service);

            // Obtengo el valor de ese servicio especifico y lo acumulo al total
            total_cost_service += service.getCost_service();
        }

        // Porcentaje de Descuento 
        double discount_percent = 10;

        // Aplico el Descuento
        double cost_with_discount = total_cost_service - (total_cost_service * (discount_percent / 100));

        // Seteo la lista de servicios con su costo ya calculado
        pkg.setList_of_services(services);
        pkg.setPackage_cost(cost_with_discount);

        controlPersis.createPackage(pkg);
    }

/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Package> getAllPackages() {
        return controlPersis.getAllPackages();
    }

    public Package searchPackage(int package_code) {
        return controlPersis.searchPackage(package_code);
    }

////////////////////////////// Update Zone ///////////////////////////////////// 
    public void updatePackage(Package pkg, String[] list_of_services) {

        // Inicializo una lista para almacenar los servicios
        List<Service> services = new ArrayList<>();
        // Inicializo una acumulador de costo
        double total_cost_service = 0;

        // Itero en cada codigo de servicio
        for (String code : list_of_services) {

            // Convierdo el codigo a int ya que es el tipo de dato de la PK
            // a buscar.
            int service_code = Integer.parseInt(code);

            // Hallo el servicio y lo almaceno en una variable
            Service service = this.searchService(service_code);

            // Agrego el servicio a la lista de servicios
            services.add(service);

            // Obtengo el valor de ese servicio especifico y lo acumulo al total
            total_cost_service += service.getCost_service();
        }

        // Porcentaje de Descuento 
        double discount_percent = 10;

        // Aplico el Descuento
        double cost_with_discount = total_cost_service - (total_cost_service * (discount_percent / 100));

        // Seteo la lista de servicios con su costo ya calculado
        pkg.setList_of_services(services);
        pkg.setPackage_cost(cost_with_discount);

        controlPersis.updatePackage(pkg);
    }

////////////////////////////// Delete Zone /////////////////////////////////////
    public void deletePackage(int package_code) {
        controlPersis.deletePackage(package_code);
    }//</editor-fold>

////////////////////////////////////////////////////////////////////////////////
//                               S A L E                                      //
////////////////////////////////////////////////////////////////////////////////
//<editor-fold defaultstate="collapsed" desc="CRUD SALE">    
////////////////////////////// Create Zone /////////////////////////////////////
    public void createSale(String payment_mehod, Date date_sale, int client_fk,
            int employee_fk, String service_code_fk, String package_code_fk) {

        Sale sale = new Sale();

        sale.setPayment_mehod(payment_mehod);
        sale.setDate_sale(date_sale);

        Client client = searchClient(client_fk);
        sale.setClient_fk(client);

        Employee employee = searchEmployee(employee_fk);
        sale.setEmployee_fk(employee);

        if (service_code_fk != null && !service_code_fk.isEmpty()) {
            int service_code_int = Integer.parseInt(service_code_fk);
            Service service = searchService(service_code_int);
            sale.setService_code_fk(service);
        } else {
            sale.setService_code_fk(null);
        }

        if (package_code_fk != null && !package_code_fk.isEmpty()) {
            int package_code_int = Integer.parseInt(package_code_fk);
            Package pkg = searchPackage(package_code_int);
            sale.setPackage_code_fk(pkg);
        } else {
            sale.setPackage_code_fk(null);
        }

        controlPersis.createSale(sale);

    }

/////////////////////////////// Read Zone //////////////////////////////////////
    public List<Sale> getAllSales() {
        return controlPersis.getAllSales();
    }

    public Sale searchSale(int sale_number) {
        return controlPersis.searchSale(sale_number);
    }

////////////////////////////// Update Zone /////////////////////////////////////
    public void updateSale(Sale sale) {
        controlPersis.updateSale(sale);
    }

////////////////////////////// Delete Zone /////////////////////////////////////
    public void deleteSale(int sale_number) {
        controlPersis.deleteSale(sale_number);
    }//</editor-fold>

}

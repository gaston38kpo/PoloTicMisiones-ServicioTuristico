package persistencia;

import logica.Employee;
import logica.User;


public class ControladoraPersistencia {
    
    ClientJpaController clientJPA = new ClientJpaController();
    EmployeeJpaController employeeJPA = new EmployeeJpaController();
    PackageJpaController packageJPA = new PackageJpaController();
    SaleJpaController saleJPA = new SaleJpaController();
    ServiceJpaController serviceJPA = new ServiceJpaController();
    UserJpaController userJPA = new UserJpaController();

    public void crearEmpleado(Employee employee, User user) {
        userJPA.create(user);
        employeeJPA.create(employee);
    }
}

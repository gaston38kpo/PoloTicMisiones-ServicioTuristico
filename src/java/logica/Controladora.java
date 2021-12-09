package logica;

import java.sql.Date;
import persistencia.ControladoraPersistencia;


public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void createEmployee(String first_name, String last_name, String street, String dni, Date birthdate, String nationality, String cellphone, String email, String position, double salary, String username, String password) {
        
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
        
        controlPersis.crearEmpleado(employee, user);
        
    }
    
}

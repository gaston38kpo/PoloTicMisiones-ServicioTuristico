package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Employee;
import logica.User;


@WebServlet(name = "SvEmployeeEdit", urlPatterns = {"/SvEmployeeEdit"})
public class SvEmployeeEdit extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Almacenando los nuevos datos
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String street = request.getParameter("street");
        String dni = request.getParameter("dni");
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));
        String nationality = request.getParameter("nationality");
        String cellphone = request.getParameter("cellphone");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        double salary = Double.parseDouble(request.getParameter("salary"));
        
        // Traigo el objeto con su respectivo ID
        Employee employee = control.searchEmployee(id);
        
        // Asignacion de los datos anteriormente almacenados al objeto
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
        
        // Se envia el objeto con los nuevos datos a la controladora para persistirlo
        control.updateEmployee(employee);
        
        // Regresa a la pagina para obervar el cambio
        response.sendRedirect("employees.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Traigo el objeto 
        Employee employee = control.searchEmployee(id);
        User user_fk = employee.getUser_fk();
        
        // Almaceno el objeto en la sesion
        HttpSession thisSession = request.getSession();
        thisSession.setAttribute("employee", employee);
        thisSession.setAttribute("user_fk", user_fk);
        
        // Redireccion al formulario de edicion
        response.sendRedirect("employees-edit.jsp");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

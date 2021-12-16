package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Employee;
import logica.User;

@WebServlet(name = "SvEmployee", urlPatterns = {"/SvEmployeeCreate",
    "/SvEmployeeDelete", "/SvEmployeeEdit", "/SvEmployeeRead"})
public class SvEmployee extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //<editor-fold defaultstate="collapsed" desc="[GET]ALL DECLARED VARIABLES">
        String action = request.getServletPath();

        int id;
        String first_name;
        String last_name;
        String street;
        String dni;
        Date birthdate;
        String nationality;
        String cellphone;
        String email;
        String position;
        double salary;
        String username;
        String password;

        Employee employee;
        User user_fk;
        int user_fk_id;
        User user;

//</editor-fold>
        switch (action) {
            case "/SvEmployeeCreate":
                //<editor-fold defaultstate="collapsed" desc="[GET]CREATE(Empty)">

//</editor-fold>
                break;
            case "/SvEmployeeDelete":
                //<editor-fold defaultstate="collapsed" desc="[GET]DELETE(Empty)">

//</editor-fold>
                break;
            case "/SvEmployeeEdit":
                //<editor-fold defaultstate="collapsed" desc="[GET]EDIT">

                // Se almacena el ID
                id = Integer.parseInt(request.getParameter("id"));

                // Almacenando los nuevos datos
                first_name = request.getParameter("first_name");
                last_name = request.getParameter("last_name");
                street = request.getParameter("street");
                dni = request.getParameter("dni");
                birthdate = Date.valueOf(request.getParameter("birthdate"));
                nationality = request.getParameter("nationality");
                cellphone = request.getParameter("cellphone");
                email = request.getParameter("email");
                position = request.getParameter("position");
                salary = Double.parseDouble(request.getParameter("salary"));
                username = request.getParameter("username");
                password = request.getParameter("password");

                // Traigo el objeto con su respectivo ID
                employee = control.searchEmployee(id);
                user_fk = employee.getUser_fk();
                user_fk_id = user_fk.getId();

                user = control.searchUser(user_fk_id);

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
                user.setUsername(username);
                user.setPassword(password);

                // Se envia el objeto con los nuevos datos a la controladora para persistirlo
                control.updateEmployee(employee);
                control.updateUser(user);

                // Regresa a la pagina para obervar el cambio
                response.sendRedirect("employees.jsp");

//</editor-fold>
                break;
            case "/SvEmployeeRead":
                //<editor-fold defaultstate="collapsed" desc="[GET]READ(Empty)">

//</editor-fold>
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //<editor-fold defaultstate="collapsed" desc="[POST]ALL DECLARED VARIABLES">
        String action = request.getServletPath();

        int id;
        String first_name;
        String last_name;
        String street;
        String dni;
        Date birthdate;
        String nationality;
        String cellphone;
        String email;
        String position;
        double salary;
        String username;
        String password;

        Employee employee;
        User user_fk;
        HttpSession thisSession;
        List<Employee> employeeList;

//</editor-fold>
        switch (action) {
            case "/SvEmployeeCreate":
                //<editor-fold defaultstate="collapsed" desc="[POST]CREATE">

                // Almacenando los datos
                first_name = request.getParameter("first_name");
                last_name = request.getParameter("last_name");
                street = request.getParameter("street");
                dni = request.getParameter("dni");
                birthdate = Date.valueOf(request.getParameter("birthdate"));
                nationality = request.getParameter("nationality");
                cellphone = request.getParameter("cellphone");
                email = request.getParameter("email");
                position = request.getParameter("position");
                salary = Double.parseDouble(request.getParameter("salary"));

                // Almacenando los datos de su usuario
                username = request.getParameter("username");
                password = request.getParameter("password");

                // Envio de datos a la controladora 
                control.createEmployee(first_name, last_name, street,
                        dni, birthdate, nationality, cellphone, email,
                        position, salary, username, password);

                // Redirecciona a si misma para ver el nuevo dato en la tabla.
                response.sendRedirect("employees.jsp");

//</editor-fold>
                break;
            case "/SvEmployeeDelete":
                //<editor-fold defaultstate="collapsed" desc="[POST]DELETE">

                // Se almacena el id del Empleado de ese momento del ciclo
                id = Integer.parseInt(request.getParameter("id"));

                // Se envia el dato a la controladora 
                control.deleteEmployee(id);

                // Regresa a la misma pagina para obervar el cambio
                response.sendRedirect("employees.jsp");

//</editor-fold>
                break;
            case "/SvEmployeeEdit":
                //<editor-fold defaultstate="collapsed" desc="[POST]EDIT">

                // Se almacena el ID
                id = Integer.parseInt(request.getParameter("id"));

                // Traigo el objeto 
                employee = control.searchEmployee(id);
                user_fk = employee.getUser_fk();

                // Almaceno el objeto en la sesion
                thisSession = request.getSession();
                thisSession.setAttribute("employee", employee);
                thisSession.setAttribute("user_fk", user_fk);

                // Redireccion al formulario de edicion
                response.sendRedirect("employees-edit.jsp");

//</editor-fold>
                break;
            case "/SvEmployeeRead":
                //<editor-fold defaultstate="collapsed" desc="[POST]READ">

                employeeList = control.getAllEmployees();

                thisSession = request.getSession();
                thisSession.setAttribute("employeeList", employeeList);

                response.sendRedirect("employees.jsp");

//</editor-fold>
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

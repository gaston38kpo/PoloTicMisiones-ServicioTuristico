package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvClientCreate", urlPatterns = {"/SvClientCreate"})
public class SvClientCreate extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Almacenando los datos 
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String street = request.getParameter("street");
        String dni = request.getParameter("dni");
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));
        String nationality = request.getParameter("nationality");
        String cellphone = request.getParameter("cellphone");
        String email = request.getParameter("email");

        // Envio de datos a la controladora 
        control.createClient(first_name, last_name, street, dni,
                birthdate, nationality, cellphone, email);
        
        // Redirecciona a si misma para ver el nuevo dato en la tabla.
        response.sendRedirect("clients.jsp");

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

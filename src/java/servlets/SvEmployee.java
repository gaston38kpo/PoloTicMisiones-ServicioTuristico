package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvEmployee", urlPatterns = {"/SvEmployee"})
public class SvEmployee extends HttpServlet {

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

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String street = request.getParameter("street");
        String dni = request.getParameter("dni");
        String nationality = request.getParameter("nationality");
        String cellphone = request.getParameter("cellphone");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        double salary = Double.parseDouble(request.getParameter("salary"));
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));

        String username = request.getParameter("username");
        //El parameter es el atributo 'name' de la etiqueta html
        String password = request.getParameter("password");

        control.createEmployee(first_name, last_name, street, dni,
                 birthdate, nationality, cellphone, email, position, salary, username, password);
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

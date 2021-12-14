package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;


@WebServlet(name = "SvUserCreate", urlPatterns = {"/SvUserCreate"})
public class SvUserCreate extends HttpServlet {

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
        
       // Almacenando los nuevos datos
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Envio de datos a la controladora 
        control.createUser(username, password);
        
        // Redirecciona a si misma para ver el nuevo dato en la tabla.
        response.sendRedirect("users.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

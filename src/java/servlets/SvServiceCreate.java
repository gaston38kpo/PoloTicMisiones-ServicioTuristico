package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvServiceCreate", urlPatterns = {"/SvServiceCreate"})
public class SvServiceCreate extends HttpServlet {

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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String destination = request.getParameter("destination");
        double cost_service = Double.parseDouble(request.getParameter("cost_service"));
        Date date_service = Date.valueOf(request.getParameter("date_service"));
        
        // Envio de datos a la controladora 
        control.createService(name, description, destination, cost_service, date_service);
        
        // Redirecciona a si misma para ver el nuevo dato en la tabla.
        response.sendRedirect("services.jsp");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

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
import logica.Service;


@WebServlet(name = "SvServiceEdit", urlPatterns = {"/SvServiceEdit"})
public class SvServiceEdit extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID
        int service_code = Integer.parseInt(request.getParameter("service_code"));
        
        // Almacenando los nuevos datos
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String destination = request.getParameter("destination");
        double cost_service = Double.parseDouble(request.getParameter("cost_service"));
        Date date_service = Date.valueOf(request.getParameter("date_service"));
        
        // Traigo el objeto con su respectivo ID
        Service service = control.searchService(service_code);
        
        // Asignacion de los datos anteriormente almacenados al objeto
        service.setName(name);
        service.setDescription(description);
        service.setDestination(destination);
        service.setCost_service(cost_service);
        service.setDate_service(date_service);
        
        // Se envia el objeto con los nuevos datos a la controladora para persistirlo
        control.updateService(service);
        
        // Regresa a la pagina para obervar el cambio
        response.sendRedirect("services.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID
        int service_code = Integer.parseInt(request.getParameter("service_code"));
        
        // Traigo el objeto 
        Service service = control.searchService(service_code);
        
        // Almaceno el objeto en la sesion
        HttpSession thisSession = request.getSession();
        thisSession.setAttribute("service", service);
        
        // Redireccion al formulario de edicion
        response.sendRedirect("services-edit.jsp");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

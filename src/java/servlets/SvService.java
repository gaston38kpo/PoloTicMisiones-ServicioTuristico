package servlets;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Service;

@WebServlet(name = "SvService", urlPatterns = {"/SvServiceCreate",
    "/SvServiceDelete", "/SvServiceEdit", "/SvServiceRead"})
public class SvService extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //<editor-fold defaultstate="collapsed" desc="[GET]ALL DECLARED VARIABLES">
        String action = request.getServletPath();

        int service_code;
        String name;
        String description;
        String destination;
        double cost_service;
        Date date_service = new Date();

        Service service;

//</editor-fold>
        switch (action) {
            case "/SvServiceCreate":
                //<editor-fold defaultstate="collapsed" desc="[GET]CREATE(Empty)">

//</editor-fold>
                break;
            case "/SvServiceDelete":
                //<editor-fold defaultstate="collapsed" desc="[GET]DELETE(Empty)">

//</editor-fold>
                break;
            case "/SvServiceEdit":
                //<editor-fold defaultstate="collapsed" desc="[GET]EDIT">

                // Se almacena el ID
                service_code = Integer.parseInt(request.getParameter("service_code"));

                // Almacenando los nuevos datos
                name = request.getParameter("name");
                description = request.getParameter("description");
                destination = request.getParameter("destination");
                cost_service = Double.parseDouble(request.getParameter("cost_service"));
                
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");                
                try {
                    date_service = formato.parse(request.getParameter("date_service"));
                } catch (ParseException ex) {
                    Logger.getLogger(SvClient.class.getName()).log(
                            Level.SEVERE, null, ex);
                }
                

                // Traigo el objeto con su respectivo ID
                service = control.searchService(service_code);

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

//</editor-fold>
                break;
            case "/SvServiceRead":
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

        int service_code;
        String name;
        String description;
        String destination;
        double cost_service;
        Date date_service = new Date();

        Service service;
        HttpSession thisSession;
        List<Service> serviceList;

//</editor-fold>
        switch (action) {
            case "/SvServiceCreate":
                //<editor-fold defaultstate="collapsed" desc="[POST]CREATE">

                // Almacenando los nuevos datos
                name = request.getParameter("name");
                description = request.getParameter("description");
                destination = request.getParameter("destination");
                cost_service = Double.parseDouble(request.getParameter("cost_service"));
                
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");                
                try {
                    date_service = formato.parse(request.getParameter("date_service"));
                } catch (ParseException ex) {
                    Logger.getLogger(SvClient.class.getName()).log(
                            Level.SEVERE, null, ex);
                }

                // Envio de datos a la controladora 
                control.createService(name, description, destination, cost_service, date_service);

                // Redirecciona a si misma para ver el nuevo dato en la tabla.
                response.sendRedirect("services.jsp");

//</editor-fold>
                break;
            case "/SvServiceDelete":
                //<editor-fold defaultstate="collapsed" desc="[POST]DELETE">

                // Se almacena el id de ese momento del ciclo
                service_code = Integer.parseInt(request.getParameter("service_code"));

                // Se envia el dato a la controladora 
                control.deleteService(service_code);

                // Regresa a la misma pagina para obervar el cambio
                response.sendRedirect("services.jsp");

//</editor-fold>
                break;
            case "/SvServiceEdit":
                //<editor-fold defaultstate="collapsed" desc="[POST]EDIT">
                
                // Se almacena el ID
                service_code = Integer.parseInt(request.getParameter("service_code"));

                // Traigo el objeto 
                service = control.searchService(service_code);

                // Almaceno el objeto en la sesion
                thisSession = request.getSession();
                thisSession.setAttribute("service", service);

                // Redireccion al formulario de edicion
                response.sendRedirect("services-edit.jsp");

//</editor-fold>
                break;
            case "/SvServiceRead":
                //<editor-fold defaultstate="collapsed" desc="[POST]READ">

                serviceList = control.getAllServices();

                thisSession = request.getSession();
                thisSession.setAttribute("serviceList", serviceList);

                response.sendRedirect("services.jsp");

//</editor-fold>
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

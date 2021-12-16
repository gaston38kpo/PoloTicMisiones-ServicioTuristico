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
import logica.Client;
import logica.Controladora;

@WebServlet(name = "SvClient", urlPatterns = {"/SvClientCreate", "/SvClientDelete",
    "/SvClientEdit", "/SvClientRead"})
public class SvClient extends HttpServlet {

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

        Client client;

//</editor-fold>
        switch (action) {
            case "/SvClientCreate":
                //<editor-fold defaultstate="collapsed" desc="[GET]CREATE(Empty)">

//</editor-fold>
                break;
            case "/SvClientDelete":
                //<editor-fold defaultstate="collapsed" desc="[GET]DELETE(Empty)">

//</editor-fold>
                break;
            case "/SvClientEdit":
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

                // Traigo el objeto con su respectivo ID
                client = control.searchClient(id);

                // Asignacion de los datos anteriormente almacenados al objeto
                client.setFirst_name(first_name);
                client.setLast_name(last_name);
                client.setStreet(street);
                client.setDni(dni);
                client.setBirthdate(birthdate);
                client.setNationality(nationality);
                client.setCellphone(cellphone);
                client.setEmail(email);

                // Se envia el objeto con los nuevos datos a la controladora para persistirlo
                control.updateClient(client);

                // Regresa a la pagina para obervar el cambio
                response.sendRedirect("clients.jsp");

//</editor-fold>
                break;
            case "/SvClientRead":
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

        Client client;
        HttpSession thisSession;
        List<Client> clientList;

//</editor-fold>
        switch (action) {
            case "/SvClientCreate":
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

                // Envio de datos a la controladora 
                control.createClient(first_name, last_name, street, dni,
                        birthdate, nationality, cellphone, email);

                // Redirecciona a si misma para ver el nuevo dato en la tabla.
                response.sendRedirect("clients.jsp");

//</editor-fold>
                break;
            case "/SvClientDelete":
                //<editor-fold defaultstate="collapsed" desc="[POST]DELETE">

                // Se almacena el id de ese momento del ciclo
                id = Integer.parseInt(request.getParameter("id"));

                // Se envia el dato a la controladora 
                control.deleteClient(id);

                // Regresa a la misma pagina para obervar el cambio
                response.sendRedirect("clients.jsp");

//</editor-fold>
                break;
            case "/SvClientEdit":
                //<editor-fold defaultstate="collapsed" desc="[POST]EDIT">

                // Se almacena el ID
                id = Integer.parseInt(request.getParameter("id"));

                // Traigo el objeto 
                client = control.searchClient(id);

                // Almaceno el objeto en la sesion
                thisSession = request.getSession();
                thisSession.setAttribute("client", client);

                // Redireccion al formulario de edicion
                response.sendRedirect("clients-edit.jsp");

//</editor-fold>
                break;
            case "/SvClientRead":
                //<editor-fold defaultstate="collapsed" desc="[POST]READ">

                clientList = control.getAllClients();

                thisSession = request.getSession();
                thisSession.setAttribute("clientList", clientList);

                response.sendRedirect("clients.jsp");

//</editor-fold>
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

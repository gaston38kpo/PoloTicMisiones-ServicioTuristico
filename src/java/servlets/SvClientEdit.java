package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Client;
import logica.Controladora;


@WebServlet(name = "SvClientEdit", urlPatterns = {"/SvClientEdit"})
public class SvClientEdit extends HttpServlet {

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
        
        // Traigo el objeto con su respectivo ID
        Client client = control.searchClient(id);
        
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
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Traigo el objeto 
        Client client = control.searchClient(id);
        
        // Almaceno el objeto en la sesion
        HttpSession thisSession = request.getSession();
        thisSession.setAttribute("client", client);
        
        // Redireccion al formulario de edicion
        response.sendRedirect("clients-edit.jsp");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

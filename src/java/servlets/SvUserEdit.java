package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.User;


@WebServlet(name = "SvUserEdit", urlPatterns = {"/SvUserEdit"})
public class SvUserEdit extends HttpServlet {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Traigo el objeto con su respectivo ID
        User user = control.searchUser(id);
        
        // Asignacion de los datos anteriormente almacenados al objeto
        user.setUsername(username);
        user.setPassword(password);
        
        // Se envia el objeto con los nuevos datos a la controladora para persistirlo
        control.updateUser(user);
        
        // Regresa a la pagina para obervar el cambio
        response.sendRedirect("users.jsp");
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Traigo el objeto 
        User user = control.searchUser(id);
        
        // Almaceno el objeto en la sesion
        HttpSession thisSession = request.getSession();
        thisSession.setAttribute("user", user);
        
        // Redireccion al formulario de edicion
        response.sendRedirect("users-edit.jsp");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

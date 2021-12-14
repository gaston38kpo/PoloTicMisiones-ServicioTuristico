package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;


@WebServlet(name = "SvEmployeeDelete", urlPatterns = {"/SvEmployeeDelete"})
public class SvEmployeeDelete extends HttpServlet {

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
        
        // Se almacena el id del Empleado de ese momento del ciclo
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Se envia el dato a la controladora 
        control.deleteEmployee(id);
        
        // Regresa a la misma pagina para obervar el cambio
        response.sendRedirect("employees.jsp");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
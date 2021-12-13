package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvPackageCreate", urlPatterns = {"/SvPackageCreate"})
public class SvPackageCreate extends HttpServlet {

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

        // Guardo los values seleccionados en una lista
        String[] service_code_list = request.getParameterValues("service_code");

        if (service_code_list.length < 2) {
            // Si no tiene mas de 1 servicio no hace nada y vuelve a la misma pagina
            response.sendRedirect("packages.jsp");
            
        } else {
        //  Los envio a la controladora
        control.createPackage(service_code_list);

        // Redirecciono a la misma pagina para ver el nuevo dato
        response.sendRedirect("packages.jsp");
        
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

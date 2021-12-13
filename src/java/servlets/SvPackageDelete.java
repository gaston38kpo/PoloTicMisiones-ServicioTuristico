package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;


@WebServlet(name = "SvPackageDelete", urlPatterns = {"/SvPackageDelete"})
public class SvPackageDelete extends HttpServlet {

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
        
        // Se almacena el id de ese momento del ciclo
        System.out.println(request.getParameter("package_code"));
        int package_code = Integer.parseInt(request.getParameter("package_code"));
        
        // Se envia el dato a la controladora 
        control.deletePackage(package_code);
        
        // Regresa a la misma pagina para obervar el cambio
        response.sendRedirect("packages.jsp");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

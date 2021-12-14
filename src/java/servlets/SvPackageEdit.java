package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Package;
import static logica.Package_.list_of_services;


@WebServlet(name = "SvPackageEdit", urlPatterns = {"/SvPackageEdit"})
public class SvPackageEdit extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID        
        int package_code = Integer.parseInt(request.getParameter("package_code"));
        
        // Almacenando los nuevos datos 
        String[] service_code_list = request.getParameterValues("service_code");
        
        // Chequeo que tenga mas de 1 item para saber si continuar con la edicion
        if (service_code_list.length < 2) {
            
            System.out.println("No se puede crear el paquete porque tiene menos de 2 items");
            
            response.sendRedirect("packages.jsp");     
            
        } else {            

        // Traigo el objeto con su respectivo ID
        Package pkg = control.searchPackage(package_code);
                
        // Se envia el objeto con los nuevos datos a la controladora para persistirlo
        control.updatePackage(pkg, service_code_list);
        
        // Regresa a la pagina para obervar el cambio
        response.sendRedirect("packages.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Se almacena el ID
        int package_code = Integer.parseInt(request.getParameter("package_code"));
        
        // Traigo el objeto 
        Package pkg = control.searchPackage(package_code);
        
        // Almaceno el objeto en la sesion
        request.getSession().setAttribute("pkg", pkg);
        
        // Redireccion al formulario de edicion
        response.sendRedirect("packages-edit.jsp");
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

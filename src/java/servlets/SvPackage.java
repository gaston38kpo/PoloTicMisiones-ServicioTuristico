package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Package;

@WebServlet(name = "SvPackage", urlPatterns = {"/SvPackageCreate", "/SvPackageDelete",
    "/SvPackageEdit", "/SvPackageRead"})
public class SvPackage extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //<editor-fold defaultstate="collapsed" desc="[GET]ALL DECLARED VARIABLES">
        String action = request.getServletPath();

        int package_code;
        String[] service_code_list;
        Package pkg;

//</editor-fold>
        switch (action) {
            case "/SvPackageCreate":
                //<editor-fold defaultstate="collapsed" desc="[GET]CREATE(Empty)">

//</editor-fold>
                break;
            case "/SvPackageDelete":
                //<editor-fold defaultstate="collapsed" desc="[GET]DELETE(Empty)">

//</editor-fold>
                break;
            case "/SvPackageEdit":
                //<editor-fold defaultstate="collapsed" desc="[GET]EDIT">

                // Se almacena el ID        
                package_code = Integer.parseInt(request.getParameter("package_code"));

                // Almacenando los nuevos datos 
                service_code_list = request.getParameterValues("service_code");

                // Chequeo que tenga mas de 1 item para saber si continuar con la edicion
                if (service_code_list.length < 2) {
                    System.out.println("No se puede crear el paquete porque tiene menos de 2 items");
                    response.sendRedirect("packages.jsp");
                } else {
                    // Traigo el objeto con su respectivo ID
                    pkg = control.searchPackage(package_code);

                    // Se envia el objeto con los nuevos datos a la controladora para persistirlo
                    control.updatePackage(pkg, service_code_list);

                    // Regresa a la pagina para obervar el cambio
                    response.sendRedirect("packages.jsp");
                }

//</editor-fold>
                break;
            case "/SvPackageRead":
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

        int package_code;

        HttpSession thisSession;
        String[] service_code_list;
        Package pkg;
        List<Package> packagetList;

//</editor-fold>
        switch (action) {
            case "/SvPackageCreate":
                //<editor-fold defaultstate="collapsed" desc="[POST]CREATE">

                // Guardo los values seleccionados en una lista
                service_code_list = request.getParameterValues("service_code");

                if (service_code_list.length < 2) {
                    System.out.println("No se puede crear el paquete porque tiene menos de 2 items");
                    // Si no tiene mas de 1 servicio no hace nada y vuelve a la misma pagina
                    response.sendRedirect("packages.jsp");

                } else {
                    //  Los envio a la controladora
                    control.createPackage(service_code_list);

                    // Redirecciono a la misma pagina para ver el nuevo dato
                    response.sendRedirect("packages.jsp");
                }
//</editor-fold>
                break;
            case "/SvPackageDelete":
                //<editor-fold defaultstate="collapsed" desc="[POST]DELETE">

                // Se almacena el id de ese momento del ciclo
                package_code = Integer.parseInt(request.getParameter("package_code"));

                // Se envia el dato a la controladora 
                control.deletePackage(package_code);

                // Regresa a la misma pagina para obervar el cambio
                response.sendRedirect("packages.jsp");

//</editor-fold>
                break;
            case "/SvPackageEdit":
                //<editor-fold defaultstate="collapsed" desc="[POST]EDIT">

                // Se almacena el ID
                package_code = Integer.parseInt(request.getParameter("package_code"));

                // Traigo el objeto 
                pkg = control.searchPackage(package_code);

                // Almaceno el objeto en la sesion
                thisSession = request.getSession();
                thisSession.setAttribute("pkg", pkg);

                // Redireccion al formulario de edicion
                response.sendRedirect("packages-edit.jsp");

//</editor-fold>
                break;
            case "/SvPackageRead":
                //<editor-fold defaultstate="collapsed" desc="[POST]READ">

                packagetList = control.getAllPackages();

                thisSession = request.getSession();
                thisSession.setAttribute("packagetList", packagetList);

                response.sendRedirect("packages.jsp");

//</editor-fold>
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

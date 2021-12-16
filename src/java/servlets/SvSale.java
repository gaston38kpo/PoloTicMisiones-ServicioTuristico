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
import logica.Employee;
import logica.Sale;
import logica.Service;
import logica.Package;

@WebServlet(name = "SvSale", urlPatterns = {"/SvSaleCreate", "/SvSaleDelete",
    "/SvSaleEdit", "/SvSaleRead"})
public class SvSale extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //<editor-fold defaultstate="collapsed" desc="[GET]ALL DECLARED VARIABLES">
        String action = request.getServletPath();

        int sale_number;
        String payment_mehod;
        Date date_sale;
        int client_id_fk;
        int employee_id_fk;
        String service_code_id_fk;
        String package_code_id_fk;

        Sale sale;
        Client client;
        Employee employee;

//</editor-fold>
        switch (action) {
            case "/SvSaleCreate":
                //<editor-fold defaultstate="collapsed" desc="[GET]CREATE(Empty)">

//</editor-fold>
                break;
            case "/SvSaleDelete":
                //<editor-fold defaultstate="collapsed" desc="[GET]DELETE(Empty)">

//</editor-fold>
                break;
            case "/SvSaleEdit":
                //<editor-fold defaultstate="collapsed" desc="[GET]EDIT">

                // Se almacena el ID
                sale_number = Integer.parseInt(request.getParameter("sale_number"));

                // Almacenando los nuevos datos
                payment_mehod = request.getParameter("payment_mehod");
                date_sale = Date.valueOf(request.getParameter("date_sale"));
                client_id_fk = Integer.parseInt(request.getParameter("client_fk"));
                employee_id_fk = Integer.parseInt(request.getParameter("employee_fk"));
                service_code_id_fk = request.getParameter("service_code_fk");
                package_code_id_fk = request.getParameter("package_code_fk");

                // Traigo el objeto con su respectivo ID
                sale = control.searchSale(sale_number);

                // Asignacion de los datos anteriormente almacenados al objeto        
                sale.setPayment_mehod(payment_mehod);
                sale.setDate_sale(date_sale);

                client = control.searchClient(client_id_fk);
                sale.setClient_fk(client);

                employee = control.searchEmployee(employee_id_fk);
                sale.setEmployee_fk(employee);

                if (service_code_id_fk != null && !service_code_id_fk.isEmpty()) {
                    int service_code_int = Integer.parseInt(service_code_id_fk);
                    Service service = control.searchService(service_code_int);
                    sale.setService_code_fk(service);
                } else {
                    sale.setService_code_fk(null);
                }

                if (package_code_id_fk != null && !package_code_id_fk.isEmpty()) {
                    int package_code_int = Integer.parseInt(package_code_id_fk);
                    Package pkg = control.searchPackage(package_code_int);
                    sale.setPackage_code_fk(pkg);
                } else {
                    sale.setPackage_code_fk(null);
                }

                // Se envia el objeto con los nuevos datos a la controladora para persistirlo
                control.updateSale(sale);

                // Regresa a la pagina para obervar el cambio
                response.sendRedirect("sales.jsp");

//</editor-fold>
                break;
            case "/SvSaleRead":
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

        int sale_number;
        String payment_mehod;
        Date date_sale;
        int client_id_fk;
        int employee_id_fk;
        String service_code_id_fk;
        String package_code_id_fk;

        Sale sale;
        Client client_fk;
        Employee employee_fk;
        Service service_code_fk;
        Package package_code_fk;
        HttpSession thisSession;
        List<Sale> saleList;

//</editor-fold>
        switch (action) {
            case "/SvSaleCreate":
                //<editor-fold defaultstate="collapsed" desc="[POST]CREATE">

                // Almacenando los datos
                payment_mehod = request.getParameter("payment_mehod");
                date_sale = Date.valueOf(request.getParameter("date_sale"));
                client_id_fk = Integer.parseInt(request.getParameter("client_fk"));
                employee_id_fk = Integer.parseInt(request.getParameter("employee_fk"));
                service_code_id_fk = request.getParameter("service_code_fk");
                package_code_id_fk = request.getParameter("package_code_fk");

                // Envio de datos a la controladora 
                control.createSale(payment_mehod, date_sale, client_id_fk, employee_id_fk,
                        service_code_id_fk, package_code_id_fk);

                // Redirecciona a si misma para ver el nuevo dato en la tabla.
                response.sendRedirect("sales.jsp");

//</editor-fold>
                break;
            case "/SvSaleDelete":
                //<editor-fold defaultstate="collapsed" desc="[POST]DELETE">

                // Se almacena el id de ese momento del ciclo
                sale_number = Integer.parseInt(request.getParameter("sale_number"));

                // Se envia el dato a la controladora 
                control.deleteSale(sale_number);

                // Regresa a la misma pagina para obervar el cambio
                response.sendRedirect("sales.jsp");

//</editor-fold>
                break;
            case "/SvSaleEdit":
                //<editor-fold defaultstate="collapsed" desc="[POST]EDIT">

                // Se almacena el ID
                sale_number = Integer.parseInt(request.getParameter("sale_number"));

                // Traigo el objeto
                sale = control.searchSale(sale_number);
                client_fk = sale.getClient_fk();
                employee_fk = sale.getEmployee_fk();
                service_code_fk = sale.getService_code_fk();
                package_code_fk = sale.getPackage_code_fk();

                // Almaceno el objeto en la sesion
                request.getSession().setAttribute("sale", sale);
                request.getSession().setAttribute("client_fk", client_fk);
                request.getSession().setAttribute("employee_fk", employee_fk);
                request.getSession().setAttribute("service_code_fk", service_code_fk);
                request.getSession().setAttribute("package_code_fk", package_code_fk);

                // Redireccion al formulario de edicion
                response.sendRedirect("sales-edit.jsp");

//</editor-fold>
                break;
            case "/SvSaleRead":
                //<editor-fold defaultstate="collapsed" desc="[POST]READ">

                saleList = control.getAllSales();

                thisSession = request.getSession();
                thisSession.setAttribute("saleList", saleList);

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

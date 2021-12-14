package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Client;
import logica.Controladora;
import logica.Employee;
import logica.Package;
import logica.Sale;
import logica.Service;

@WebServlet(name = "SvSaleEdit", urlPatterns = {"/SvSaleEdit"})
public class SvSaleEdit extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Se almacena el ID
        int sale_number = Integer.parseInt(request.getParameter("sale_number"));

        // Almacenando los nuevos datos
        String payment_mehod = request.getParameter("payment_mehod");
        Date date_sale = Date.valueOf(request.getParameter("date_sale"));
        int client_fk = Integer.parseInt(request.getParameter("client_fk"));
        int employee_fk = Integer.parseInt(request.getParameter("employee_fk"));
        String service_code_fk = request.getParameter("service_code_fk");
        String package_code_fk = request.getParameter("package_code_fk");

        // Traigo el objeto con su respectivo ID
        Sale sale = control.searchSale(sale_number);

        // Asignacion de los datos anteriormente almacenados al objeto        
        sale.setPayment_mehod(payment_mehod);
        sale.setDate_sale(date_sale);

        Client client = control.searchClient(client_fk);
        sale.setClient_fk(client);

        Employee employee = control.searchEmployee(employee_fk);
        sale.setEmployee_fk(employee);

        if (service_code_fk != null && !service_code_fk.isEmpty()) {
            int service_code_int = Integer.parseInt(service_code_fk);
            Service service = control.searchService(service_code_int);
            sale.setService_code_fk(service);
        } else {
            sale.setService_code_fk(null);
        }

        if (package_code_fk != null && !package_code_fk.isEmpty()) {
            int package_code_int = Integer.parseInt(package_code_fk);
            Package pkg = control.searchPackage(package_code_int);
            sale.setPackage_code_fk(pkg);
        } else {
            sale.setPackage_code_fk(null);
        }
        
        // Se envia el objeto con los nuevos datos a la controladora para persistirlo
        control.updateSale(sale);

        // Regresa a la pagina para obervar el cambio
        response.sendRedirect("sales.jsp");
 
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Se almacena el ID
        int sale_number = Integer.parseInt(request.getParameter("sale_number"));

        // Traigo el objeto
        Sale sale = control.searchSale(sale_number);
        Client client_fk = sale.getClient_fk();
        Employee employee_fk = sale.getEmployee_fk();
        Service service_code_fk = sale.getService_code_fk();
        logica.Package package_code_fk = sale.getPackage_code_fk();

        // Almaceno el objeto en la sesion
        request.getSession().setAttribute("sale", sale);
        request.getSession().setAttribute("client_fk", client_fk);
        request.getSession().setAttribute("employee_fk", employee_fk);
        request.getSession().setAttribute("service_code_fk", service_code_fk);
        request.getSession().setAttribute("package_code_fk", package_code_fk);

        // Redireccion al formulario de edicion
        response.sendRedirect("sales-edit.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

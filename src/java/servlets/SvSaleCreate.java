package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvSaleCreate", urlPatterns = {"/SvSaleCreate"})
public class SvSaleCreate extends HttpServlet {

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

        // Almacenando los datos
        String payment_mehod = request.getParameter("payment_mehod");
        Date date_sale = Date.valueOf(request.getParameter("date_sale"));
        int client_fk = Integer.parseInt(request.getParameter("client_fk"));
        int employee_fk = Integer.parseInt(request.getParameter("employee_fk"));
        String service_code_fk = request.getParameter("service_code_fk");      
        String package_code_fk = request.getParameter("package_code_fk");
        
        // Envio de datos a la controladora 
        control.createSale(payment_mehod, date_sale, client_fk, employee_fk,
                service_code_fk, package_code_fk);

        // Redirecciona a si misma para ver el nuevo dato en la tabla.
        response.sendRedirect("sales.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

<%@page import="logica.Sale"%>
<%@page import="logica.Package"%>
<%@page import="logica.Service"%>
<%@page import="logica.Client"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="logica.Employee" %>
<%@page import="java.util.List" %>
<%@page import="logica.Controladora" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/log-manager.css">
        <link rel="stylesheet" href="assets/css/form.css">

        <title>index</title>
    </head>

    <body>
        <%
            HttpSession thisSession = request.getSession();
            String user = (String) thisSession.getAttribute("username");
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>   

        <div class="logobar-default box-size">
            <a href="index.jsp">
                <h1>Agencia de Turismo UwU</h1>
            </a>
        </div>
    <navbar class="navbar-default box-size">
        <ul class="links">
            <li><a href="https://youtu.be/dQw4w9WgXcQ">
                    SOY UN LINK :D
                </a></li>
            <li><a href="#">
                    GITHUB
                </a></li>
            <li><a href="#">
                    SOBRE MI
                </a></li>
        </ul>
    </navbar>

    <main class="container-default box-size">
        <section class="form-section">

            <input type=checkbox id="show">
            <label class="show-btn" for="show">Registrar nueva Venta</label>

            <!-- Form to create new Sale -->
            <form id="content" action="SvSaleCreate" method="POST">

                <div class="form-group">

                    <h2>Informacion de Venta</h2>

                    <label for="payment_mehod_id">Metodo de pago*</label>
                    <select name="payment_mehod" id="payment_mehod_id" required>
                        <option disabled selected value> -- SELECCIONE UNA OPCION -- </option>

                        <optgroup label="SISTEMA DE COMISIONES AUN NO IMPLEMENTADO"></optgroup>
                        <optgroup label="Sin comisión">                            
                            <option value="efectivo">Efectivo</option>
                            <option value="monedero_virtual">Monedeo Virtual</option>
                        </optgroup>
                        <optgroup label="2.45%">                            
                            <option value="transferencia">Transferencia</option>
                        </optgroup>
                        <optgroup label="3%">                            
                            <option value="tarjeta_de_debito">Tarjeta de Débito</option>
                        </optgroup>
                        <optgroup label="9%">                            
                            <option value="tarjeta_de_credito">Tarjeta de Crédito</option>
                        </optgroup>
                    </select>

                    <label for="date_sale_id">Fecha de venta*</label>
                    <input type="date" name="date_sale" id="date_sale_id" required>


                    <label for="client_fk_id">CLIENTES*</label>
                    <select name="client_fk" id="client_fk_id" required>
                        <option disabled selected value> -- SELECCIONE UNA OPCION -- </option>
                        <%
                            Controladora control = new Controladora();

                            List<Client> clientList = control.getAllClients();

                            for (Client client : clientList) {
                        %>                  

                        <option value="<%= client.getId()%>">
                            <%= client.getDni()%> - <%= client.getLast_name()%> <%= client.getFirst_name()%>
                        </option>

                        <% }%>
                    </select>


                    <label for="employee_fk_id">EMPLEADOS*</label>
                    <select name="employee_fk" id="employee_fk_id" required>
                        <option disabled selected value> -- SELECCIONE UNA OPCION -- </option>
                        <%
                            List<Employee> employeeList = control.getAllEmployees();

                            for (Employee employee : employeeList) {
                        %>                  

                        <option value="<%= employee.getId()%>">
                            <%= employee.getLast_name()%> <%= employee.getFirst_name()%>
                        </option>

                        <% }%>
                    </select>


                    <label for="service_code_fk_id">SERVICIOS</label>
                    <select name="service_code_fk" id="service_code_fk_id" >
                        <option selected value> -- SELECCIONE UNA OPCION -- </option>
                        <%
                            List<Service> serviceList = control.getAllServices();

                            for (Service service : serviceList) {
                        %>                  

                        <option value="<%= service.getService_code()%>">
                            Servicio: <%= service.getName()%> (&dollar; <%= service.getCost_service()%>)
                        </option>

                        <% }%>
                    </select>


                    <label for="package_code_fk_id">PAQUETES</label>
                    <select name="package_code_fk" id="package_code_fk_id" >
                        <option selected value> -- SELECCIONE UNA OPCION -- </option>
                        <%
                            List<Package> packageList = control.getAllPackages();

                            for (Package pkg : packageList) {
                        %>                  

                        <option value="<%= pkg.getPackage_code()%>">
                            Codigo: <%= pkg.getPackage_code()%> (&dollar; <%= pkg.getPackage_cost()%> )
                        </option>

                        <% }%>
                    </select>


                </div>               
                <input type="submit" value="Crear Venta" class="submit-btn">
            </form>
        </section>


        <!-- List all sales on database -->

        <section class="log-section">
            <h2>Lista de Ventas</h2>
            <div class="table-wrapper">
                <table class="fl-table">
                    <thead class="log-header">
                        <tr>                                                    
                            <th></th>
                            <th>Numero de venta</th>
                            <th>Metodo de pago</th>
                            <th>Fecha de venta</th>
                            <th>Cliente</th>
                            <th>Empleado</th>
                            <th>Servicio(Si corresponde)</th>
                            <th>Paquete (Si corresponde)</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="log-body">
                        <%
                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");

                            List<Sale> saleList = control.getAllSales();

                            for (Sale sale : saleList) {

                                String sale_number = String.valueOf(sale.getSale_number());
                                String payment_method = sale.getPayment_mehod();
                                String date_sale = DATE_FORMAT.format(sale.getDate_sale());

                                Client client = sale.getClient_fk();
                                String client_dni;
                                try {
                                    client_dni = client.getDni();
                                } catch (Exception e) {
                                    client_dni = "-";
                                }

                                Employee employee = sale.getEmployee_fk();
                                String employee_last_name;
                                try {
                                    employee_last_name = employee.getLast_name();
                                } catch (Exception e) {
                                    employee_last_name = "-";
                                }
                                String employee_first_name;
                                try {
                                    employee_first_name = employee.getFirst_name();
                                } catch (Exception e) {
                                    employee_first_name = "";
                                }

                                Service service = sale.getService_code_fk();
                                String service_name;
                                try {
                                    service_name = service.getName();
                                } catch (Exception e) {
                                    service_name = "-";
                                }

                        %>
                        <tr>
                            <td>
                                <form class="form-edit" action="SvSaleEdit" method="POST">
                                        <input type="hidden" name="sale_number" value="<%= sale.getSale_number()%>">
                                        <button type="submit" class="edit-btn">Editar</button>
                                </form>
                            </td>
                            <td>
                                <%=sale_number%>
                            </td>
                            <td>
                                <%=payment_method%>
                            </td>
                            <td>
                                <%=date_sale%>
                            </td>
                            <td>
                                <%=client_dni%>
                            </td>
                            <td>
                                <%=employee_last_name%> <%=employee_first_name%>
                            </td>
                            <td>
                                <%=service_name%>
                            </td>        
                            <td>
                                <select>

                                    <%
                                        try {
                                            Package pkg = sale.getPackage_code_fk();

                                            for (Service pkgService : pkg.getList_of_services()) {
                                                String service_name_pkg = pkgService.getName();
                                                
                                                String service_cost_pkg = String.valueOf(pkgService.getCost_service());
                                                
                                    %>

                                    <option>
                                        Servicio: <%= service_name_pkg%> (&dollar; <%= service_cost_pkg%>)
                                    </option>

                                    <% }} catch (Exception e) {%>
                                    <option>
                                        -
                                    </option>
                                    <%}%>
                                </select> 
                            </td>
                            <td>
                                <form class="form-edit" action="SvSaleDelete" method="POST">
                                        <input type="hidden" name="sale_number" value="<%= sale.getSale_number()%>">
                                        <button type="submit" class="delete-btn">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

    <footer class="box-size">
        <p>
            Hecho con ♥ por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
        </p>
    </footer>
    <% }%>
</body>
</html>
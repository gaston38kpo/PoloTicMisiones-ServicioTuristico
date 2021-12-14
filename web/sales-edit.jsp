<%@page import="logica.Service"%>
<%@page import="logica.Package"%>
<%@page import="logica.Employee"%>
<%@page import="logica.Sale"%>
<%@page import="logica.Client"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.List" %>
<%@page import="logica.Controladora" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/log-manager.css">
        <link rel="stylesheet" href="assets/css/form.css">

        <title>index</title>
        <script>
            function toggle() {
                let service = document.getElementById('service_code_fk_id');
                let package = document.getElementById('package_code_fk_id');

                if (document.getElementById('toggle_id').checked) {
                    service.disabled = !service.disabled;
                    package.disabled = !package.disabled;
                    package.value = "";
                } else {
                    service.disabled = !service.disabled;
                    package.disabled = !package.disabled;
                    service.value = "";
                }
            }
        </script>
    </head>

    <body>         

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
            <label class="show-btn" for="show">Editar Venta</label>

            <!-- Form to edit sale -->
            <form action="SvSaleEdit" method="GET">

                <%
                    Controladora control = new Controladora();

                    Sale sale = (Sale) request.getSession().getAttribute("sale");

                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
                    String date_sale = DATE_FORMAT.format(sale.getDate_sale());

                    Client client_fk = sale.getClient_fk();
                    Employee employee_fk = sale.getEmployee_fk();

                    Service service_code_fk;
                    try {
                        service_code_fk = sale.getService_code_fk();
                    } catch (Exception e) {
                        service_code_fk = null;
                    }
                    Package package_code_fk;
                    try {
                        package_code_fk = sale.getPackage_code_fk();
                    } catch (Exception e) {
                        package_code_fk = null;
                    }


                %>

                <div class="form-group">


                    <h2>Informacion de Venta</h2>
                    <input type="hidden" name="sale_number" value="<%= sale.getSale_number()%>">

                    <label for="payment_mehod_id">Metodo de pago*</label>
                    <select name="payment_mehod" id="payment_mehod_id" required>
                        <option disabled selected value> -- SELECCIONE UNA OPCION -- </option>

                        <optgroup label="SISTEMA DE COMISIONES AUN NO IMPLEMENTADO"></optgroup>
                        <optgroup label="Sin comisión" >                            
                            <option value="Efectivo" <%= (sale.getPayment_mehod().equals("Efectivo"))?"selected":""%>>Efectivo</option>
                            <option value="Monedero Virtual" <%= (sale.getPayment_mehod().equals("Monedero Virtual"))?"selected":""%>>Monedero Virtual</option>
                        </optgroup>
                        <optgroup label="2.45%">                            
                            <option value="Transferencia" <%= (sale.getPayment_mehod().equals("Transferencia"))?"selected":""%>>Transferencia</option>
                        </optgroup>
                        <optgroup label="3%">                            
                            <option value="Tarjeta de Debito" <%= (sale.getPayment_mehod().equals("Tarjeta de Debito"))?"selected":""%>>Tarjeta de D&eacute;bito</option>
                        </optgroup>
                        <optgroup label="9%">                            
                            <option value="Tarjeta de Credito" <%= (sale.getPayment_mehod().equals("Tarjeta de Credito"))?"selected":""%>>Tarjeta de Cr&eacute;dito</option>
                        </optgroup>
                    </select>

                    <label for="date_sale_id">Fecha de venta*</label>
                    <input type="date" name="date_sale" id="date_sale_id" value="<%= date_sale%>" required>


                    <label for="client_fk_id">CLIENTES*</label>
                    <select name="client_fk" id="client_fk_id" required>                        
                        <%
                            List<Client> clientList = control.getAllClients();

                            for (Client client : clientList) {
                        %>                  

                        <option value="<%= client.getId()%>" <%= (client.getId() == client_fk.getId()) ? "selected" : ""%>>
                            <%= client.getDni()%> - <%= client.getLast_name()%> <%= client.getFirst_name()%>
                        </option>

                        <% }%>
                    </select>


                    <label for="employee_fk_id">EMPLEADOS*</label>
                    <select name="employee_fk" id="employee_fk_id" required>                        
                        <%
                            List<Employee> employeeList = control.getAllEmployees();

                            for (Employee employee : employeeList) {
                        %>                  

                        <option value="<%= employee.getId()%>" <%= (employee.getId() == employee_fk.getId()) ? "selected" : ""%>>
                            <%= employee.getLast_name()%> <%= employee.getFirst_name()%>
                        </option>

                        <% }%>
                    </select>

                    <div>
                        <input type="checkbox" id="toggle_id" checked="checked" onclick="toggle()">
                        <label for="toggle_id">SERVICIO/PAQUETE</label>
                    </div>


                    <label for="service_code_fk_id">SERVICIOS</label>
                    <select name="service_code_fk" id="service_code_fk_id" <%= (service_code_fk == null) ? "disabled" : ""%>>
                        <%= (service_code_fk == null) ? "<option selected value> -- SELECCIONE UNA OPCION -- </option>" : "<option value> -- SELECCIONE UNA OPCION -- </option>"%>
                        <%
                            List<Service> serviceList = control.getAllServices();

                            for (Service service : serviceList) {
                                try {
                        %>                  

                        <option value="<%= service.getService_code()%>" <%=  (service.getService_code() == service_code_fk.getService_code()) ? "selected" : ""%>>
                            Servicio: <%= service.getName()%> (&dollar; <%= service.getCost_service()%>)
                        </option>

                        <% } catch (Exception e) {%>
                        <option value="<%= service.getService_code()%>" >
                            Servicio: <%= service.getName()%> (&dollar; <%= service.getCost_service()%>)
                        </option>
                        <% }%>
                        <% }%>
                    </select>


                    <label for="package_code_fk_id">PAQUETES</label>
                    <select name="package_code_fk" id="package_code_fk_id" <%= (package_code_fk == null) ? "disabled" : ""%>>
                        <%= (package_code_fk == null) ? "<option selected value> -- SELECCIONE UNA OPCION -- </option>" : "<option value> -- SELECCIONE UNA OPCION -- </option>"%>
                        <%
                            List<Package> packageList = control.getAllPackages();

                            for (Package pkg : packageList) {
                                try {
                        %>                  

                        <option value="<%= pkg.getPackage_code()%>" <%= (pkg.getPackage_code() == package_code_fk.getPackage_code()) ? "selected" : ""%>>
                            Codigo: <%= pkg.getPackage_code()%> (&dollar; <%= pkg.getPackage_cost()%> )
                        </option>

                        <% } catch (Exception e) {%>
                        <option value="<%= pkg.getPackage_code()%>">
                            Codigo: <%= pkg.getPackage_code()%> (&dollar; <%= pkg.getPackage_cost()%> )
                        </option>
                        <% }%>
                        <% }%>
                    </select>

                </div>                  

                <input type="submit" value="Modificar Venta" class="submit-btn">

            </form>
        </section>

    </main>

    <footer class="box-size">
        <p>
            Hecho con ♥ por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
        </p>
    </footer>

</body>
</html>
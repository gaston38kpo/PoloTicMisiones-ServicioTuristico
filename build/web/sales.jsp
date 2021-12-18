<%@page import="logica.Sale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Service"%>
<%@page import="logica.Package"%>
<%@page import="logica.Employee"%>
<%@page import="logica.Client"%>
<%@page import="logica.User"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="assets/css/index.css">
        <link rel="stylesheet" href="assets/css/form-neon.css">
        <link rel="stylesheet" href="assets/css/log-neon.css">
        <link rel="stylesheet" href="assets/css/checkbox.css">

        <link rel="shortcut icon"
              href="https://img.icons8.com/external-becris-lineal-color-becris/64/000000/external-analytics-digital-economy-becris-lineal-color-becris-3.png"
              type="image/x-icon">

        <title>Agencia de Turismo</title>

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

        <style>
            .container-form .row100 .col .input-box .line {
                background: #ffffff3d;
                border: 1px solid black;
                border-radius: 4px;
            }
            .container-form .row100 .col input[type="date"]:valid {
                color: #fff;
                text-shadow: 0 0 56px #fff, 0 0 16px #000;
            }
            .container-form .row100 .col input[type="date"] {
                text-align: center;
            }
            .container-form .row100 .col select {
                width: 100%;
            }
            .container-form .row100 .col .checkbox-sp {
                background: #0000005a;
                padding: 8px;
                border-radius: 4px;
                color: white;
                font-weight: 400;
            }
        </style>

    </head>

    <body>

        <%
            HttpSession thisSession = request.getSession();

            String userSession = (String) thisSession.getAttribute("username");

            if (userSession == null) {
                response.sendRedirect("login.jsp");
            } else if (userSession != null) {
        %>

        <nav class="navbar">
            <section class="buttons">
                <div class="outer button">
                    <a href="index.jsp">
                        HOME
                    </a>
                    <span></span>
                    <span></span>
                </div>
                <div class="outer button" title="ola ke mira">
                    <a target="_blank" href="https://youtu.be/dQw4w9WgXcQ">
                        easter-egg
                    </a>
                    <span></span>
                    <span></span>
                </div>
                <div class="outer button">
                    <a href="https://github.com/gaston38kpo/servicio-turistico">
                        GITHUB
                    </a>
                    <span></span>
                    <span></span>
                </div>
                <div class="outer button">
                    <a href="https://www.linkedin.com/in/gaston-giacobini/">
                        SOBRE MI
                    </a>
                    <span></span>
                    <span></span>
                </div>
            </section>
            <section class="profits-nav">
                <% Sale saleEarnings = new Sale(); %>
                <span>Promedio de Ganancias Diarias : &dollar;<%= saleEarnings.getDailyEarnings() %></span>
                <span>Promedio de Ganancias Mensuales : &dollar;<%= saleEarnings.getMonthlyEarnings() %></span>
            </section>
            <section class="username-nav">
                <%
                    thisSession = request.getSession();

                    userSession = (String) thisSession.getAttribute("username");

                    if (userSession != null) {%>
                <p>Bienvenido 
                    <strong>
                        <%= request.getSession().getAttribute("username")%>
                    </strong> !
                </p>
                <form id="form-logout" action="SvUserLogout" method="POST">
                    <input type="hidden" name="logout" value="true">
                    <button type="submit">
                        <img src="https://img.icons8.com/ios-glyphs/30/ffffff/logout-rounded-left.png"/>
                    </button>
                </form>

                <%}%>

            </section>
        </nav>

        <main class="main-crud">

            <section class="section-form">

                <!-- Formulario de creacion -->
                <form class="container-form" action="SvSaleCreate" method="POST">

                    <h2>Nueva Venta</h2>

                    <br>

                    <h2>Informacion de Venta</h2>



                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="date" name="date_sale" required>
                                <span class="text">Fecha de venta*</span>
                                <span class="line"></span>
                            </div>
                        </div>                        
                    </div>

                    <div class="row100">
                        <div class="col">
                            <select name="payment_mehod" id="payment_mehod_id" required>
                                <option disabled selected value> -- METODO DE PAGO -- </option>
                                <optgroup label="Sin comisión">                            
                                    <option value="efectivo">Efectivo</option>
                                    <option value="Monedero Virtual">Monedero Virtual</option>
                                </optgroup>
                                <optgroup label="2.45%">                            
                                    <option value="Transferencia">Transferencia</option>
                                </optgroup>
                                <optgroup label="3%">                            
                                    <option value="Tarjeta de Debito">Tarjeta de D&eacute;bito</option>
                                </optgroup>
                                <optgroup label="9%">                            
                                    <option value="Tarjeta de Credito">Tarjeta de Cr&eacute;dito</option>
                                </optgroup>
                            </select>
                        </div>
                    </div>



                    <div class="row100">
                        <div class="col">
                            <select name="client_fk" id="client_fk_id" required>
                                <option disabled selected value> -- CLIENTES -- </option>
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
                        </div>
                        <div class="col">
                            <select name="employee_fk" id="employee_fk_id" required>
                                <option disabled selected value> -- EMPLEADOS -- </option>
                                <%
                                    List<Employee> employeeList = control.getAllEmployees();

                                    for (Employee employee : employeeList) {
                                %>                  

                                <option value="<%= employee.getId()%>">
                                    <%= employee.getLast_name()%> <%= employee.getFirst_name()%>
                                </option>

                                <% }%>

                            </select>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col label">           
                            <h3 class="label-switch">                                
                                <span class="blue">Servicio</span>/<span class="white">Paquete</span>
                            </h3>

                        </div>
                        <div class="col checkbox">
                            <input type="checkbox" id="toggle_id" onclick="toggle()" checked>                                    
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col select">
                            <select name="service_code_fk" id="service_code_fk_id" >
                                <option selected value> -- SERVICIOS -- </option>
                                <%
                                    List<Service> serviceList = control.getAllServices();

                                    for (Service service : serviceList) {
                                %>                  

                                <option value="<%= service.getService_code()%>">
                                    Servicio: <%= service.getName()%> (&dollar; <%= service.getCost_service()%>)
                                </option>

                                <% }%>

                            </select>
                        </div>
                        <div class="col">
                            <select name="package_code_fk" id="package_code_fk_id" disabled>
                                <option selected value> -- PAQUETES -- </option>
                                <%
                                    List<Package> packageList = control.getAllPackages();

                                    for (Package pkg : packageList) {
                                %>                  

                                <option value="<%= pkg.getPackage_code()%>">
                                    Codigo: <%= pkg.getPackage_code()%> (&dollar; <%= pkg.getPackage_cost()%>). Cant. servicios: <%= pkg.getList_of_services().size()%> 
                                </option>

                                <% }%>

                            </select>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="col">
                            <input type="submit" value="Crear" class="submit-btn">
                        </div>
                    </div>

                </form>

            </section>


            <!-- Tabla con todos los datos listados -->        
            <section class="section-log">

                <h1 contenteditable="true" class="title-log"><span>List&lt;&gt; Ventas</span></h1>

                <table class="container">
                    <thead>
                        <tr>
                            <th><h1></h1></th>
                            <th><h1>Numero de venta</h1></th>
                            <th><h1>Metodo de pago</h1></th>
                            <th><h1>Fecha de venta</h1></th>
                            <th><h1>Cliente (DNI)</h1></th>
                            <th><h1>Empleado</h1></th>
                            <th><h1>Servicio (Si corresponde)</h1></th>
                            <th><h1>Paquete (Si corresponde)</h1></th>
                            <th><h1>Costo final(Comision incluida)</h1></th>
                            <th><h1></h1></th>
                        </tr>
                    </thead>
                    <tbody>
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
                            <td class="td-edit-btn">
                                <form class="form-edit" action="SvSaleEdit" method="POST">
                                    <input type="hidden" name="sale_number" value="<%= sale.getSale_number()%>">
                                    <button type="submit" class="edit-btn"><span>EDITAR</span></button>
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

                                    <% }
                                    } catch (Exception e) {%>
                                    <option>
                                        -
                                    </option>
                                    <%}%>
                                </select> 
                            </td>
                            
                            <% if (sale.getPackage_code_fk() == null) {%>
                            
                            <td>
                                <%= sale.getSaleCost(sale.getService_code_fk().getCost_service(), sale.getPayment_mehod()) %>
                            </td> 
                            <%} else {%>
                            
                            <td>
                                <%= sale.getSaleCost(sale.getPackage_code_fk().getPackage_cost(), sale.getPayment_mehod()) %>
                            </td> 
                            
                            <%}%>
                            <td class="td-delete-btn">
                                <form class="form-delete" action="SvSaleDelete" method="POST">
                                    <input type="hidden" name="sale_number" value="<%= sale.getSale_number()%>">
                                    <button type="submit" class="delete-btn"><span>ELIMINAR</span></button>
                                </form>
                            </td>
                        </tr>
                        <% }%>

                    </tbody>
                </table>

            </section>

        </main>
        <footer class="box-size">
            <p>
                Hecho con &hearts; por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
            </p>
        </footer>

        <% }%>
    </body>

</html>
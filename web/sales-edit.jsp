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
                <form class="container-form" action="SvSaleEdit" method="GET">

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
                        System.out.println(sale.getPayment_mehod());

                    %>

                    <h2>Editar Venta</h2>

                    <br>

                    <h2>Informacion de Venta</h2>

                    <input type="hidden" name="sale_number" value="<%= sale.getSale_number()%>">

                    <div class="row100">
                        <div class="col">
                            <div class="input-box">
                                <input type="date" name="date_sale" value="<%= date_sale%>" required>
                                <span class="text">Fecha de venta*</span>
                                <span class="line"></span>
                            </div>
                        </div>                        
                    </div>

                    <div class="row100">
                        <div class="col">
                            <select name="payment_mehod" id="payment_mehod_id" required>
                                <option disabled selected value> -- SELECCIONE UNA OPCION -- </option>

                                <optgroup label="SISTEMA DE COMISIONES AUN NO IMPLEMENTADO"></optgroup>
                                <optgroup label="Sin comisión" >                            
                                    <option value="Efectivo" <%= (sale.getPayment_mehod().equals("Efectivo")) ? "selected" : ""%>>Efectivo</option>
                                    <option value="Monedero Virtual" <%= (sale.getPayment_mehod().equals("Monedero Virtual")) ? "selected" : ""%>>Monedero Virtual</option>
                                </optgroup>
                                <optgroup label="2.45%">                            
                                    <option value="Transferencia" <%= (sale.getPayment_mehod().equals("Transferencia")) ? "selected" : ""%>>Transferencia</option>
                                </optgroup>
                                <optgroup label="3%">                            
                                    <option value="Tarjeta de Debito" <%= (sale.getPayment_mehod().equals("Tarjeta de Debito")) ? "selected" : ""%>>Tarjeta de D&eacute;bito</option>
                                </optgroup>
                                <optgroup label="9%">                            
                                    <option value="Tarjeta de Credito" <%= (sale.getPayment_mehod().equals("Tarjeta de Credito")) ? "selected" : ""%>>Tarjeta de Cr&eacute;dito</option>
                                </optgroup>
                            </select>
                        </div>
                    </div>



                    <div class="row100">
                        <div class="col">
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
                        </div>
                        <div class="col">
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
                        </div>
                        <div class="col">
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
                    </div>

                    <div class="row100">
                        <div class="col">
                            <input type="submit" value="Editar" class="submit-btn">
                        </div>
                    </div>

                </form>

            </section>




        </main>
        <footer class="box-size">
            <p>
                Hecho con &hearts; por Gaston Giacobini (Proyecto Polo Tic Misiones 2021)
            </p>
        </footer>

        <% }%>
        <script src="assets/js/global.js"></script>
    </body>

</html>
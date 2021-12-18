<%@page import="logica.Sale"%>
<%@page import="logica.Package"%>
<%@page import="logica.Service"%>
<%@page import="logica.Client"%>
<%@page import="logica.Employee"%>
<%@page import="java.text.SimpleDateFormat"%>
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

        <link rel="shortcut icon"
              href="https://img.icons8.com/external-becris-lineal-color-becris/64/000000/external-analytics-digital-economy-becris-lineal-color-becris-3.png"
              type="image/x-icon">

        <title>Agencia de Turismo</title>

        <style>
            .row100 .col {
                text-shadow: 1px 0 2px black, -1px 0 2px black, 0 1px 2px black;
                font-size: 21px;
            }
            .section-log {
                width: 60%;
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
                <form class="container-form" action="SvPackageCreate" method="POST">

                    <h2>Crear Paquete</h2>

                    <br>

                    <h2>Informacion del Paquete</h2>


                    <div class="row100">

                        <%
                            Controladora control = new Controladora();

                            List<Service> serviceList = control.getAllServices();

                            for (Service service : serviceList) {

                                String name = service.getName();
                        %>

                        <div class="col">

                            <label  class="checkbox-label" >
                                <input 
                                    type="checkbox"
                                    name="service_code"
                                    value="<%= service.getService_code()%>">
                                <%= name%>
                            </label>


                        </div>
                        <%}%>                        
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

                <h1 contenteditable="true" class="title-log"><span>List&lt;&gt; Paquetes</span></h1>

                <table class="container">
                    <thead>
                        <tr>
                            <th><h1></h1></th>
                            <th><h1>Codigo</h1></th>
                            <th><h1>Servicios incluidos</h1></th>
                            <th><h1>Costo del paquete</h1></th>
                            <th><h1></h1></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Package> packageList = control.getAllPackages();

                            for (Package pkg : packageList) {

                                List<Service> packageServiceList = pkg.getList_of_services();

                                int package_code = pkg.getPackage_code();
                        %>

                        <tr>
                            <td class="td-edit-btn">
                                <form class="form-edit" action="SvPackageEdit" method="POST">
                                    <input type="hidden" name="package_code" value="<%= package_code%>">
                                    <button type="submit" class="edit-btn"><span>EDITAR</span></button>
                                </form>
                            </td>
                            <td><%= package_code%></td>
                            <td>
                                <select>

                                    <%for (Service pkgService : packageServiceList) {%>

                                    <option>
                                        <%= pkgService.getName()%>
                                    </option>

                                    <% }%>
                                </select> 
                            </td>
                            <td>&dollar;<%= pkg.getPackage_cost()%></td>
                            <td class="td-delete-btn">
                                <form class="form-delete" action="SvPackageDelete" method="POST" >
                                    <input type="hidden" name="package_code" value="<%= package_code%>">
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
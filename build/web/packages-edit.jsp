<%@page import="java.util.ArrayList"%>
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
            <section class="username-nav">
                <p>Bienvenido <strong>
                        <%= request.getSession().getAttribute("username")%>
                    </strong> !</p>
            </section>
        </nav>

        <main class="main-crud">

            <section class="section-form">

                <!-- Formulario de creacion -->
                <form class="container-form" action="SvPackageEdit" method="GET">

                    <h2>Editar Paquete</h2>

                    <br>

                    <h2>Informacion del Paquete</h2>


                    <div class="row100">

                        <%
                            Controladora control = new Controladora();

                            // SERVICIOS EN EL PAQUETE
                            Package pkg = (Package) request.getSession().getAttribute("pkg");
                            List<Service> list_of_services = pkg.getList_of_services();

                            // TODOS LOS SERVICIOS 
                            List<Service> serviceList = control.getAllServices();

                            // A LA LISTA COMPLETA SE LE RESTAN LOS SERVICIOS DEL PAQUETE
                            List<Service> newServiceList = new <Service> ArrayList();

                            // (1) RECORRO LOS SERVICIOS DE MI PAQUETE Y LOS MUESTRO
                            for (Service serviceInPkg : list_of_services) {
                        %>

                        <div class="col">

                            <label  class="checkbox-label" >
                                <input 
                                    type="checkbox" 
                                    name="service_code" 
                                    value="<%= serviceInPkg.getService_code()%>" 
                                    checked="checked">
                                <%= serviceInPkg.getName()%>
                            </label>

                        </div>

                        <%
                                // (2) RECORRO TODOS LOS SERVICIOS DE LA BD
                                for (Service service : serviceList) {
                                    // (3) VALIDACION 1: SI NO COINCIDEN LAS PK CONTINÚA (ESTO ES PARA MOSTRAR SOLO LOS QUE NO TIENE MI PAQUETE)
                                    if (serviceInPkg.getService_code() != service.getService_code()) {
                                        boolean exist = false;

                                        // (4) RECORRO LOS SERVICIOS DE MI PAQUETE
                                        for (Service serviceRecheck : list_of_services) {
                                            // (5) VALIDACION 2: SI COINCIDE EL SERVICIO DE LA BD CON EL DE LA PK CONTINÚA
                                            if (service.getService_code() == serviceRecheck.getService_code()) {
                                                exist = true;
                                                break;
                                            }
                                        }
                                        for (Service serviceCheck : newServiceList) {
                                            if (service.getService_code() == serviceCheck.getService_code()) {
                                                exist = true;
                                                break;
                                            }
                                        }
                                        if (!exist) {
                                            newServiceList.add(service);
                                        }
                                    }
                                }
                            }%>

                        <% for (Service service : newServiceList) {%>

                        <div class="col">

                            <label  class="checkbox-label" >
                                <input 
                                    type="checkbox" 
                                    name="service_code" 
                                    value="<%= service.getService_code()%>">
                                <%= service.getName()%>
                            </label>

                        </div>

                        <%}%>

                    </div>

                    <input type="hidden" name="package_code" value="<%= pkg.getPackage_code()%>">

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
    </body>

</html>
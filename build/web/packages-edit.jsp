<%@page import="java.util.ArrayList"%>
<%@page import="logica.Package"%>
<%@page import="logica.Service"%>
<%@page import="logica.User" %>
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
        <style>
            .table-wrapper{
                max-width: 60%;
                margin: 0 auto;
            }
            .box-size {
                max-width: 60%;
                min-width: 825px;
            }
        </style>
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
            <label class="show-btn" for="show">Editar Paquete</label>

            <!-- Form to edit package -->
            <form action="SvPackageEdit" method="GET">

                <h2>Paquete</h2> 

                <div class="form-group">

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

                    <label  class="checkbox-label" >
                        <input type="checkbox" name="service_code" value="<%= serviceInPkg.getService_code()%>" checked="checked">
                        <%= serviceInPkg.getName()%>
                    </label>

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

                    <label  class="checkbox-label" >
                        <input type="checkbox" name="service_code" value="<%= service.getService_code()%>">
                        <%= service.getName()%>
                    </label>

                    <%}%>
                </div>
                <input type="hidden" name="package_code" value="<%= pkg.getPackage_code()%>">
                <input type="submit" value="Modificar Paquete" class="submit-btn">

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